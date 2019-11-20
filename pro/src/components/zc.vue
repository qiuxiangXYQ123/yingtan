<template>
<div>
 <div class="zc">
  <p class="text1">登录/注册</p>
</div>
   <div class="zc2"> 
   <p class="text2">登录注册表示同意 <span class="text3"> 豆瓣使用协议/隐私政策</span></p>
   </div>
   <mt-field class="inp1" label="+86 |" placeholder="手机号" v-model="phone" ></mt-field>
  <mt-field class="inp1" label="密码 |"
      placeholder="请输入密码" v-model="upwd"></mt-field>
      <mt-field class="inp1" label="密码 |"
      placeholder="请确认密码" v-model="upwd2"></mt-field>
       <!--添加按钮   登录-->
      <mt-button class="btn1" size="large" @click="login">注册</mt-button>
<div class="text4">
    <p class="text5">使用邮箱注册<span class="text6" @click="go">账号密码登录</span></p>
</div>
</div>

</template>
<script>
export default {

     data(){
     return {
        phone:"", //双向绑定手机号
        upwd:"",  //双向绑定密码
        upwd2:"",
      
     }
   },
   methods:{
     go(){
       this.$router.push('/From')
     },
     //添加注册函数
     login(){
      //功能:对表单中每个元素进行验证
      //验证:去掉用户无效操作
      //1:创建手机号和密码正则表达式
      var phone=/^1[3456789]\d{9}$/;
      var upwd=/^[a-z0-9]{3,12}$/i;
      var upwd2=/^[a-z0-9]{3,12}$/i;
      //3:获取用户输入手机号 data属性
      var u = this.phone;
      //4:获取用户输入密码
      var p = this.upwd;
      //4.1:获取用户验证密码
      var q = this.upwd2
      //5:通过正则表达式验证手机号是否合法
      if(phone.test(u)==false){
      //7:如果验证没通过显示确认消息框
      this.$messagebox("消息","手机号格式不正确");
      //8:停止函数执行
      return;
      }
    //9:通过正则表达式验证用户密码是否合法
      if(upwd.test(p)==false){
       //10:如果验证没通过显示确认消息
       this.$messagebox("消息","用户密码格式不正确");
       //11:停止函数执行
       return;
      }
      if(p!=q){
        this.$messagebox("消息","两次密码不一致");
          return;
      }
      var uname=this.name();
      console.log(uname);
      this.axios.get("reg",{
        params:{
          phone:u,
          upwd:p,
          uname
        }
      }).then(res=>{
        if(res.data.code>0){
          this.$toast("注册成功");
          this.$router.push('/From')
        }
        
      })
     },
     name(){
       var arr1=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
			var str="";
			//循环4次
			for(var i=0;i<8;i++){
				//取随机
				//0~1*36
				var index=Math.floor(Math.random()*arr1.length);
				//通过下标找元素
				str+=arr1[index];
      }
      return str;
     }
   }
} 

</script>
<style scoped>
.zc{
  display:flex;
  
}
.zc2{
  display:flex;
}
.zc3{
  display:flex;
}
.text1{
  font-weight:normal;
  margin:0 auto;
   margin-top:60px;
   margin-bottom:5px;
   font-size:25px;
 
   }
   .text2{
     display:flex;
      margin:0 auto;
      margin-top:0px;
      margin-bottom:30px;
      font-size:14px;
      color:#888888;
   }

   .text3{
     color:#138908;
     margin-left:7px;
     }
     .inp1{
  width:300px;
  height:30px;
  border:1px solid #B6B4B6;
  border-radius:5px;
  margin:5px auto;
     }

.btn1{
  color:#fff;
  width:300px;
  background:#138908;
  margin:10px auto;
  }

.text4{
  display:flex;
}
.text5{
   margin:0 auto;  
  font-size:13px;
  color:#888888;
}
.text5:hover{
  color:#138908;
}
.text6{
   margin-left:140px;
   font-size:13px;
    color:#138908;
}
.text7{
 margin:0 auto;
  margin-top:120px;
}
   
 img{
  width:40px;
  height:40px;
  margin-bottom:85px;
  }
  #tab1 #tab2{
    width:60px;
    height:60px;
    box-shadow: 5px 1px 10px #888888;
    border-radius:50%;
  }
</style>