import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import qs from 'qs'
import router from '../router'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    //表示用户是否已经登录
    isLogined:localStorage.getItem('isLogined') ? localStorage.getItem('isLogined') : 0 ,
    username:localStorage.getItem('username') ? localStorage.getItem('username') : '',
    phone:localStorage.getItem('phone') ? localStorage.getItem('phone') : ''
  },
  mutations: {
    logined(state,payload){
      state.isLogined = 1;
      //state.username = payload.username;
      // localStorage.setItem('username',payload.username);
    },
    logout(state){
      state.isLogined = 0;
      state.username = '';
      state.phone = '';
      localStorage.removeItem('isLogined'); 
    }
  },
  actions: {
    login(context,payload){
      axios.post('/login',qs.stringify(payload)).then(res=>{
        if(res.data.code == 1){
          //console.log(payload);
          context.commit('logined');
          localStorage.setItem('logined','1');
          router.push('/');
        } else {

        }
      })
    }
  },
  modules: {
  }
})
