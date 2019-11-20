<template>
  <div  class="head-box">
    <div class="fixed">
      <div class="bg-head">
      <table></table>
      <div class="zzc"></div>
      <div class="user">
        <div class="avt">
          <img v-if="show" :src="`http://127.0.0.1:4000/${list.user.avt||'avt/default.jpg'}`" alt>
          <img v-if="!show" src="http://127.0.0.1:4000/avt/default.jpg" alt="">
        </div>
        <div>
          <p v-if="show" class="userName">{{list.user.uname}}</p>
          <p v-if="!show" class="please">请登录</p>
          <router-link v-if="show" class="btn-myticket" to>我的电影票</router-link>
        </div>
      </div>
      <div @click="set" class="set"><img src="../assets/set.png" alt=""></div>
    </div>
    <p v-if="show" class="want">我的收藏 {{list.want.length}}</p>
    </div>
    <div class="zhanwei"></div>
    <div v-if="show">
      <div>
        <div class="wantlist" v-for="(item,index) of list.want" :key="index">
          <div class="pic"><img :src="`http://127.0.0.1:4000/${item.pic}`" alt=""></div>
          <div class="right">
            <h3 class="mname">{{item.cname}}</h3>
            <p class="title">{{item.title}}</p>
            <div class="time">{{item.addtime}}</div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="!show" class="nolog">
      <img src="../assets/box.png" alt="">
      <p>登录查看数据标记数据</p>
      <router-link to="/From">登录</router-link>
    </div>
    <div >
      <set :show="show" class="setpage" :ishide="hide" @childMsg="hi"></set>
    </div>
    
  </div>
</template>
<script>
import  Sets  from "./set.vue";
export default {
  data(){
    return {
      list:{user:{avt:"",uname:''},want:{}},
      show:false,
      hide:false,
    }
  },
  created(){
    this.loaduser()
    this.islog()
  },
  methods:{
    set(){
      this.hide=true;
    },
    hi(ishide){
      this.hide=ishide;
    },
    islog(){
      this.axios.get('islogin').then(res=>{
        if(res.data.code>0){
          this.show=true;
        }else{
          this.show=false;
        }
      })
    },
    loaduser(){
      this.axios.get("user").then(res=>{
        this.list=res.data;
      })
    }
  },
  watch:{
    hide(){
      this.islog()
    }
  },
  components: {
    set:Sets
  }
}
</script>
<style scoped>
.setpage{
  width: 100%;
  background: #f5f5f5;
  position: fixed;
  top:0;
  height: 100vh;
  z-index: 1000;
}
.nolog{
  margin-top: 5rem;
  color: #8a8a8a;
  text-align: center;
}
.nolog img{
  width: 6rem;
}
.nolog a{
  display: block;
  width: 8rem;
  border: 2px solid #d4237a;
  padding: 0.8rem;
  box-sizing: border-box;
  color: #d4237a;
  border-radius: 10px;
  margin: 2rem auto;
}
.please{
  font-size: 1.2rem;
  margin-top: 2rem;
}
.zhanwei{
  height: 14.5rem;
  width: 100%;
}
.fixed{
  position: fixed;
  top:0;
  left: 0;
}
.bg-head {
  width: 100vw;
  height: 12rem;
  background: url(../assets/me.png) no-repeat;
  background-size: 100% 100%;
  position: relative;
  top: 0;
  left: 0;
  z-index: -100;
  display: flex;
  /* justify-content: space-between; */
}
.zzc {
  background: #798EBB;
  opacity: 0.5;
  position: absolute;
  top: 0;
  width: 100vw;
  height: 12rem;
  z-index: -10;
}
.avt {
  width: 4.5rem;
  height: 4.5rem;
  position: relative;
  margin: 0 2rem;
  border:3px solid #fff;
  border-radius: 50%;
}
.avt > img {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -2.25rem;
  margin-left: -2.25rem;
  border-radius: 50%;
}
.user{
    display: flex;
    color:#fff;
    margin: 3rem 2rem;
}
.btn-myticket{
    display: block;
    height: 2rem;
    width: 6rem;
    line-height: 2rem;
    text-align: center;
    color: #fff;
    border:1px solid #fff;
    border-radius: 3px;
    font-size: 0.8rem;
}
.userName{
    margin-top: 0.5rem;
}
.set{
    display: block;
    position: absolute;
    right: 1.5rem;top: 1.5rem;
}
.want{
  margin: 0;
  height: 3rem;
  background: #fff;
  padding: 1rem;
  box-sizing: border-box;
}
.wantlist{
  display: flex;
  border-bottom: 1px solid #eee;
}
.pic{
  width:8rem;
  margin:0.5rem 1rem;
}
.pic img{
  width:100%;
  border-radius: 5px;
}
.mname{
  margin: 0.5rem 0;
}
.title,.time{
  font-size: 0.8rem;
  color: #333;
  width: 90%;
}
.time{
  height: 2rem;
  background: #eee;
  border-radius: 5px;
  padding: 0.5rem;
  box-sizing: border-box;
}
.right{
  width: 100%;
}
.head-box{
  width: 100%;
}
</style>