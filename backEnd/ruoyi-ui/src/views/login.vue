<template>
  <div class="main">
    <div class="box">
      <div class="inner-box">
        <div class="forms-wrap">
          <!--前台表单-->
          <el-form ref="frontLoginForm" :model="frontLoginForm" :rules="frontLoginRules" class="sign-in-form">
            <div class="logo">
              <img src="../assets/logo/logo.png" alt="VegTrace"/>
              <h4>VegTrace</h4>
            </div>

            <div class="heading">
              <h2>智链惠农</h2>
              <h6>进入后台管理系统?</h6>
              <a href="#" class="toggle">切换</a>
            </div>
            <div class="actual-form">
              <el-form-item prop="userName">
                <div class="input-wrap">
                  <input
                    type="text"
                    minlength="1"
                    class="input-field"
                    autocomplete="off"
                    required
                    v-model="frontLoginForm.userName"
                  />
                  <label>UserName</label>
                </div>
              </el-form-item>
              <el-form-item prop="password">
                <div class="input-wrap">
                  <input
                    type="password"
                    minlength="1"
                    class="input-field"
                    autocomplete="off"
                    required
                    v-model="frontLoginForm.password"
                  />
                  <label>Password</label>
                </div>
              </el-form-item>
              <el-form-item>
                <el-button :loading="loading" class="sign-btn" @click.native.prevent="handleFrontLogin">
                  <span v-if="!loading">登 录</span>
                  <span v-else>登 录 中...</span>
                </el-button>
                <p class="text">
                  忘记密码或者存在问题? &nbsp请点击
                  <a href="#">获取帮助</a>
                </p>
              </el-form-item>
            </div>
          </el-form>
          <!--后台表单-->
          <el-form ref="backLoginForm" :model="backLoginForm" :rules="backLoginRules" class="sign-up-form">
            <div class="logo">
              <img src="../assets/logo/logo.png" alt="VegTrace"/>
              <h4>VegTrace</h4>
            </div>

            <div class="heading">
              <h2>后台管理</h2>
              <h6>进入蔬菜销售系统?</h6>
              <a href="#" class="toggle">切换</a>
            </div>

            <div class="actual-form">
              <el-form-item prop="username">
                <div class="input-wrap">
                  <input
                    type="text"
                    minlength="1"
                    class="input-field"
                    autocomplete="off"
                    required
                    v-model="backLoginForm.username"
                  />
                  <label>UserName</label>
                </div>
              </el-form-item>
              <el-form-item prop="password">
                <div class="input-wrap">
                  <input
                    type="password"
                    minlength="1"
                    class="input-field"
                    autocomplete="off"
                    required
                    v-model="backLoginForm.password"
                  />
                  <label>Password</label>
                </div>
              </el-form-item>

              <el-form-item prop="code" v-if="captchaEnabled">
                <div class="input-wrap">
                  <input
                    type="text"
                    class="input-field input-field-code"
                    autocomplete="off"
                    required
                    v-model="backLoginForm.code"
                  />
                  <label>Code</label>
                  <img :src="codeUrl" @click="getCode" class="login-code-img" alt=""/>
                </div>
              </el-form-item>
              <el-form-item>
                <el-button :loading="loading" class="sign-btn" @click.native.prevent="handleBackLogin">
                  <span v-if="!loading">登 录</span>
                  <span v-else>登 录 中...</span>
                </el-button>
                <p class="text">-->
                  忘记密码或者存在问题? &nbsp请点击
                  <a href="#">获取帮助</a>
                </p>
              </el-form-item>
            </div>
          </el-form>
        </div>

        <div class="carousel">
          <div class="images-wrapper">
            <img src="../assets/images/vegetables.jpg" class="image img-1 show" alt=""/>
            <img src="../assets/images/tomatoes.jpg" class="image img-2" alt=""/>
            <img src="../assets/images/paprika.jpg" class="image img-3" alt=""/>
          </div>

          <div class="text-slider">
            <div class="text-wrap">
              <div class="text-group">
                <h2>绿色蔬菜，健康生活</h2>
                <h2>品质保证，源自农田</h2>
                <h2>产地直销，明智之选</h2>
              </div>
            </div>

            <div class="bullets">
              <span class="active" data-value="1"></span>
              <span data-value="2"></span>
              <span data-value="3"></span>
            </div>
          </div>
        </div>

      </div>
    </div>

  </div>

</template>

<script>
import {frontLogin, getCodeImg} from "@/api/login";
import Cookies from "js-cookie";
import {encrypt, decrypt} from '@/utils/jsencrypt';

