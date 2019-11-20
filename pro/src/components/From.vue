<template>
  <div>
  <div class="cont">
  <p class="text1">账号密码登录</p>
  </div>
  <mt-field class="inp1" label="手机号" placeholder="请输入手机号" v-model="phone" ></mt-field>
  <mt-field class="inp1" label="密码"
      placeholder="请输入密码" v-model="upwd"></mt-field>
       <!--添加按钮   登录-->
      <mt-button class="btn1" size="large" @click="login">登陆</mt-button>

<div class="text2">
  <p class="text3" @click="back">短信验证登录/注册
  <span class="text4">海外手机登录</span>
  <span class="text5">找回密码</span></p>
</div>
</div>
</template>
<script>
export default {
   data(){
     return {
        phone:"", //双向绑定手机号
        upwd:"",  //双向绑定密码
     }
   },
   methods:{
     back(){
       this.$router.push('/zc')
     },
     //添加登录函数
     login(){
      //功能:对表单中每个元素进行验证
      //验证:去掉用户无效操作
      //1:创建手机号和密码正则表达式
      var phone=/^1[3456789]\d{9}$/;
      var upwd=/^[a-z0-9]{3,12}$/i;
      //3:获取用户输入手机号 data属性
      var u = this.phone;
      //4:获取用户输入密码
      var p = this.upwd;
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
     //10:发送ajax请求
     var url="login";
     var obj={phone:u,upwd:p};
     this.axios.get(url,{
       params:obj
     }).then(res=>{
       console.log(res.data.code);
     if(res.data.code<0){
         this.$messagebox("消息","用户名或密码有误");
       }else{
         //跳转主页面 //9:47
         this.$router.push("/home");
       
     }
     })
     }
   }
}
</script>
<style scoped>
.cont{
  display:flex;
}
.zc3{
  display:flex;
}
 .text1{
    font-weight:normal;
    margin:0 auto;
   margin-top:60px;
 
   font-size:25px;
   margin-bottom:40px;


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


.text2{
  display:flex;
}
.text3{
   margin:0 auto; 
  font-weight:normal;
  color:#138908;
  font-size:12px;
}
.text4{
  margin-left:30px;
   font-weight:normal;
   font-size:12px;
  
}
.text5{
     margin-left:30px;
font-size:12px;
font-weight:normal;
}
 .text6{
  margin:0 auto;
 margin-top:150px;
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