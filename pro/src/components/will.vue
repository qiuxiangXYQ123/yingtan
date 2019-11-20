<template>
  <div>
    <div v-for="(item,index) of list" :key="index" class="movie-will">
      <div>
        <img class="pic-style" :src="`http://127.0.0.1:4000/${item.pic}`" alt>
      </div>
      <div class="center">
        <p class="name">{{item.mname}}</p>
        <p class="font-style">{{item.title}}</p>
      </div>
      <div class="right">
        <div class="btn-want" @click="want">
          <div><img src="../assets/want.png" :data-id="item.wid"></div>
          <div :data-id="item.wid">想看</div>
        </div>
        <p class="font-style">{{item.want}}人想看</p>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      list:[]
    }
  },
  created() {
    this.loadMore();
  },
  methods: {
    loadMore() {
      this.axios.get("will").then(result => {
        this.list = result.data.data;
        console.log(this.list);
      });
    },
    want(event){
      var id=event.target.dataset.id
      console.log(id)
    }
  },
};
</script>
<style scoped>
.movie-will {
  display: flex;
  padding: 0.3rem 0;
  border-bottom: 1px solid #eee;
}
.pic-style {
  width: 5rem;
  border-radius: 5px;
}
.movie-will .name {
  font-weight: 600;
  margin: 0;
  margin-bottom: 0.5rem;
}
.center {
  margin-left: 20px;
}
.movie-will .font-style {
  font-size: 0.8rem;
  color: #999;
  width: 10rem;
}
.movie-will .right {
  padding: 2rem 1rem;
  border-left: 1px dashed #eee;
}
.btn-want{
  margin: 0 1rem;
  color:#FF830A;
  font-size: 0.5rem
}
.btn-want img{
  width: 1.5rem;
}
</style>
