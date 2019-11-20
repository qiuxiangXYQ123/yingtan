<template>
  <div>
    <div class="detail-img" :style="`background:url(${detail.detail.bgimg}) no-repeat;`">
      <div class="bg"></div>
    </div>
    <div class="detail-container">
      <div class="navbar">
        <van-nav-bar
        title="电影"
        left-text
        right-text="..."
        left-arrow
        @click-left="onClickLeft"
        @click-right="onClickRight"
      />
      </div>
      <div class="zhanwei"></div>
      <div class="f1">
        <div>
          <img class="pic" :src="detail.detail.pic" alt />
        </div>
        <div>
          <p class="cname">{{detail.detail.cname}}</p>
          <p class="ename">{{detail.detail.ename}}</p>
          <p class="title">{{detail.detail.title}}</p>
          <button @click="addwant" :data-id="detail.detail.did">想看</button>
        </div>
      </div>

      <div class="desc">
        <p class="desc-title">简介</p>
        <p>{{detail.detail.intr}}</p>
      </div>

      <div v-if="isCom" class="file">
        <div class="f2">
          记录此刻感受
          <div class="stars">
            <van-rate v-model="stars" />
          </div>
        </div>
        <van-cell-group>
          <van-field
            v-model="message"
            rows="1"
            autosize
            label="评论"
            type="textarea"
            placeholder="想说点什么？发表你的评论吧！"
          />
        </van-cell-group>
        <div class="btn-send" @click="send">
          <img src="../assets/send.png" alt />
        </div>
      </div>
      <div class="comment">
        <p>短评</p>
        <div v-for="(item,index) in detail.comment" :key="index">
          <div class="user">
            <div class="avt">
              <img :src="`http://127.0.0.1:4000/${item.avt||'avt/default.jpg'}`" alt />
            </div>
            <div>
              <p>{{item.uname}}</p>
              <van-rate v-model="item.score" readonly />
            </div>
          </div>
          <p>{{item.com}}</p>
        </div>
      </div>
    </div>
    <div class="btn-com" @click="showfile">
      <img src="../assets/bi.png" alt />
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      detail: { detail: { bgimg: "" }, comment: { uname: "" } },
      stars: 0,
      message: "",
      isCom: false
    };
  },
  created() {
    this.loadMore();
  },
  methods: {
    addwant(e) {
      var did = e.target.dataset.id;
      var time = new Date();
      var year = time.getFullYear();
      var mouth = time.getMonth();
      var date = time.getDate();
      time = year + "-" + mouth + "-" + date;
      console.log(time);
      console.log(e.target.dataset.id);
      this.axios
        .get("addwant", {
          params: {
            did,
            time
          }
        })
        .then(res => {
          console.log(res);
          if (res.data.code > 0) {
            this.$toast("已加入收藏列表");
          }
          if(res.data.code<0){
            this.$toast("您还没有登录哦");
            this.$router.push('/From')
          }
        });
    },
    loadMore() {
      var did = location.hash.split("=")[1];
      var bgimg = "http://127.0.0.1:4000/";
      var pic = "http://127.0.0.1:4000/";
      this.axios
        .get("details", {
          params: {
            did
          }
        })
        .then(result => {
          bgimg += result.data.detail.pic;
          pic += result.data.detail.pic;
          result.data.detail.bgimg = bgimg;
          result.data.detail.pic = pic;
          if (result.data.comment) {
            this.show = true;
          } else {
            this.show = false;
          }
          this.detail = result.data;
          console.log(this.detail);
        });
    },
    showfile() {
      if (this.isCom) {
        this.isCom = false;
      } else {
        this.isCom = true;
      }
    },
    onClickLeft() {
      this.$router.go(-1);
    },
    onClickRight() {},
    send() {
      //console.log(this.message)
      if (this.stars == 0) {
        this.$toast("你还没有评分哦！");
        return;
      }
      if (this.message == "") {
        this.$toast("您还没有填写评论哦！");
        return;
      }
      this.axios
        .get("comments", {
          params: {
            mid: this.detail.detail.did,
            msg: this.message,
            score: this.stars
          }
        })
        .then(res => {
          console.log(res);
          this.message = "";
          this.stars = 0;
          if (res.data.code < 0) {
            this.$toast("您还没有登录哦");
            this.$router.push("/From");
          } else {
            this.$toast("评论成功！");
            this.loadMore();
          }
        });
    }
  }
};
</script>
<style scoped>
.navbar{
  width: 100%;
  position: fixed;
  background: rgb(132, 136, 136);
}
.zhanwei{
  height: 2.5rem;
  width: 100%;
  
}
.fixed {
  position: fixed;
  top: 0;
}
.btn-com {
  background: rgba(125, 236, 250, 0.5);
  width: 3rem;
  height: 3rem;
  border-radius: 50%;
  position: fixed;
  bottom: 2rem;
  right: 2rem;
}
.btn-com > img {
  width: 80%;
  margin-top: 0.3rem;
  margin-left: 0.3rem;
}
.file {
  width: 90%;
  padding: 1rem;
  box-sizing: border-box;
  margin: 1rem auto;
  background: rgba(118, 118, 118, 0.5);
  border-radius: 0.5rem;
  position: relative;
}
.btn-send {
  position: absolute;
  bottom: 1.2rem;
  right: 1.5rem;
}
.desc-title {
  margin: 0;
}
.file >>> .van-field__label {
  width: 50px;
}
.comment > p:first-child {
  font-size: 1rem;
  margin: 0.5rem;
}
.comment {
  width: 90%;
  margin: 1rem auto;
  color: #fff;
  font-size: 0.8rem;
  line-height: 1.2rem;
  background: rgba(118, 118, 118, 0.5);
  padding: 1rem 1rem;
  border-radius: 0.5rem;
  box-sizing: border-box;
}
.comment p {
  margin: 0.8rem 0;
}
.avt {
  width: 2.5rem;
  height: 2.5rem;
  position: relative;
  margin: 0 0.5rem;
}
.user {
  display: flex;
}
.user p {
  margin: 0;
  font-size: 1rem;
}
.avt > img {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -1.5rem;
  margin-left: -1.5rem;
  border-radius: 50%;
}
.detail-img {
  min-height: 100vh;
  width: 100%;
  background-size: cover !important;
  opacity: 0.9;
  filter: blur(40px);
  z-index: -2;
  position: absolute;
  top: 0;
  left: 0;
}
.detail-container {
  z-index: 100;
  min-height: 100vh;
  padding-bottom: 1rem;
  background: rgba(118, 118, 118, 0.5);
}
.detail-container >>> .van-nav-bar {
  background: rgba(118, 118, 118, 0.2);
  z-index: 100;
}
.detail-container >>> .van-nav-bar__text {
  font-size: 24px;
  color: #fff;
  margin-top: -10px;
}
.detail-container >>> .van-icon-arrow-left:before {
  color: #fff;
  font-size: 24px;
}
.detail-container >>> .van-nav-bar__title {
  font-size: 14px;
  color: #fff;
}
.bg {
  width: 100%;
  min-height: 100vh;
  background-color: #333;
  z-index: -1;
  position: absolute;
  opacity: 0.5;
  top: 0;
  left: 0;
}
.detail-container .pic {
  margin: 1rem;
  width: 6rem;
  border-radius: 0.3rem;
}
.detail-container .f1,
.f2 {
  justify-content: center;
  display: flex;
  color: #fff;
}
.detail-container .cname,
.detail-container .ename,
.detail-container .title {
  margin: 0;
  margin-bottom: 0.5rem;
}
.van-hairline--bottom::after {
  border: 0;
}
.detail-container .cname {
  margin-top: 1rem;
}
.detail-container .ename {
  font-size: 0.7rem;
}
.detail-container .title {
  font-size: 0.8rem;
  margin-bottom: 1rem;
}
.detail-container button {
  width: 6rem;
  height: 2rem;
  color: #333;
  border: 0;
  margin-top: 1rem;
  border-radius: 0.2rem;
  background: #eee;
  font-size: 0.8rem;
}
.f2 {
  width: 90%;
  height: 2rem;
  line-height: 2rem;
  margin: 0 auto;
  background: rgba(118, 118, 118, 0.2);
  font-size: 0.8rem;
  border-radius: 0.5rem;
}
.f2 .stars {
  margin: 0.2rem 0 0 0.8rem;
}
.stars >>> .van-icon-star-o:before,
.stars >>> .van-icon-star:before {
  font-size: 16px;
}
.user >>> .van-icon-star-o:before,
.user >>> .van-icon-star:before {
  font-size: 10px;
}
.user >>> .van-rate__icon {
  width: 10px;
}
.desc {
  font-size: 0.8rem !important;
  width: 90%;
  margin: 0 auto !important;
  color: #fff;
  line-height: 1.2rem;
}
.desc > p:first-child {
  font-size: 1rem;
}
</style>