<template>
  <div class="home">
    <!-- 导航 -->
    <div class="nav-active">
      <el-menu :default-active="active" v-model="active" @select="handleSelect" class="el-menu-demo" mode="horizontal"  active-text-color="#f56c6c">
        <img src="../assets/logo.png" alt="" class="img">
        <el-menu-item index="0">首页</el-menu-item>
        <el-menu-item :index="((item.id).toString())" v-for="(item,index) of category" :key="index">{{item.category_name}}</el-menu-item>
<<<<<<< HEAD
=======
        <el-menu-item>
          <router-link to="/me">我的</router-link> 
        </el-menu-item>
>>>>>>> 01ba8dc... 摄影之家第二次提交
        <div class="middle" v-if="this.$store.state.isLogined==0">
          <el-button> <router-link to="/register" class="font-gray">注册</router-link></el-button>
          <el-button type="danger"><router-link to="/login" class="font-white">登录</router-link></el-button>
        </div>
        <div class="middle" v-else>
          <el-button><router-link to="/login" class="font-gray">注销</router-link></el-button>
        </div>
      </el-menu>
    </div>
    <!--  轮播 -->
    <div class="content">
      <div class="carousel">
        <el-carousel type="card" height="400px" trigger="click" indicator-position="none">
          <el-carousel-item><img src="../assets/images/5.jpg" alt="" height="400px"></el-carousel-item>
          <el-carousel-item><img src="../assets/images/1002.jpg" alt="" height="400px"></el-carousel-item>
          <el-carousel-item><img src="../assets/images/41.jpg" alt="" height="400px"></el-carousel-item>
          <el-carousel-item><img src="../assets/images/g.jpg" alt="" height="400px"></el-carousel-item>
          <el-carousel-item><img src="../assets/images/44.jpg" alt="" height="400px"></el-carousel-item>
          <el-carousel-item><img src="../assets/images/603.jpg" alt="" height="400px"></el-carousel-item>
        </el-carousel>
      </div>
    </div>
    
  <!-- 内容 -->
    <div class="content">
      <el-row>
        <el-col :span="4"><div class="grid-content"></div></el-col>
        <el-col :span="16">
            <el-row>
              <el-col :span="6" v-for="(log,index) in logs" :key="index" class="box" :lg="6" :md="8" :sm="12" :xs="24">
                <router-link :to="`/datails/${log.id}`">
                <el-card :body-style="{ padding: '10px' }" shadow="hover">
                  <img :src="log.image" class="image">
                  <div class="title">
                    <img :src="log.avatar" class="avatar">
                    <span>{{log.nickname}}</span>
                    <div class="bottom clearfix">
                       <time class="time">{{ moment.unix(log.created_at).format('YYYY-MM-DD HH:MM') }}</time>
                      <el-button type="danger" class="button">+ 关注</el-button>
                    </div>
                  </div>
                </el-card>
                </router-link>
              </el-col>
            </el-row>
        </el-col>
        <el-col :span="4"><div class="grid-content"></div></el-col>
      </el-row>
    </div>
    <Footer/>
  </div>
</template>

<script>
// @ is an alias to /src
import Footer from '@/components/Footer.vue'

export default {
  name:'Home',
  components:{
    Footer
  },
  data() {
    return {
      active: '0',
      category:[],//保存文章类型
      logs:[],
      basy:false
    };
  },
  methods: {
    handleSelect(key, keyPath){
      this.active=key;
    },
    loadData(active){
      this.axios.get( '/lists?cid='+active).then(res=>{
      //   // this.pageCount=res.data.pageCount
        let data=res.data.result;
        data.forEach(item => {
          if(item.image!=null){
            item.image = require('../assets/images/'+item.image);
          }
          if(item.avatar!=null){
            item.avatar = require('../assets/avatar/'+item.avatar);
          }else{
            item.avatar = require('../assets/avatar/'+unnamed.jpg);
          }
          this.logs.push(item);
        });
      });
    }
  },
  mounted() {
    // 请求日志类型
    this.axios.get('/category').then(res=>{
      if(res.data.code==1){
        this.category=res.data.result;
      }
    });
    // 请求日志信息
    this.loadData(this.active);
  },
  watch:{
    active(){
      this.logs=[];
      this.loadData(this.active);
    }
  }
}
</script>

<style scope>
  body{
    margin: 0;
    padding: 0;
  }
  a{
    text-decoration: none;
  }
  .content{
    background-color: #f5f5f5;
  }
  /* 顶部导航样式 */
  .nav-active{
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 5;
  }
  /* logo样式 */
  .img{
    width: 122px;
    float: left;
    margin: 0 55px 0 145px;
  }
  /* 登录注册按钮 */
  .middle{
    line-height: 60px;
    float: right;
    margin-right: 145px;
  }
  /* 轮播 */
  .carousel{
    padding: 90px 0 40px 0;
  }
  /* 主题内容部分 */
  .time {
    font-size: 13px;
    color: #999;
  }
  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }
  .home .button {
    padding: 4px;
    float: right;
  }
  .image {
    width: 100%;
    height: 220px;
    display: block;
  }
  .avatar{
    width: 45px;
    height: 45px;
    border-radius: 50%;
  }
  .clearfix:before,
  .clearfix:after {
      display: table;
      content: "";
  }
  .clearfix:after {
      clear: both
  }
  .side{
    background: #fff;
  }
  .el-row {
    padding-bottom: 20px;
  }
  .el-col {
    border-radius: 4px;
  }
  .grid-content {
    min-height: 36px;
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
  .box{
    padding:5px;
  }
  .font-white{
    color:#fff;
    text-decoration: none;
  }
  .font-gray{
    color:#606266;
    text-decoration: none;
  }
</style>
