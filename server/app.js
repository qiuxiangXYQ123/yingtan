//app.js 服务器端程序
//1:下载三个模块 
//  cors            完成跨域处理
//  express-session session对象
//  mysql           数据库驱动
//  express         web服务器
//下载命令在线  
//npm i cors express-session express  mysql
//2:将以上四个模块引入到当程序
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const session = require("express-session");
//3:创建数据库连接池(池 提高效率)
var pool = mysql.createPool({
    host: "127.0.0.1", //数据库地址
    user: "root",      //数据库用户名
    password: "",      //数据库密码
    port: 3306,      //数据库端口
    database: "movie",//库名
    connectionLimit: 15//15连接
})
//4:配置跨域模块
//  允许哪个程序跨域访问服务器
//  脚手架:3001 允许3001访问我
//  服务器:4000 你
var server = express();
server.use(cors({
    //允许程序列表
    origin: ["http://127.0.0.1:3001", "http://localhost:3001"],
    credentials: true//每次请求需要验证
}))
//5:配置session模块?????????
server.use(session({
    secret: "128位字符串",//安全字符串
    resave: true,//请求时更新数据
    saveUninitialized: true//保存初始数据
}))
//6:配置项目静态目录 public
server.use(express.static("public"))
//7:创建express对象绑定4000端口
server.listen(4000);
//注册接口
server.get('/reg', (req, res) => {
    var $phone = req.query.phone;
    var $upwd = req.query.upwd;
    var $uname = req.query.uname;
    var sql = "insert into user set phone=?,upwd=md5(?),uname=?";
    pool.query(sql, [$phone, $upwd, $uname], (err, result) => {
        if (result.affectedRows > 0) {
            res.send({ code: 1, msg: "注册成功" });
        } else {
            res.send({ code: -1, msg: "注册失败" });
        }
    });
});
//登录接口
server.get('/login', (req, res) => {
    var $phone = req.query.phone;
    var $upwd = req.query.upwd;
    var sql = "select*from user where phone=? and upwd=md5(?)";
    pool.query(sql, [$phone, $upwd], (err, result) => {
        if (result.length > 0) {
            req.session.uid = result[0].uid;
            res.send({ code: 1, msg: "登录成功" });
        } else {
            res.send({ code: -1, msg: "用户名或密码有误" });
        }
    });
});
// 热门
server.get("/hot", (req, res) => {
    var sql = "select * from hot";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result.length == 0) {
            res.send({ code: -1, msg: "查询失败" });
        } else {
            res.send({ code: 1, msg: "查询成功", data: result });
        }
    })
})
// 即将上映
server.get("/will", (req, res) => {
    var sql = "select * from will";
    pool.query(sql, (err, result) => {
        if (err) throw err;
        if (result.length == 0) {
            res.send({ code: -1, msg: "查询失败" });
        } else {
            res.send({ code: 1, msg: "查询成功", data: result });
        }
    })
})
// 精选:电影
server.get("/recm", (req, res) => {
    var output = {
        recommend: {},
        weeklist: {},
        toplist: {}
    }
    var sql1 = "select * from recommend";
    pool.query(sql1, (err, result) => {
        if (err) throw err;
        output.recommend = result;
        var sql2 = "select * from weeklist";
        pool.query(sql2, (err, result) => {
            if (err) throw err;
            output.weeklist = result;
            var sql3 = "select * from toplist";
            pool.query(sql3, (err, result) => {
                if (err) throw err;
                output.toplist = result;
                res.send(output);
            })
        })
    })
})
//精选：电视
server.get("/rectv", (req, res) => {
    var output = {
        tvrecommend: {},
        chilist: {},
        earthlist: {}
    }
    var sql1 = "select * from tvrecommend";
    pool.query(sql1, (err, result) => {
        if (err) throw err;
        output.tvrecommend = result;
        var sql2 = "select * from chilist";
        pool.query(sql2, (err, result) => {
            if (err) throw err;
            output.chilist = result;
            var sql3 = "select * from earthlist";
            pool.query(sql3, (err, result) => {
                if (err) throw err;
                output.earthlist = result;
                res.send(output);
            })
        })
    })
})
// 详情
server.get("/details", (req, res) => {
    var did = req.query.did;
    var output = {
        detail: {},
        actor: {},
        comment: {}
    }
    if (did !== undefined) {
        var sql1 = `select * from details where did=?`;
        pool.query(sql1, [did], (err, result) => {
            if (err) throw err;
            output.detail = result[0];
            var params = output.detail["params"];
            var sql2 = `select * from actor where aid=?`;
            pool.query(sql2, [params], (err, result) => {
                if (err) throw err;
                output.actor = result[0];
                var sql3 = `select * from comment where mid=?`
                pool.query(sql3, [params], (err, result) => {
                    if (err) throw err;
                    output.comment = result;
                    res.send(output);
                })
            })
        })
    } else {
        res.send(output);
    }
});
server.get("/comments", (req, res) => {
    var uid = req.session.uid;
    //3:如果用户没登录返回错误消息
    if (!uid) {
        res.send({ code: -1, msg: "请登录" }); return;
    }
    var mid = req.query.mid;
    var com = req.query.msg;
    var score = req.query.score;
    var sql = "select*from user where uid=?";
    pool.query(sql, [uid], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            var uname = result[0].uname;
            var avt = result[0].avt;
            var sql2 = "insert into comment set uid=?,mid=?,com=?,score=?,uname=?,avt=?";
            pool.query(sql2, [uid, mid, com, score, uname, avt], (err, result) => {
                if (err) throw err;
                if (result.affectedRows > 0) {
                    res.send({ code: 1, msg: "评论成功" })
                } else {
                    res.send({ code: -1, msg: "失败" })
                }
            })
        }
    })

})
server.get("/user", (req, res) => {
    var uid = req.session.uid;
    //3:如果用户没登录返回错误消息
    if (!uid) {
        res.send({ code: -1, msg: "请登录" }); return;
    }
    var output = {
        user: {},
        want: {}
    }
    if (uid !== undefined) {
        var sql1 = `select * from user where uid=?`;
        pool.query(sql1, [uid], (err, result) => {
            if (err) throw err;
            output.user = result[0];
            var sql2 = `select * from want where uid=?`;
            pool.query(sql2, [uid], (err, result) => {
                if (err) throw err;
                output.want = result;
                res.send(output);
            })
        })
    } else {
        res.send(output);
    }
})
server.get("/addwant", (req, res) => {
    var uid = req.session.uid;
    //3:如果用户没登录返回错误消息
    if (!uid) {
        res.send({ code: -1, msg: "请登录" }); return;
    }
    var did=req.query.did;
    var time=req.query.time;
    var sql1="select cname,title,pic from details where did=?"
    pool.query(sql1,[did],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            var obj=result[0];
            obj.mid=did;
            obj.uid=uid;
            obj.addtime=time;
            var sql2="insert into want set ?"
            pool.query(sql2,[obj],(err,result)=>{
                if(err) throw err;
                if(result.affectedRows>0){
                    res.send({code:1,msg:"添加成功"});
                }else{
                    res.send({code:-1,msg:"失败"});
                }
            })
        }
    })
})
server.get("/out",(req,res)=>{
    req.session.uid=0;
    if(!req.session.uid){
        res.send({code:1,msg:'注销成功'})
    }else{
        res.send({code:-1,msg:'注销失败'})
    }
})
server.get("/islogin",(req,res)=>{
    if(req.session.uid){
        res.send({code:1,msg:'已登录'})
    }else{
        res.send({code:-1,msg:'未登录'})
    }
})
server.get("/search",(req,res)=>{
    var input=req.query.input;
    var sql=`select * from details where cname like '%${input}%'`;
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        if(result.length>0){
            res.send({code:1,msg:'查询成功',data:result});
        }else{
            res.send({code:-1,msg:'未找到'})
        }
    })
})