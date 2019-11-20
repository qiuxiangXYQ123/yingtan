<template>
  <div class="index">
    <search></search>
    <van-tabs v-model="active">
      <van-tab title="电影">
        <movie></movie>
      </van-tab>
      <van-tab title="电视">
        <tv></tv>
      </van-tab>
    </van-tabs>
  </div>
</template>
<script>
import search from "./search.vue";
import Movie from "./movie.vue";
import Tv from "./tv.vue";
export default {
  data() {
    return {
      list: [],
      active: "tab1"
    };
  },
  components: {
    search: search,
    movie:Movie,
    tv:Tv
  }
};
</script>
<style scoped>
.van-tabs__line {
  background-color: #323233 !important;
}
.van-tabs__nav{
  border-bottom: 1px solid #eee;
  padding-bottom: 5px;
}
.index /deep/ .van-tabs--line .van-tabs__wrap{padding-bottom:12px;color:#e4e4e4}
.index /deep/ .van-tabs__nav--line{
        position:fixed;
        z-index:99;
        height:40px;
        width:100%;
}
</style>