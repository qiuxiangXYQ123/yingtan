<template>
  <div v-if="ishide">
    <van-nav-bar
      title="设置"
      left-text
      right-text=""
      left-arrow
      @click-left="back"
    />
    <div>
        <div class="btn-set">
            <span>清除缓存</span>
        </div>
        <div class="btn-set"><span>关于</span></div>
        <div v-if="show" class="btn-set" @click="out">退出登录</div>
    </div>
  </div>
</template>
<script>
export default {
    data(){
        return{
            
        }
    },

    props:["ishide","show"],
    methods:{
        back(){
            this.$emit("childMsg",!this.ishide)
        },
        out(){
            this.axios.get("out").then(res=>{
                if(res.data.code>0){
                    this.$toast("账号已退出");
                    this.$emit("childMsg",!this.ishide)
                }
            })
        }
    }
}
</script>
<style scoped>
    .btn-set{
        width: 100%;
        background: #fff;
        border-top: 0.5px solid #eee;
        padding: 0.6rem;
    }
    .btn-set:first-child{
        margin-top: 1rem;
    }
    .btn-set:nth-child(3){
        margin-top: 10rem;
        text-align: center;
    }
</style>