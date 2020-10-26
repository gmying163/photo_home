<template>
<div class="container">
  <div class="login">
  <h2>登 录</h2>
    <el-tabs v-model="active" @tab-click="handleClick">
      <el-tab-pane label="手机号码" name="first" class="tabs">
        <div>
          <div>
            <p class="left">手机号</p><br>
            <select class="sub_phone">
              <option value="中国大陆" selected="selected">中国大陆</option>
              <option value="土耳其">土耳其</option>
              <option value="韩国">韩国</option>
            </select>
            <input v-model="phone" @blur="checkPhone" :state="phoneState" class="phone" type="text" placeholder="请输入手机号">
          </div>
          <p class="left">密 码</p><br>
          <input v-model="password" @blur="checkPassword" type="password" class="password" placeholder="请输入密码"><br>
          <button class="my_button" @click="rehandle()">登 录</button><br>
          <div class="enterAccount_left"><a class="login_a1" href="/register">新用户注册</a></div>
          <div class="enterAccount_right"><a class="login_a2" href="javascript:;">忘记密码？</a></div>
          <!-- 底部横线 -->
          <div class="botton_line">
            <span class="line"></span>
            <span class="text">或 者</span>
            <span class="line"></span>
          </div>
          <div class="bottom_icon">
            <a href="javascript:;"><img src="../assets/icon/qq.png" alt=""></a>
            <a href="javascript:;"><img src="../assets/icon/weixin.png" alt=""></a>
            <a href="javascript:;"><img src="../assets/icon/weibo.png" alt=""></a>
          </div>
        </div>
      </el-tab-pane>
      <!-- ----------账号/用户名 ---------------------->
      <el-tab-pane label="账号/用户名" name="second">
        <div>
          <p class="left">用户名/账号</p><br>
          <input v-model="username" @blur="checkUsername()" type="username" class="username" placeholder="请输入用户名" :state="usernameState"><br>
          <p class="left">密 码</p><br>
          <input v-model="password" @blur="checkPassword" type="password" class="pwd" placeholder="请输入密码" :state="passwordState"><br>
          <button class="my_button" @click="handle()">登 录</button><br>
          <div class="enterAccount_left"><a class="login_a1" href="/register">新用户注册</a></div>
          <div class="enterAccount_right"><a class="login_a2" href="javascript:;">忘记密码？</a></div>
          <!-- 底部横线 -->
          <div class="botton_line">
            <span class="line"></span>
            <span class="text">或 者</span>
            <span class="line"></span>
          </div>
          <div class="bottom_icon">
            <a href="javascript:;"><img src="../assets/icon/qq.png" alt=""></a>
            <a href="javascript:;"><img src="../assets/icon/weixin.png" alt=""></a>
            <a href="javascript:;"><img src="../assets/icon/weibo.png" alt=""></a>
          </div>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</div>
</template>
<script>
  export default {
    data() {
      return {
        active: 'first',
        isAgree:false,
        username:'',
        password:'',
        usernameState:'',
        passwordState:'',
        phone:'',
        phoneState:'',
      };
    },
    methods: {
      handleClick(tab, event) {
        //console.log(tab, event);
      },
      //校验手机号
      checkPhone(){
        let phoneRegExp = /^1[0-9]{10}$/;
        if(this.phone==""){
          this.$message({
            message:"手机号为必填项",
            type:"warning"
          });
          return false;
        }else if(phoneRegExp.test(this.phone)){
          /////////////////////图标
          this.usernameState='success';
          return true;
        }else{
          this.phoneState='error';
          this.$message({
            message:"手机号为11位数字",
            type:"warning"
          });
          return false;
        }
      },
      //校验用户名
        checkUsername(){
            let usernameRegExp=/^[0-9a-zA-Z_]{5,20}$/;
            if(this.username==""){
                // this.usernameState="error";
                this.$message({
                    message:"用户名不合法",
                    type:"warning"
                })
                return false;
            }else if(usernameRegExp.test(this.username)){
                return true;
            }else{
                this.usernameState='error';
                this.$message({
                    message:"用户名6位~20位字母数字或特殊符号",
                    type:"warning"
                });
                return false;
            }
        },
        //校验密码
        checkPassword(){
          let passwordRegExp=/^[0-9a-zA-Z]{5,12}$/;
          if(this.password==""){
               this.$message({
                  message:"密码为必填项",
                  type:"warning"
              });
              return false;
          }else if(passwordRegExp.test(this.password)){
              return true;
          }else{
              this.passwordState="warning";
              this.$message({
                  message:"密码为8~12位数字字母的组合体",
                  type:"warning"
              });
              return false;
          };
        },
        handle(){
          if(this.checkUsername() && this.checkPassword()){
            this.$router.push('/');
          }else{
            this.$message.error("用户名或密码错误")
          }
        },
        rehandle(){
          if(this.checkPhone() && this.checkPassword()){
            let obj={
                phone:this.phone,
                password:this.password
            };
            // this.$store.dispatch('loginPhoto',obj);
            console.log(obj);
            this.axios.post('/loginPhoto',this.qs.stringify(obj))
            .then(res=>{
               if(res.data.code == 1){
                    //提交mutations
                    this.$store.commit('logined');
                    //为什么还要玩个webstroge中存储呢？因为用户刷新后数据依然要保持 
                    localStorage.setItem("isLogined",1);
                   this.$message({
                    message:"恭喜你，登录成功！",
                    type:"success"
                  });
                  this.isLogined=1;
                  this.$router.push('/');
                }else{
                  this.$message.error("用户名或密码错误")
                }
            })
          }
      }
    }
  };
