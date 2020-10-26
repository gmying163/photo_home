<template>
<div class="container">
  <div class="login">
  <h2>注册</h2>
    <el-tabs v-model="active" @tab-click="handleClick">
      <!-- ----------------手机号码---------------------- -->
      <el-tab-pane label="手机号码" name="first" class="tabs">
        <div>
          <!------手机号码输入框开始------->
          <div>
            <p class="left">手机号</p><br>
            <select class="sub_phone">
              <option value="中国大陆" selected="selected">中国大陆</option>
              <option value="土耳其">土耳其</option>
              <option value="韩国">韩国</option>
            </select>
            <input v-model="phone" @blur="checkPhone" :state="phoneState" class="phone" type="text" placeholder="请输入手机号">
          </div>
          <!------手机号码输入框结束------->
          <!------验证码输入框开始------->
          <p class="left">短信验证码</p><br>
          <input v-model="verification"  type="text" class="code" placeholder="请输入验证码">
          <el-button v-show="sendAuthCode" class="auth_text auth_text_blue" @click="getAuthCode">获取验证码</el-button>
          <span v-show="!sendAuthCode" class="auth_text"> <span class="auth_text_blue">{{auth_time}} </span>
              秒之后重新发送</span>
          <!-- <a class="login_a" href="javascript">获取验证码</a><br>
          <div class="phone_code">125566</div> -->
          <!------验证码输入框结束------->
          <!------设置密码输入框开始------->
          <p class="left">设置密码</p><br>
          <input v-model="password" @blur="checkPassword" type="password" class="password" placeholder="请输入密码"><br>
          <p class="left">确认密码</p><br>
          <input v-model="conpassword" @blur="checkConpassword" type="password" class="password" placeholder="请输入密码"><br>
          <!------设置密码输入框结束------->
          <input class="checkbox" type="checkbox" v-model="isAgree"><span>已阅读并接受<a href="javascript:;"> 《POCO注册协议》</a></span><br/>
          <button @click="rehandle" class="my_button" :disabled="isAgree==false">注册</button><br>
          <div class="enterAccount"><a class="login_a" href="/login">已有账号？去登录</a></div>
        </div>
      </el-tab-pane>
      <!-- ----------------账号/用户名---------------------- -->
      <el-tab-pane label="账号/用户名" name="second">
        <div>
          <p class="left">用户名</p><br>
          <input v-model="username" @blur="checkUsername" :state="usernameState" type="username" class="username" placeholder="请输入用户名"><br>
          <p class="left">密&nbsp;&nbsp;码</p><br>
          <input v-model="password" @blur="checkPassword" :state="passwordState" type="password" class="pwd" placeholder="请输入密码"><br>
          <p class="left">确认密码</p><br>
          <input type="password" v-model="conpassword" @blur="checkConpassword" :state="conpasswordState" class="conpassword" placeholder="请输入确认密码"><br>
          <input class="checkbox" type="checkbox" v-model="isAgree"><span>已阅读并接受<a href="javascript:;"> 《POCO注册协议》</a></span><br/>
          <button @click="handle" class="my_button" :disabled="isAgree==false">注册</button><br>
          <div class="enterAccount"><a class="login_a" href="/login">已有账号？去登录</a></div>
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
        conpassword:'',
        usernameState:'',
        passwordState:'',
        conpasswordState:'',
        phone:'',
        code:'',
        phoneState:'',
        sendAuthCode: true,
        /*布尔值，通过v-show控制显示‘获取按钮’还是‘倒计时’ */
        auth_time: 0,
        show:true,
        count:'',
          ReginForm: {
          password: "",
          tel: ""
        },
        verification: "", //绑定输入验证码框框
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
      //校验验证码
      getAuthCode() {
      const verification = this.ReginForm.tel;
      const url = "/phone";

      const h = this.$createElement;
      let code = Math.ceil(Math.random() * 100000);
      this.$message({
        message: h('p', null, [
          h('span', null, '用户注册验证码为:'),
          h('i', { style: 'color: teal' }, code)
        ])
      });

      this.axios.post(url).then(res=>{
          console.log("请求成功", res);
        }
      );
      this.sendAuthCode = false;
      //设置倒计时秒
      this.auth_time = 30;
      var auth_timetimer = setInterval(() => {
        this.auth_time--;
        if (this.auth_time <= 0) {
          this.sendAuthCode = true;
          clearInterval(auth_timetimer);
        }
      }, 1000);
      let inputEle = document.getElementsByClassName('auth_input');
      // if(inputEle !== code){
      //   this.$message({
      //     message:"验证码输入错误",
      //     type:"warning"
      //   });
      //   return false;
      // }else{
      //   return true;
      // }
    },
      //校验用户名
      checkUsername(){
          let usernameRegExp=/^[0-9a-zA-Z_]{5,20}$/;
          if(this.username==""){
              // this.usernameState="error";
              this.$message({
                  message:"用户名不合法",
                  type:"warning"
              });
              return false;
          }else if(usernameRegExp.test(this.username)){
              /////////////////////图标
              this.usernameState='success';
              return true;
          }else{
              this.usernameState='error';
              this.$message({
                  message:"用户名5位~20位字母数字或特殊符号",
                  type:"warning"
              });
              return false;
          }
      },
      //校验密码
      checkPassword(){
          let passwordRegExp=/^[0-9a-zA-Z]{8,12}$/;
          if
          (this.password==""){
              this.$message({
                  message:"密码为必填项!",
                  type:"warning"
              });
              return false;
          }else if
          (passwordRegExp.test(this.password)){
              this.passwordState="success";
              return true;
          }else{
              this.passwordState="warning";
              this.$message({
                  message:"密码为8~12位数字字母的组合体",
                  type:"warning"
              });
              return false;
          }
      },
      checkConpassword(){
          if(this.conpassword==this.password){
              this.conpasswordState="success";
              return true;
          }else{
              this.conpasswordState="error";
              //短消息提示框
              this.$message.error({
                  message:"两次输入密码不一致",
              });
              return false;
          }
      },
      handle(){
          if(this.checkUsername() && this.checkPassword() && this.checkConpassword()){
              this.axios.post('/register','username=' + this.username + '&password=' + this.password)
              .then(res=>{
                  if(res.data.code == 1){
                    this.$router.push('/login');  
                  }else{
                      //消息提示框
                      this.$message("注册提示:用户名已占用")
                  }
              })
          }
      },
      rehandle(){
        if(this.checkPhone() && this.checkPassword() && this.checkConpassword()){
            this.axios.post('/registerPhone','phone=' + this.phone + '&password=' + this.password)
            .then(res=>{
                if(res.data.code == 1){
                  this.$router.push('/login');  
                }else{
                    //消息提示框
                    this.$message("注册提示:用户名已占用")
                }
            })
        }
      }
    },
  };
</script>
<style scoped>
*{
  margin:0;
  padding:0;
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
  top:130px;
  width: 444px;
  height:637px;
  padding:20px;
  background: #fff;
}
.username,.pwd,.conpassword,.my_button,.phone,.password,.my_button,.sub_phone,.code{
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
  width: 180px;
  margin-right: 10px
}
.login_a{
  color: #f56c6c;
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
  margin-right: 60px;
  float: right;
  text-align: center;
}
a{
  text-decoration: none;
  color: #111;
}
</style>
