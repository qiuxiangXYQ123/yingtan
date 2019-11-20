<template>
  <div>
    <div class="box">
      <div class="bg-search">
        <img class="ico" src="../assets/search.png" alt />
        <input class="search" @focus="start" type="text" v-model="input" placeholder="请输入关键字" />
        <div @click="cancal" class="cancel">×</div>
      </div>
    </div>
    <div class="zhanwei">
    </div>
    <div id="bg">
      <div class="none" v-if="show">
        <div><img src="../assets/box.png" alt=""></div>
        <p>暂无搜索结果</p>
      </div>
      
      <div v-if="!result.length==0">
        <div @click="jump" v-for="(item,index) of result" :key="index">
          <div class="movies" :data-id="item.did">
            <div><img  :data-id="item.did" :src="`http://127.0.0.1:4000/${item.pic}`" alt=""></div>
            <div :data-id="item.did">
              <div class="name">{{item.cname}}</div>
              <div><span>{{item.score}}分/</span><span>{{item.title}}</span></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      input: "",
      result: [],
      show:false
    };
  },
  methods: {
      jump(event){
        var id=event.target.dataset.id;
        // console.log(id)
        this.$router.push(`/detail?did=${id}`)
    },
    search() {
      var input = this.input;
      if (input !== "") {
        this.axios
          .get("search", {
            params: {
              input
            }
          })
          .then(res => {
            // console.log(res);
            if (res.data.code > 0) {
              this.result = res.data.data;
              console.log(this.result);
            } else {
              this.result = [];
              this.show=true;
            }
          });
      }else{
        this.result=[];
        this.show=false;

      }
    },
    start() {
      var bg = document.getElementById("bg");
      bg.className="h-100"
    },
    cancal() {
      this.input = "";
      var bg = document.getElementById("bg");
      bg.className="h-0"
    }
  },
  watch: {
    input() {
      this.search();
    }
  }
};
</script>
<style scoped>
.none{
  margin: 5rem auto;
  text-align: center;
  font-size: 1.2rem;
  color: #8a8a88;
}
.movies{
  display: flex;
  font-size: 0.8rem;
  padding: 0.5rem 1rem;
  color: #333;
  border-bottom: 1px solid #eee;
}
.name{
  font-size: 1rem;
  margin: 0.5rem 0;
  color:#000;
}
.movies img{
  width: 4rem;
  border-radius: 3px;
  margin-right: 1rem;
}
.cancel {
  position: absolute;
  right: 1.5rem;
  top: 1.8rem;
  background: #99a;
  color: #eee;
  border-radius: 50%;
  width: 1rem;
  height: 1rem;
  text-align: center;
  line-height: 0.9rem;
}
#bg{
  transition: all 0.8s;
  background: #fff;
  width: 100%;
}
.h-100{
  height: 100vh;
}
.h-0{
  height: 0;
}
.zhanwei {
  width: 100%;
  height: 60px;
}
.box {
  width: 100%;
  height: 60px;
  z-index: 1000;
  position: fixed;
  background: #fff;
}
.ico {
  width: 1rem;
  margin-bottom: -4px;
}
.bg-search {
  width: 90%;
  padding: 0.4rem;
  border-radius: 0.4rem;
  border: 0.5px solid #eee;
  background: #eee;
  margin: 20px auto;
}
.search {
  width: 80%;
  outline: 0;
  border: 0;
  font-size: 12px;
  background: #eee;
}
</style>