export default {
  name: "Login",
  data() {
    return {
      codeUrl: "",
      // 前台登录表单
      frontLoginForm: {
        userName: undefined,
        password: undefined
      },
      // 后台登录表单
      backLoginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: ""
      },
      frontLoginRules: {
        userName: [
          {required: true, trigger: "blur", message: "请输入您的账号"}
        ],
        password: [
          {required: true, trigger: "blur", message: "请输入您的密码"}
        ]
      },
      backLoginRules: {
        username: [
          {required: true, trigger: "blur", message: "请输入您的账号"}
        ],
        password: [
          {required: true, trigger: "blur", message: "请输入您的密码"}
        ],
        code: [{required: true, trigger: "change", message: "请输入验证码"}]
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
      // 注册开关
      register: false,
      redirect: undefined,
      // 轮播图
      currentIndex: 1,
      // 定时器
      timer: null,
    };
  },
  watch: {
    $route: {
      handler: function (route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true
    }
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  mounted() {
    const inputs = document.querySelectorAll(".input-field");
    const toggle_btn = document.querySelectorAll(".toggle");
    const main = document.querySelector(".main");

    // 输入框动态效果
    inputs.forEach((inp) => {
      if (inp.value !== "") {
        inp.classList.add("active");
      }
      inp.addEventListener("focus", () => {
        inp.classList.add("active");
      });
      inp.addEventListener("blur", () => {
        if (inp.value !== "") return;
        inp.classList.remove("active");
      });
    });

    // 切换按钮
    toggle_btn.forEach((btn) => {
      btn.addEventListener("click", () => {
        main.classList.toggle("sign-up-mode");
      });
    });

    this.timer = setInterval(this.autoMove, 3000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  methods: {
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.backLoginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get('rememberMe')
      this.backLoginForm = {
        username: username === undefined ? this.backLoginForm.username : username,
        password: password === undefined ? this.backLoginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    handleFrontLogin() {
      this.$refs.frontLoginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          frontLogin(this.frontLoginForm).then(res => {
            if (res.code === 200) {
              this.$message.success("登录成功");
              const url = "http://127.0.0.1:5500/MainPage.html?userId=" + encodeURIComponent(res.data);
              window.location.replace(url);
            }else {
              this.$message.error(res.msg);
            }
          }).catch(() => {
            this.loading = false;
          });
        }
      });
    },
    handleBackLogin() {
      this.$refs.backLoginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          if (this.backLoginForm.rememberMe) {
            Cookies.set("username", this.backLoginForm.username, {expires: 30});
            Cookies.set("password", encrypt(this.backLoginForm.password), {expires: 30});
            Cookies.set('rememberMe', this.backLoginForm.rememberMe, {expires: 30});
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove('rememberMe');
          }
          this.$store.dispatch("Login", this.backLoginForm).then(() => {
            this.$router.push({path: this.redirect || "/"}).catch(() => {
            });
          }).catch(() => {
            this.loading = false;
            if (this.captchaEnabled) {
              this.getCode();
            }
          });
        }
      });
    },
    autoMove() {
      const images = document.querySelectorAll(".image");
      const textSlider = document.querySelector(".text-group");
      const bullets = document.querySelectorAll(".bullets span");

      // 隐藏当前图片和文字
      images[this.currentIndex - 1].classList.remove("show");
      textSlider.style.transform = `translateY(-${(this.currentIndex - 1) * 2.2}rem)`;

      this.currentIndex = (this.currentIndex % 3) + 1;

      images[this.currentIndex - 1].classList.add("show");
      textSlider.style.transform = `translateY(-${(this.currentIndex - 1) * 2.2}rem)`;

      // 切换活动状态的小圆点
      bullets.forEach((bull) => bull.classList.remove("active"));
      bullets[this.currentIndex - 1].classList.add("active");
    },
  }
};
</script>

<style scoped>

.el-form-item >>> .el-form-item__error {
  top: 54% !important;
}

.login-code-img {
  width: 40%;
  height: 100%;
  margin-left: 58%;
  border-radius: 0.5rem;
  border: 1px solid #bbb;
}

.main {
  width: 100%;
  min-height: 100vh;
  overflow: hidden;
  background-color: #bae3eb;
  padding: 2rem;
  display: flex;
  align-items: center;
  justify-content: center;
}

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

