<template>
  <div>
    <div class="movie-container" v-for="(item,index) of list" :key="index">
      <div class="pic">
        <img class="pic-size" :src="`http://127.0.0.1:4000/${item.pic}`">
      </div>
      <div class="center">
        <p class="name">{{item.mname}}</p>
        <div>
          <van-rate v-model="item.stars" readonly/>
          <span class="font-style score">{{item.score}}</span>
        </div>
        <p class="font-style">{{item.title}}</p>
      </div>
      <div class="right">
        <div class="btn" :data-id="item.params" @click="jump">查看详情</div>
        <p class="font-style">{{item.watched}}万人看过</p>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list:[],
      value: 3
    };
  },
  created() {
    this.loadMore();
  },
  methods: {
    loadMore() {
      var stars;
      this.axios.get("hot").then(result => {
        this.list = result.data.data;
        for(var i of result.data.data){
          i.stars=Math.round(i.score/2)
        }
        //console.log(this.list);
      });
    },
    jump(event){
        var id=event.target.dataset.id;
        this.$router.push(`/detail?did=${id}`)
    }
  },
  
};
</script>
<style scoped>
.movie-container {
  margin-top: 0.5rem;
  display: flex;
  width: 100%;
  justify-content: space-between;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #eee;
}
.pic {
  width: 5rem;
}
.pic-size {
  width: 5rem;
  border-radius: 5px;
}
.center {
  margin-left: 20px;
}
.name {
  font-weight: 600;
  margin: 0;
  margin: 0.3rem 0;
}
.font-style {
  font-size: 0.8rem;
  color: #999;
  width: 10rem;
  margin: 0;
  margin-top: 0.5rem;
}
.right {
  padding: 2rem 0.8rem;
  border-left: 1px dashed #eee;
}
.btn {
  border: 2px solid #F25D46;
  width: 5rem;
  height: 2rem;
  border-radius: 0.3rem;
  text-align: center;
  line-height: 2rem;
  color: #F25D46;
  font-size: 0.8rem;
}
.score{
    margin-left: 0.6rem;
}
.center >>> .van-icon-star-o:before,
.center >>> .van-icon-star:before {
  font-size: 10px;
}
.center >>> .van-rate__icon {
  width: 10px;
}
</style>