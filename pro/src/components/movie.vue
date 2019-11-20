<template>
  <div>
    <h3 class="title">精选推荐</h3>
    <div class="recom">
      <div class="mov" v-for="(item,index) of recommend" :key="index">
        <div>
          <img :src="`http://127.0.0.1:4000/${item.pic}`" alt />
        </div>
        <div>{{item.rname}}</div>
        <van-rate v-model="item.stars" readonly />
        <span>{{item.score}}</span>
      </div>
    </div>
    <!--<h3 class="title">排行榜</h3>
    <div>
        <div>
            <div class="week">
                <div class="head">一周口碑电影榜</div>
                <div>
                    <div v-for="(item,index) of weeklist" :key="index">
                        <span>{{index+1}}.</span><span>{{item.mname}}</span><span>{{item.score}}</span>
                    </div>
                </div>
            </div>
            
        </div>
    </div>-->
    <div></div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      stars: 3,
      recommend: [],
      weeklist:[],
      toplist:[]
    };
  },
  created() {
    this.load();
  },
  methods: {
    load() {
      this.axios.get("recm").then(res => {
        console.log(res);
        this.recommend = res.data.recommend;
        this.weeklist = res.data.weeklist;
        this.toplist = res.data.toplist;
        console.log(this.recommend);
        for (var i of res.data.recommend) {
          i.stars = Math.round(i.score / 2);
        }
      });
    }
  }
};
</script>
<style scoped>
.week{
    width: 13rem;
    background: #f00;
    border-radius: 5px;
}
.week .head{
    height: 5rem;
    width: 100%;
}
.title{
    margin-left: 1rem;
}
.recom {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 0 1rem;
}
.mov {
  font-size: 0.8rem;
}
.mov img {
  width: 6.7rem;
  height: 8.5rem;
  border-radius: 4px;
}
.mov >>> .van-icon-star-o:before,
.mov >>> .van-icon-star:before {
  font-size: 10px;
}
.mov >>> .van-rate__icon {
  width: 10px;
}
</style>