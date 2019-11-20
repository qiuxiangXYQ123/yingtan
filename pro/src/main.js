import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUI from "mint-ui"
import "mint-ui/lib/style.css"

Vue.use(MintUI)
import Vant from 'vant';
import 'vant/lib/index.css';


Vue.use(Vant);
// Vue.prototype.isOnline = false;
// Vue.prototype.isLogin = function () {
//   return new Promise((resolve) => {
//     this.axios.get('islogin').then(res => {
//       if (res.data.code > 0) {
//         Vue.prototype.isOnline = true;
//       } else {
//         Vue.prototype.isOnline = false;
//       }
//     })
//     resolve()
//   })
// }


Vue.config.productionTip = false
import axios from "axios"
axios.defaults.baseURL = "http://127.0.0.1:4000/";
axios.defaults.withCredentials = true
Vue.prototype.axios = axios;

import Vuex from "vuex"

Vue.use(Vuex)


new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
