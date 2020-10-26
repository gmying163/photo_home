<template>
  <div id="me">
    <Header/>
    <el-row>
      <el-col :span="24" :xs="24">
       <!-- 背景大图 -->
        <div class="headBg"> <div class="mask"></div></div>
      </el-col>
    </el-row>
    <!-- 顶部作者信息开始 -->
    <el-row>
      <!-- 布局4*16*4 -->
      <el-col :span="4"><div class="gird-content"></div></el-col>
      <!-- 信息内容开始 -->
      <el-col :span="16">
        <ul class="menu">
          <li class="line border left">
            <span>昵称</span>
            <div class="menu_nickname">{{info.nickname}}</div>
          </li>
          <li class="line">
            <span>作品</span>
            <div class="menu_number">{{info.log_number}}</div>
          </li>
          <li class="info_avatar">
            <img :src="info.avatar" alt="">
          </li>
          <li class="line border">
            <span>喜欢</span>
            <div class="menu_follow">{{info.likes}}</div>
          </li>
          <li class="line right">
            <span>浏览量</span>
            <div class="menu_views">{{info.views}}</div>
          </li>
        </ul>
      </el-col>
      <!-- 信息内容结束 -->
      <el-col :span="4"><div class="gird-content"></div></el-col>
    </el-row>
    <!--标签页开始 -->
    <el-row>
      <el-col :span="4"><div class="gird-content"></div></el-col>
      <el-col :span="16">
        <el-tabs v-model="activeName" @tab-click="handleClick" class="nav">
          <!-- nav1作品集 -->
          <el-tab-pane label="作品集" name="first">
            <div class="block">
              <el-timeline>
                <el-timeline-item timestamp="2018/4/12" placement="top">
                  <el-card>
                    <!-- 作品内容开始1 -->
                    <h3>《广州风云》</h3>
                    <img src="../assets/images/tp1.jpg" alt="">
<<<<<<< HEAD
                    <el-badge value="99" class="item">
                      <el-button size="small">评论</el-button>
                    </el-badge>
                    <el-badge value="hot" class="item">
                      <el-button size="small">回复</el-button>
                    </el-badge>
=======
>>>>>>> 01ba8dc... 摄影之家第二次提交
                    <!-- 作品内容结束1 -->
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2018/4/3" placement="top">
                  <el-card>
                    <h3>《夜之光绘》</h3>
                    <img src="../assets/images/tp2.jpg" alt="">
<<<<<<< HEAD
                    <el-badge value="99" class="item">
                      <el-button size="small">评论</el-button>
                    </el-badge>
                    <el-badge value="hot" class="item">
                      <el-button size="small">回复</el-button>
                    </el-badge>
=======
>>>>>>> 01ba8dc... 摄影之家第二次提交
                  </el-card>
                </el-timeline-item>
                <el-timeline-item timestamp="2018/4/2" placement="top">
                  <el-card>
                   <h3>《不夜的广州》</h3>
                    <img src="../assets/images/tp3.jpg" alt="">
<<<<<<< HEAD
                    <el-badge value="6" class="item">
                      <el-button size="small">评论</el-button>
                    </el-badge>
                    <el-badge value="hot" class="item">
                      <el-button size="small">回复</el-button>
                    </el-badge>
