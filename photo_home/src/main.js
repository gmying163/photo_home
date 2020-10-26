import App from './App.vue'
import router from './router'
import store from './store'
import Vue from 'vue'
import qs from 'qs'
import 'element-ui/lib/theme-chalk/index.css';
//导入axios模块
import axios from 'axios'
//导入moment模块
import moment from 'moment'
//导入Mint UI 
import ElementUI from 'element-ui' 
// 配置服务器基础地址
axios.defaults.baseURL = 'http://127.0.0.1:3000'

//注册为vue插件
Vue.use(ElementUI)
//原生链扩展属性
Vue.prototype.axios = axios;
Vue.prototype.moment=moment;
Vue.prototype.qs=qs;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
