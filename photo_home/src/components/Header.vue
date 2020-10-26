<template>
  <div class="header">
    <!-- 导航 -->
    <div class="nav-active">
      <el-menu :default-active="active" @select="handleSelect" class="el-menu-demo" mode="horizontal"  active-text-color="#f56c6c">
        <img src="../assets/logo.png" alt="" class="img">
<<<<<<< HEAD
        <el-menu-item index="0">首页</el-menu-item>
=======
        <el-menu-item index="0"><router-link to="/">首页</router-link> </el-menu-item>
>>>>>>> 01ba8dc... 摄影之家第二次提交
        <el-menu-item :index="((item.id).toString())" v-for="(item,index) of category" :key="index">{{item.category_name}}</el-menu-item>
        <div class="middle">
          <el-button>注册</el-button>
          <el-button type="danger">登录</el-button>
        </div>
      </el-menu>
    </div>
  </div>
</template>

<script>
export default {
  data() {
      return {
        activeIndex: '1',
        category:[]
      };
    },
  methods: {
    handleSelect(key, keyPath) {
      // console.log(key, keyPath);
    }
  },
  mounted() {
    this.axios.get('/category').then(res=>{
      if(res.data.code==1){
        this.category=res.data.result;
      }
    });
  }
<<<<<<< HEAD
=======

>>>>>>> 01ba8dc... 摄影之家第二次提交
}
</script>

<style scope>
  body{
    margin: 0;
    padding: 0;
  }
  .content{
    background-color: #f5f5f5;
  }
  /* 顶部导航样式 */
  .nav-active{
    position: fixed;
    top: 0;
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
</style>

