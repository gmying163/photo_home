<template>
  <div id="footer">
    <el-row>
      <el-col :span="4"><div class="grid-content"></div></el-col>
      <el-col :span="16">
        <el-breadcrumb separator="|">
          <el-breadcrumb-item>关于我们</el-breadcrumb-item>
          <el-breadcrumb-item>广告投放</el-breadcrumb-item>
          <el-breadcrumb-item>版权声明</el-breadcrumb-item>
          <el-breadcrumb-item>免责声明</el-breadcrumb-item>
          <el-breadcrumb-item>留言反馈</el-breadcrumb-item>
        </el-breadcrumb>
        <p>版权所有 2020-2026 摄影之家(www.sj33.cn)</p>
        <p>Copyright © 2020-2026 www.sj33.cn All rights reserved.</p>
        <img src="../assets/contact.jpg" alt="">
      </el-col>
      <el-col :span="4"><div class="grid-content"></div></el-col>
    </el-row>
  </div>
</template>
<style scope>
  #footer{
    width: 100%;
    height: 100px;
    background-color: #fff;
    border-top: 2px solid #f56c6c;
    padding: 20px 0;
  }
  #footer p{
    font-size: 14px;
    text-align: left;
    margin: 20px 0;
  }
  #footer img{
    width: 110px;
    float: right;
    position: absolute;
    top: 10px;
    right: 315px;
  }
</style>
<script>
export default {

}
</script>