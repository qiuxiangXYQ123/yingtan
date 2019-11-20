<template>
    <div>
        <h4>测试</h4>
        <input type="text" v-model="val">
        <mt-button @click="send">发布</mt-button>
    </div>
</template>
<script>
export default {
    data(){
        return {
           val:""
        }
    },
    created(){
        this.loadMore();
    },
    methods: {
        send(){
            console.log(this.val);
        },
        test(){
           this.$toast("操作成功");
        },
        loadMore(){
            
            this.axios.get("/rectv",{
                params:{
                    did:1
                }
            }).then(result=>{
                console.log(result.data)
                // //this.pros=result.data.data;
                // var rows=this.pros.concat(result.data.data);
                // this.pros=rows;
            })    
        }
    },
}
</script>
