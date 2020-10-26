<template>
  <div id="details">
    <Header/>
    <div class="details">
      <!-- 正文区域开始 -->
      <el-row :gutter="10">
        <!-- 栅格1 -->
        <el-col :span="4"><div class="gird-content"></div></el-col>
        <!-- 栅格2 -->
        <el-col :span="16">
          <el-row>
            <!-- 作者信息+正文 -->
            <div class="log-container">
              <!-- 栅格2-1 -->
              <el-col :span="8" :xs="24" :md="8">
                <!-- 作者信息开始 -->
                <div class="log-author">
                  <div class="author-top">
                    <!-- 头像 -->
                    <img :src="info.avatar" alt="" class="log-author-avator">
                    <!-- 昵称和发表篇数 -->
                    <div class="log-author-info">
                      <div class="log-author-nickname">{{info.nickname}}</div>
                      <div class="log-author-badge">发表<el-badge :value="info.log_number">
                      </el-badge>篇</div>
                      <div class="icon">
                        <div class="like"><img src="../assets/icon/like.png" alt="">{{info.likes}}</div>
                        <div class="view"><i class="el-icon-view">{{info.views}}</i>
                      </div>
                    </div>
                    </div>
                    <div class="author-follow"><el-button type="danger" icon="el-icon-plus">关注</el-button></div>
                  </div>
                  <div class="author-line"></div>
                  <!-- 收藏和评论 -->
                  <div class="author-bottom">
                    <div class="collection"><el-button type="danger" icon="el-icon-star-off" plain class="function">收藏</el-button></div> 
                    <div class="comment"><el-button class="function" type="danger" icon="el-icon-chat-dot-square" plain>评论</el-button></div>
                  </div> 
                </div>
              <!-- 作者信息结束 -->
              </el-col>
              <!-- 栅格2-2 -->
              <el-col :span="16" :xs="24" :md="16">
                <!-- 内容开始 -->
                <div class="log-content">
                  <!-- 发表时间 -->
                  <div class="log-publictime">{{this.moment.unix(info.created_at).format('YYYY-MM-DD hh:mm')}}</div>
                  <!-- 正文内容 -->
                  <p class="log-title">{{info.content}}</p>
                  <img :src="info.image" alt="">
                </div>
                <!-- 内容结束 -->
              </el-col>
            </div>
          </el-row>
        </el-col>
        <!-- 栅格3 -->
        <el-col :span="4"><div class="gird-content"></div></el-col>
      </el-row>
      <!-- 正文区域结束 -->
    </div>
    
  </div>
</template>
<style scope>
  html,p,span{
    padding: 0;
    margin: 0;
  }
  #details{
    background-color: #f5f5f5;
  }
  .details{
    margin-top: 80px;
  }
  .log-container{
    margin: 8px auto;
    background-color:#f2fbfb;
  }
  .log-container::after{
    content: "";
    display: block;
    clear: both;
  }
  .gird-content{
    min-height:36px ;
  }
  .log-author{
    min-height: 80px;
    font-size: 14px;
    margin: 10px 5px;
    padding: 10px;
  }
  .author-top::after{
    content: "";
    display: block;
    clear: both;
  }
  .log-content{
    text-align: left;
    font-size: 14px;
    padding: 0 30px;
    background-color: #fff;
  }
  .author-top>img{
    border-radius: 50%;
    float: left;
    margin-bottom: 10px;
  }
  .log-author-info{
    font-family: 'Microsoft Yahei';
    color: #909399;
    text-align: left;
    float: left;
    padding: 10px 20px;
  }
  .log-author-nickname{
    font-weight: 600;
  }
  .log-author-badge{
    margin-top: 15px;
  }
  .author-follow{
    text-align: center;
    line-height: 80px;
  }
  .icon{
    font-size: 12px;
    margin: 10px 0;
    display: flex;
    justify-content: space-between;
    align-items:flex-end;
  }
  .like{
    display: flex;
    justify-content: space-around;
    align-items:flex-end;
  }
  .author-line{
    border-bottom:1px solid #cbecec;
  }
  .function{
    margin: 10px;
    text-align: center;
  }
  .log-publictime{
    width: 100%;
    height: 63px;
    border-bottom: 1px dashed #e9e9e9;
    color: #85a6a6;
    font-size: 12px;
    line-height: 63px;
  }
  .log-title{
    margin: 24px 0;
    font-size: 16px;
    line-height: 2;
    color: #333;
  }
  .log-content img{
    width: 100%;
  }
  .author-bottom>div{
    margin: 10px;
  }
  @media screen and (min-width: 1500px){
    .author-bottom{
      display: flex;
      flex-direction: row wrap;
      justify-content: center;
    }
  }
</style>
<script>
import Header from '@/components/Header.vue'
export default {
  
 
  data(){
    return {
      //文章数量
      nubmer:0,
      //存储文章的相关信息
      info:{}
    }
  },
  mounted(){
    //获取地址栏中的id,然后再向web服务器发送请求
    let id=this.$route.params.id;
    this.axios.get('/details?id='+id).then(res=>{
      let data=res.data.result;
      data.avatar=require('../assets/avatar/'+data.avatar);
      data.image=require('../assets/images/'+data.image);
      this.info = data;
    });
  }, // 引入头部
  name: 'Details',
  components: {
    Header
  }
}
</script>