</script>
<style scoped>
*{
  margin:0;
  padding:0;
}
.bottom_icon{
  margin-top: 114px;
  margin-left: 36px
}
img{
  width:32px;
  height: 32px;
  margin-right: 40px;
}
.botton_line{
    float: left;
    width:500px;
    margin-left: -31px;
    line-height:36px;
    text-align:center;
    margin-top: 30px;
}
.text{
  margin: 18px
}
.line
{
    display:inline-block;
    width:132px;
    border-top:1px solid #cccccc;
    vertical-align:5px;
}
.bdo span{
  display: inline-block;
  margin: 10px 30px 20px 30px;
  font-size: 18px;
}
.bdo>span>a:hover{
  color: #f56c6c;
}
.container{
  background-image: url('../assets/timg.jpg');
  width: 1920px;
<<<<<<< HEAD
  height: 969px;
=======
  height: 937px;
>>>>>>> 01ba8dc... 摄影之家第二次提交
}
.checkbox{
  margin-top: 15px;
  margin-bottom: 15px;
}
.login h2{
  font-size: 24px;
  padding-bottom: 20px;
  padding-top: 10px;
  color: #111;
  font-weight: 400;
  line-height: 1;
  font-family: PingFang SC,Helvetica,"WenQuanYi Micro Hei","Microsoft Yahei",Arial,sans-serif;
}
.my_p{
  font-size: 30px;
}
.left{
  text-align: left;
  margin-left:60px;
  margin-top:10px;
  margin-bottom: -10px;
  font-family: PingFang SC,Helvetica,"WenQuanYi Micro Hei","Microsoft Yahei",Arial,sans-serif;
  line-height: 1;
}
.login{
  position: relative;
  left:710px;
  top:150px;
  width: 444px;
  height:560px;
  padding:20px;
  background: #fff;
}
.username,.pwd,.repwd,.my_button,.phone,.password,.my_button,.sub_phone,.code{
  left:-50px;
  width:300px;
  height:20px;
  padding:10px;
  margin:10px auto;
  outline: 0
}
.my_button{
  margin-top:20px;
  height:50px;
  width: 324px;
  outline: none;
  border: none;
}
.code{
  width: 212px;
  margin-right: 10px
}
.login_a1{
  color: #f56c6c;
  float: left;
  margin-top: 10px;
  margin-left: 58px;
}
.login_a2{
  color: #f56c6c;
  float: right;
  margin-top: 10px;
  margin-right: 52px;
}
.phone{
  width: 192px
}
.sub_phone{
  width: 98px;
  height: 44px;
  padding:10px;
  margin-right: 10px;
  outline: none
}
.sub_phone option{
  font-size: 10px
}
.enterAccount{
  z-index: 999;
  color: #999;
  font-size: 16px;
  margin-top: 10px;
  margin-left: 50px;
  float: right;
  text-align: left;
}
a{
  text-decoration: none;
  color: #111;
}
</style>