*,
*::before,
*::after {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body,
input {
  font-family: "Poppins", sans-serif;
}


.box {
  position: relative;
  width: 100%;
  max-width: 1020px;
  height: 640px;
  background-color: #fff;
  border-radius: 3.3rem;
  box-shadow: 0 60px 40px -30px rgba(0, 0, 0, 0.4);
}

.inner-box {
  position: absolute;
  width: calc(100% - 4.1rem);
  height: calc(100% - 4.1rem);
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.forms-wrap {
  position: absolute;
  height: 100%;
  width: 45%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1fr;
  transition: 0.8s ease-in-out;
}

form {
  max-width: 260px;
  width: 100%;
  margin: 0 auto;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
  transition: opacity 0.02s 0.4s;
}

form.sign-up-form {
  opacity: 0;
  pointer-events: none;
}

.logo {
  display: flex;
  align-items: center;
}

.logo img {
  width: 38px;
  margin-right: 0.3rem;
  border-radius: 20px;
}

.logo h4 {
  font-size: 1.2rem;
  margin-top: -1px;
  letter-spacing: -0.5px;
  color: #151111;
}

.heading {
  margin-bottom: 1.2rem;
}

.heading h2 {
  font-size: 2.1rem;
  font-weight: 600;
  color: #151111;
}

.heading h6 {
  color: #bababa;
  font-weight: 400;
  font-size: 0.75rem;
  display: inline;
}

.toggle {
  color: #151111;
  text-decoration: none;
  font-size: 0.75rem;
  font-weight: 500;
  transition: 0.3s;
}

.toggle:hover {
  color: #8371fd;
}

.input-wrap {
  position: relative;
  height: 37px;
  margin-bottom: 2rem;
}

.input-field {
  position: absolute;
  width: 100%;
  height: 100%;
  background: none;
  border: none;
  outline: none;
  border-bottom: 1px solid #bbb;
  padding: 0;
  font-size: 0.95rem;
  color: #151111;
  transition: 0.4s;
}

.input-field-code {
  width: 55%;
}

label {
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  font-size: 0.95rem;
  color: #bbb;
  pointer-events: none;
  transition: 0.4s;
}

.input-field.active {
  border-bottom-color: #151111;
}

.input-field.active + label {
  font-size: 0.75rem;
  top: -2px;
}

.sign-btn {
  display: inline-block;
  width: 100%;
  height: 43px;
  background-color: #151111;
  color: #fff;
  border: none;
  cursor: pointer;
  border-radius: 0.8rem;
  font-size: 0.8rem;
  margin-bottom: 2rem;
  transition: 0.3s;
}

.sign-btn:hover {
  background-color: #8371fd;
  color: #fff;
}

.text {
  color: #bbb;
  font-size: 0.7rem;
}

.text a {
  color: #bbb;
  transition: 0.3s;
}

.text a:hover {
  color: #8371fd;
}

.main.sign-up-mode form.sign-in-form {
  opacity: 0;
  pointer-events: none;
}

.main.sign-up-mode form.sign-up-form {
  opacity: 1;
  pointer-events: all;
}

.main.sign-up-mode .forms-wrap {
  left: 55%;
}

.main.sign-up-mode .carousel {
  left: 0%;
}

.carousel {
  position: absolute;
  height: 100%;
  width: 55%;
  left: 45%;
  top: 0;
  background-color: #d0f0c0;
  border-radius: 2rem;
  display: grid;
  grid-template-rows: auto 1fr;
  padding-bottom: 2rem;
  overflow: hidden;
  transition: 0.8s ease-in-out;
}

.images-wrapper {
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 1fr;
}

.image {
  width: 100%;
  height: 380px;
  grid-column: 1/2;
  grid-row: 1/2;
  opacity: 0;
  transition: opacity 0.3s, transform 0.5s;
}

.img-1 {
  transform: translate(0, -50px);
}

.img-2 {
  transform: scale(0.4, 0.5);
}

.img-3 {
  transform: scale(0.3) rotate(-20deg);
}

.image.show {
  opacity: 1;
  transform: none;
}

.text-slider {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.text-wrap {
  max-height: 2.2rem;
  overflow: hidden;
  margin-bottom: 2.5rem;
}

.text-group {
  display: flex;
  flex-direction: column;
  text-align: center;
  transform: translateY(0);
  transition: 0.5s;
}

.text-group h2 {
  line-height: 2.2rem;
  font-weight: 600;
  font-size: 1.6rem;
}

.bullets {
  display: flex;
  align-items: center;
  justify-content: center;
}

.bullets span {
  display: block;
  width: 0.5rem;
  height: 0.5rem;
  background-color: #aaa;
  margin: 0 0.25rem;
  border-radius: 50%;
  cursor: pointer;
  transition: 0.3s;
}

.bullets span.active {
  width: 1.1rem;
  background-color: #151111;
  border-radius: 1rem;
}

</style>
