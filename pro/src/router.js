import Vue from 'vue'
import Router from 'vue-router'
import test from './components/test.vue'
import home from './components/home.vue'
import detail from './components/detail.vue'
import From from './components/From.vue'
import zc from './components/zc.vue'


Vue.use(Router)

export default new Router({
  routes: [
    {path:'/test',component:test},
    {path:'/home',component:home},
    {path:'/detail',component:detail},
    {path:'/zc',component:zc},
    {path:'/From',component:From},
    {
      path: '/',
      name: 'home',
      component: home
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    }
  ]
})