=======
>>>>>>> 01ba8dc... 摄影之家第二次提交
                  </el-card>
                </el-timeline-item>
              </el-timeline>
            </div>
          </el-tab-pane>
          <!-- nav2专辑 -->
          <el-tab-pane label="专辑" name="second">
            <div class="album">
              <img src="../assets/icon/list.png" alt="">
              <p>暂无专辑</p>
            </div> 
          </el-tab-pane>
          <!-- nav3收藏 -->
          <el-tab-pane label="收藏" name="third">
            <div class="collection">
              <img src="../assets/icon/list.png" alt="">
              <p>暂无收藏作品</p>
            </div>
          </el-tab-pane>
          <!-- nav4个人资料 -->
          <el-tab-pane label="个人资料" name="fourth">
            <!-- 表单-个人资料 -->
            <el-form ref="form" :model="form" label-width="90px" class="personInfo">
              <el-form-item label="昵称">
                <el-input v-model="info.nickname" readonly></el-input>
              </el-form-item>
              <el-form-item label="性别">
                <el-radio-group v-model="form.sex" readonly>
                  <el-radio label="男"></el-radio>
                  <el-radio label="女"></el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="年龄" >
                <el-input v-model="form.age" readonly></el-input>
              </el-form-item>
              <el-form-item label="居住地">
                <el-input v-model="form.address" readonly></el-input>
              </el-form-item>
              <el-form-item label="联系邮箱">
                <el-input v-model="form.email" readonly></el-input>
              </el-form-item>
              <el-form-item label="联系手机">
                <el-input v-model="form.phone" readonly></el-input>
              </el-form-item>
              <el-form-item label="个人签名">
                <el-input type="textarea" v-model="form.desc" readonly rows="3"></el-input>
              </el-form-item>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      </el-col>
      <el-col :span="4"><div class="gird-content"></div></el-col>
    </el-row>
  </div>   
</template>
<style scope>
  html,p,span,ul,li{
    padding: 0;
    margin: 0;
  }
  #me{
    background-color: #f5f5f5;
  }
  .el-col {
    border-radius: 4px;
  }
  .headBg{
    width: 100%;
    height: 400px;
    background-image: url('../assets/bg.png');
    position: relative;
  }
  .mask{
    width: 100%;
    height: 400px;
    background-color: rgba(0,0,0,0.1);
    position: relative;
  }
  .menu{
    display: flex;
    justify-content: space-around;
    align-items: center;
    font-family: 'Microsoft Yahei';
<<<<<<< HEAD
    margin-top: -70px;
=======
    margin-top: -95px;
>>>>>>> 01ba8dc... 摄影之家第二次提交
  }
  .menu li{
    line-height: 2;
    color: #fff;
    float: left;
    list-style: none;
  }
  .menu span{
    font-size: 14px;
  }
  .menu div{
    font-size: 17px;
    font-weight: 600;
  }
  .line{
    width: 25%;
  }
  .border{
    border-right: 2px solid #fff;
  }
  .info_avatar{
    width: 106px;
    height: 106px;
    border-radius: 50%;
    border:4px solid #fff;
    position: absolute;
<<<<<<< HEAD
    top:-60px;
    margin-bottom: 20px;
=======
    top:-75px;
>>>>>>> 01ba8dc... 摄影之家第二次提交
  }
  .info_avatar>img{
    width: 106px;
    height: 106px;
    border-radius: 50%;
  }
  .nav{
    margin-top: 10px;
  }
  #me .album,#me .collection{
    padding: 136px 0;
    background-color: #fff;
  }
  #me .personInfo{
    background-color: #fff;
    padding-bottom: 30px;
  }
  .personInfo .el-input{
    outline: 0;
    border:0;
  }
  .el-input__inner{
    width: 80%;
  }
  /* 上传头像 */
</style>

<script>
import Header from '@/components/Header.vue'
export default {
  data(){
    return {
      //文章数量
      nubmer:0,
      //存储文章的相关信息
      info:{

      },
      activeName: 'first',
      // 表单
      form: {
          name: '',
          address: '北京市',
          age: '保密',
          sex: '女',
          email:'无',
          phone:'无',
          desc: '无'
        },
        // 上传头像
    }
  },
   methods: {
      handleClick(tab, event) {
        console.log(tab, event);
      },
      onSubmit() {
        console.log('submit!');
      },
      // 上传头像
      
    },
  mounted(){
    //获取地址栏中的id,然后再向web服务器发送请求
    //let id=this.$router.params.id;
    let userId=2;
    this.axios.get('/me?id='+userId).then(res=>{
      let data=res.data.result;
      console.log(data);
      data.avatar=require('../assets/avatar/'+data.avatar);
      this.info = data;
      console.log(this.info);
    });
    },
    // 引入头部
    name:'Me',
    components: {
    Header
  }
}
</script>
  
   