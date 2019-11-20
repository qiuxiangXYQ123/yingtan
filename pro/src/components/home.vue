<template>
  <div>
    <mt-tab-container v-model="active">
            <mt-tab-container-item id="index">
                <indexpage></indexpage>
            </mt-tab-container-item>
        </mt-tab-container>
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="school">
                <recom></recom>
            </mt-tab-container-item>
        </mt-tab-container>
        <mt-tab-container v-model="active">
            <mt-tab-container-item id="round">
                <me></me>
            </mt-tab-container-item>
        </mt-tab-container>
    <mt-tabbar v-model="active" fixed>
      <mt-tab-item id="index" @click.native="changeState(0)">
        <tabbaricon
          :normalImage="require('../assets/tabbar/01.png')"
          :selectedImage="require('../assets/tabbar/01_active.png')"
          :focused="currentIndex[0].isSelect"
        ></tabbaricon>热映
      </mt-tab-item>
      <mt-tab-item id="school" @click.native="changeState(1)">
        <tabbaricon
          :normalImage="require('../assets/tabbar/02.png')"
          :selectedImage="require('../assets/tabbar/02_active.png')"
          :focused="currentIndex[1].isSelect"
        ></tabbaricon>推荐
      </mt-tab-item>
      <mt-tab-item id="round" @click.native="changeState(2)">
        <tabbaricon
          :normalImage="require('../assets/tabbar/03.png')"
          :selectedImage="require('../assets/tabbar/03_active.png')"
          :focused="currentIndex[2].isSelect"
        ></tabbaricon>我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
import TabBarIcon from "./tabbarIcon.vue";
import Indexpage from "./index.vue";
import Me from "./me.vue";
import Recom from "./recom.vue";

export default {
  data() {
    return {
      active: "index",
      //创建数组保存图片焦点状态
      currentIndex: [
        { isSelect: true },
        { isSelect: false },
        { isSelect: false }
      ]
    };
  },
  methods: {
    mysearch(){console.log("搜索");},
    myadd(){console.log("+")},
    changeState(n){
      //函数功能:将当前参数下标
      //对应数组值修改true其它修改false
      //1:创建循环,循环数组中内容
      for(var i=0;i<this.currentIndex.length;i++){
       //2:判断如果循环下标与n相等 20
       if(n==i){
        //3:当前下标元素true 10:22
        this.currentIndex[i].isSelect=true;
       }else{
        //4:其它元素修改false
        this.currentIndex[i].isSelect=false;
       }
       
      }

    }
  },
  components: {
    tabbaricon: TabBarIcon,
    indexpage:Indexpage,
    me:Me,
    recom:Recom
  }
};
</script>
<style>
    .mint-tabbar>.mint-tab-item{
        color: #999;
    }
    .mint-tabbar>.mint-tab-item.is-selected{
        background-color: transparent;
        color:#515151 !important;
    }
</style>