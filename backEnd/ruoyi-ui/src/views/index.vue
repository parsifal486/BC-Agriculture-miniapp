<template>
  <div class="app-container home">

    <!-- 顶部工作区   -->
    <div class="border top-content" v-loading="loading">
      <el-row>
        <el-col style="padding-left: 20px; margin-top:-7px;" :span="4">
          <p style="padding-left: 20px;font-size: 20px;font-weight: 100;">工作台</p>
        </el-col>
        <el-col :offset="15" :span="5">
          <img :src="clock" class="time-img" alt="alt"/>
          <span style="position: relative;top: -5px;font-weight: 100;">
            {{ time }}
          </span>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24">
          <el-divider></el-divider>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="2">
          <img :src="avatar" class="avatar" alt="alt">
        </el-col>
        <el-col :span="10" class="ml10">
          <el-row>
            <h2>{{ currentHour }}！管理员，开始您一天的工作吧！</h2>
          </el-row>
          <el-row>
            <h3 style="font-size: 20px;font-weight: 100;margin-top: 0;color:  #606266">{{ greet }}</h3>
          </el-row>
        </el-col>
        <el-col :span="9" :offset="1" class="ul-div">
          <el-col :span="3" :offset="5">
            <img :src="audit" class="img" alt="alt"/>
            <h4 class="ul-h4">待办</h4>
            <div class="ul-span" id="special">
              <h1>1</h1> / {{ work+1 }}
            </div>
          </el-col>
          <el-col :span="4" :offset="5">
            <img :src="origin" class="img" alt="alt"/>
            <h4 class="ul-h4">作物溯源</h4>
            <div class="ul-span">
              <h1>{{ trace }}</h1>
            </div>
          </el-col>
          <el-col :span="3" :offset="4">
            <img :src="more" class="img" alt="alt"/>
            <h4 class="ul-h4">公告</h4>
            <div class="ul-span">
              <h1>{{ notice }}</h1>
            </div>
          </el-col>
        </el-col>
      </el-row>
    </div>

    <section class="content">
      <div class="left-content border">
        <div class="activities">
          <h1>热销蔬菜</h1>
          <div class="activity-container">
            <div class="image-container img-one">
              <img
                src="https://p1.ssl.qhimg.com/t01472539910c3d5ba6.jpg"
                alt=""/>
              <div class="overlay">
                <h3>上海青</h3>
              </div>
            </div>

            <div class="image-container img-two">
              <img
                src="https://www.cixinge.cn/rl_img/12384gq.jpg"
                alt=""/>
              <div class="overlay">
                <h3>小米椒</h3>
              </div>
            </div>

            <div class="image-container img-three">
              <img
                src="https://gss0.baidu.com/70cFfyinKgQFm2e88IuM_a/baike/pic/item/8759287a24b1b1f52e73b304.jpg"
                alt=""/>
              <div class="overlay">
                <h3>西兰花</h3>
              </div>
            </div>

            <div class="image-container img-four">
              <img
                src="https://ooo.0x0.ooo/2024/02/13/Ov2rA6.jpg"
                alt=""/>
              <div class="overlay">
                <h3>薄荷叶</h3>
              </div>
            </div>

            <div class="image-container img-five">
              <img
                src="https://cp1.douguo.com/upload/caiku/4/d/1/yuan_4dac410aa4dc2d578b8051fbd18a7b81.jpg"
                alt=""/>
              <div class="overlay">
                <h3>红莲藕带</h3>
              </div>
            </div>

            <div class="image-container img-six">
              <img
                src="https://gss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/8644ebf81a4c510fd640ef7a6659252dd52aa5cd.jpg"
                alt=""/>
              <div class="overlay">
                <h3>猴头菇</h3>
              </div>
            </div>
          </div>
        </div>

        <div class="left-bottom">
          <div class="weekly-schedule">
            <h1>本周计划</h1>
            <div class="calendar">
              <div class="day-and-activity activity-one">
                <div class="day">
                  <h1>13</h1>
                  <p>mon</p>
                </div>
                <div class="activity">
                  <h2>市场调研</h2>
                  <div class="participants">
                    <img
                      src="https://s2.loli.net/2024/02/10/6MXAerwPRKOH4Qo.jpg"
                      style="--i: 1" alt=""/>
                    <img
                      src="https://s2.loli.net/2024/02/08/Ds1nCMEFHOoQeAG.jpg"
                      style="--i: 2" alt=""/>
                    <img
                      src="https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg"
                      style="--i: 3" alt=""/>
                  </div>
                </div>
                <button class="btn">加入</button>
              </div>

              <div class="day-and-activity activity-two">
                <div class="day">
                  <h1>15</h1>
                  <p>wed</p>
                </div>
                <div class="activity">
                  <h2>仓库进货</h2>
                  <div class="participants">
                    <img
                      src="https://s2.loli.net/2024/02/10/6MXAerwPRKOH4Qo.jpg"
                      style="--i: 1" alt=""/>
                    <img
                      src="https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg"
                      style="--i: 2" alt=""/>
                  </div>
                </div>
                <button class="btn">加入</button>
              </div>

              <div class="day-and-activity activity-three">
                <div class="day">
                  <h1>17</h1>
                  <p>fri</p>
                </div>
                <div class="activity">
                  <h2>新品上市</h2>
                  <div class="participants">
                    <img
                      src="https://s2.loli.net/2024/02/08/Ds1nCMEFHOoQeAG.jpg"
                      style="--i: 1" alt=""/>
                    <img
                      src="https://s2.loli.net/2024/02/10/gSZ7O24NopXJamq.jpg"
                      style="--i: 2" alt=""/>
                    <img
                      src="https://s2.loli.net/2024/02/10/dzQnjktuSAPXrOy.jpg"
                      style="--i: 3" alt=""/>
                  </div>
                </div>
                <button class="btn">加入</button>
              </div>

            </div>
          </div>

          <div class="personal-bests">
            <h1>物流保障</h1>
            <div class="personal-bests-container">
              <div class="best-item box-one">
                <p>空运管理: 12 架</p>
                <img
                  src="../assets/images/plane.png"
                  alt=""/>
              </div>
              <div class="best-item box-two">
                <p>陆运管理: 75 辆</p>
                <img
                  src="../assets/images/train.png"
                  alt=""/>
              </div>
              <div class="best-item box-three">
                <p>海运管理: 26 艘</p>
                <img
                  src="../assets/images/boat.png"
                  alt=""/>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="right-content border">
        <div class="active-calories">
          <h1 style="align-self: flex-start">营业额</h1>
          <div class="active-calories-container">
            <div class="box" style="--i: 76%">
              <div class="circle">
                <h2>76<small>%</small></h2>
              </div>
            </div>
            <div class="calories-content">
              <p><span>本日:</span> 6.35万</p>
              <p><span>本周:</span> 41.26万</p>
              <p><span>本月:</span> 167.98万</p>
            </div>
          </div>
        </div>

        <div class="friends-activity">
          <h1>活动公告</h1>
          <div class="card-container">
            <div class="card">
              <div class="card-user-info">
                <img
                  src="https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg"
                  alt=""/>
                <h2>David</h2>
              </div>
              <img class="card-img"
                   src="https://cdn.pixabay.com/photo/2019/04/26/07/14/store-4156934_1280.png"
                   alt=""/>
              <p>我们达成了与相关供应商的合作，真正实现产地直销，并成功上线!️🎉</p>
            </div>

            <div class="card card-two">
              <div class="card-user-info">
                <img
                  src="https://s2.loli.net/2024/02/10/dzQnjktuSAPXrOy.jpg"
                  alt=""/>
                <h2>Charlotte</h2>
              </div>
              <img class="card-img"
                   src="https://cdn.pixabay.com/photo/2016/06/13/09/57/meeting-1453895_1280.png"
                   alt=""/>
              <p>通过大家的相互合作，公司业绩飞速增长!世界五百强指日可待~💪</p>
            </div>
          </div>
        </div>
      </div>
    </section>

  </div>
</template>

<script>
import {getNotices, getTraces, getWeather, getWorks} from "@/api";
import avatar from "@/assets/images/profile.jpg";
import clock from "@/assets/images/time.png";
import audit from "@/assets/images/audit.png";
import origin from "@/assets/images/origin.png";
import more from "@/assets/images/more.png";

export default {
  name: "Index",
  data() {
    return {
      more: more,
      origin: origin,
      audit: audit,
      // 头像
      avatar: avatar,
      // 问候语
      greet: undefined,
      // 当前小时
      currentHour: undefined,
      // 遮罩层
      loading: true,
      // 时间
      time: "",
      // 定时器
      timer: undefined,
      // 时钟图标
      clock: clock,
      // 待办
      work: 0,
      // 溯源
      trace: 0,
      // 公告
      notice: 0,
    };
  },
  created() {
    this.getGreeting();
    this.getCurrentHour();
    this.getWork();
    this.getTrace();
    this.getNotice();
    this.getFormatTime();// 初始化时间
    this.timer = setInterval(() => {
      this.getFormatTime(); // 每秒更新时间
    }, 1000);
  },
  beforeDestroy() {
    clearInterval(this.timer);
  },
  methods: {
    // 获取问候语
    getGreeting() {
      this.loading = true;
      getWeather().then(res => {
        let temp = res.now.temp;
        let text = res.now.text;
        if (temp < 10) {
          this.greet = "今天的天气比较寒冷，注意保暖哦~";
        } else if (temp > 25 && text === '多云') {
          this.greet = "今天天气多云，适合户外运动哦~";
        } else if (temp > 30 && text === '晴天') {
          this.greet = "今天是个炎热的夏日，请注意防晒和补充水分哦~";
        } else if (text.includes('阴') || text.includes('雨')) {
          this.greet = "今天可能会下雨，出门别忘记带伞哦~";
        } else {
          this.greet = "今天天气不错，适合出门走走哦~";
        }
        this.loading = false;
      }).catch(err => {
        console.log(err);
      })
    },
    // 获取当前小时
    getCurrentHour() {
      let currentHour = new Date().getHours();
      if (currentHour < 6) {
        this.currentHour = "凌晨好";
      } else if (currentHour < 9) {
        this.currentHour = "早上好";
      } else if (currentHour < 12) {
        this.currentHour = "上午好";
      } else if (currentHour < 14) {
        this.currentHour = "中午好";
      } else if (currentHour < 17) {
        this.currentHour = "下午好";
      } else if (currentHour < 19) {
        this.currentHour = "傍晚好";
      } else if (currentHour < 22) {
        this.currentHour = "晚上好";
      } else {
        this.currentHour = "深夜好";
      }
    },
    // 获取规范时间(年月日 时分秒 星期)
    getFormatTime() {
      let date = new Date();
      let year = date.getFullYear();
      let month = date.getMonth() + 1;
      let day = date.getDate();
      let hour = date.getHours();
      let minute = date.getMinutes();
      let second = date.getSeconds();
      let week = date.getDay();
      let weeks = ['日', '一', '二', '三', '四', '五', '六'];
      // 补齐时、分、秒的位数
      hour = hour < 10 ? '0' + hour : hour;
      minute = minute < 10 ? '0' + minute : minute;
      second = second < 10 ? '0' + second : second;
      this.time = year + "年" + month + "月" + day + "日 " + hour + ":" + minute + ":" + second + " 星期" + weeks[week];
    },
    // 获取待办
    getWork() {
      this.loading = true;
      const params = {
        auditFlag: 0,
      };
      getWorks(params).then(res => {
        this.work = res.total;
        this.loading = false;
      }).catch(err => {
        console.log(err);
      })
    },
    // 获取溯源
    getTrace() {
      this.loading = true;
      getTraces().then(res => {
        let tmp = res.data;
        this.trace = res.total;
        this.loading = false;
      }).catch(err => {
        console.log(err);
      })
    },
    // 获取公告
    getNotice() {
      this.loading = true;
      getNotices().then(res => {
        this.notice = res.total;
        this.loading = false;
      }).catch(err => {
        console.log(err);
      })
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900;1000&family=Roboto:wght@300;400;500;700&display=swap");

.top-content{
  background: #f6f7fb;
}

.time-img {
  margin-top: 16px;
  margin-left: 2px;
  width: 22px;
  height: 22px;
}

.img {
  width: 32px;
  height: 32px;
}

.ul-div {
  position: relative !important;
  top: 18px !important;
  left: 2px !important;
}

#special {
  left: 20px;
}

.ul-span {
  position: relative;
  top: -54px;
  left: 35px;
  font-size: 16px;
}

.ul-span h1 {
  display: inline;
}

.ul-h4 {
  position: relative;
  top: -51px;
  left: 36px;
  font-weight: 100;
}

.border {
  border: 3px solid #ccc;
  box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2),
  -2px -2px 4px rgba(255, 255, 255, 0.2);
  border-radius: 10px;
}

.avatar {
  width: 90px;
  height: 90px;
  margin-left: 20px;
  border-radius: 50%;
  border: 1px solid #e0dfdb;
  box-shadow: 0 0 10px #eee;
}

.el-row h2 {
  color: #303133;
}

.el-divider {
  margin: -19px 0;
}

/* CONTENT */

.content {
  display: grid;
  grid-template-columns: 75% 25%;
}

/* LEFT CONTENT */

.left-content {
  display: grid;
  grid-template-rows: 43% 50%;
  background: #f6f7fb;
  margin: 18px 15px 18px 0;
  padding: 20px;
  border-radius: 15px;
}

/* ACTIVITIES */

.activities h1 {
  margin: 0 0 20px;
  font-size: 1.4rem;
  font-weight: 100;
}

.activity-container {
  display: grid;
  grid-template-columns: repeat(5, 1fr);
  grid-template-rows: repeat(2, 150px);
  column-gap: 10px;
}

.img-one {
  grid-area: 1 / 1 / 2 / 2;
}

.img-two {
  grid-area: 2 / 1 / 3 / 2;
}

.img-three {
  display: block;
  grid-area: 1 / 2 / 3 / 4;
}

.img-four {
  grid-area: 1 / 4 / 2 / 5;
}

.img-five {
  grid-area: 1 / 5 / 2 / 6;
}

.img-six {
  display: block;
  grid-area: 2 / 4 / 3 / 6;
}

.image-container {
  position: relative;
  margin-bottom: 10px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
  border-radius: 10px;
}

.image-container img {
  width: 100%;
  height: 100%;
  border-radius: 10px;
  object-fit: cover;
}

.overlay {
  position: absolute;
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  justify-content: flex-end;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    180deg,
    transparent,
    transparent,
    rgb(102, 153, 204, 0.5)
  );
  border-radius: 10px;
  transition: all 0.6s linear;
}

.image-container:hover .overlay {
  opacity: 0;
}

.overlay h3 {
  margin-bottom: 8px;
  margin-right: 10px;
  color: #fff;
}

/* LEFT BOTTOM */

.left-bottom {
  display: grid;
  grid-template-columns: 55% 40%;
  gap: 40px;
}

/* WEEKLY SCHEDULE */

.weekly-schedule {
  display: flex;
  flex-direction: column;
}

.weekly-schedule h1 {
  margin-top: 20px;
  font-size: 1.3rem;
  font-weight: 100;
}

.calendar {
  margin-top: 10px;
}

.day-and-activity {
  display: grid;
  grid-template-columns: 15% 60% 25%;
  align-items: center;
  border-radius: 14px;
  margin-bottom: 5px;
  color: #484d53;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
}

.activity-one {
  background-color: rgb(124, 136, 224, 0.5);
  background-image: linear-gradient(
    240deg,
    rgb(124, 136, 224) 0%,
    #c3f4fc 100%
  );
}

.activity-two {
  background-color: #aee2a4a1;
  background-image: linear-gradient(240deg, #e5a243ab 0%, #f7f7aa 90%);
}

.activity-three {
  background-color: #ecfcc376;
  background-image: linear-gradient(240deg, #97e7d1 0%, #ecfcc3 100%);
}

.day {
  display: flex;
  flex-direction: column;
  align-items: center;
  transform: translateY(-10px);
}

.day h1 {
  font-size: 1.6rem;
  font-weight: 600;
}

.day p {
  text-transform: uppercase;
  font-size: 0.9rem;
  font-weight: 600;
  transform: translateY(-3px);
}

.activity {
  border-left: 3px solid #484d53;
}

.participants {
  display: flex;
  margin-left: 20px;
}

.participants img {
  width: 28px;
  height: 28px;
  border-radius: 50%;
  z-index: calc(2 * var(--i));
  margin-left: -10px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
}

.activity h2 {
  margin-left: 10px;
  font-size: 1.25rem;
  font-weight: 600;
  border-radius: 12px;
}

.btn {
  display: block;
  padding: 8px 24px;
  margin: 10px auto;
  font-size: 1.1rem;
  font-weight: 500;
  outline: none;
  text-decoration: none;
  color: #484b57;
  background: rgba(255, 255, 255, 0.9);
  box-shadow: 0 6px 30px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.3);
  border-radius: 25px;
  cursor: pointer;
}

.btn:hover,
.btn:focus,
.btn:active,
.btn:visited {
  transition-timing-function: cubic-bezier(0.6, 4, 0.3, 0.8);
  animation: gelatine 0.5s 1;
}

@keyframes gelatine {
  0%,
  100% {
    transform: scale(1, 1);
  }
  25% {
    transform: scale(0.9, 1.1);
  }
  50% {
    transform: scale(1.1, 0.9);
  }
  75% {
    transform: scale(0.95, 1.05);
  }
}

/* PERSONAL BESTS */

.personal-bests {
  display: block;
}

.personal-bests h1 {
  margin-top: 20px;
  font-size: 1.3rem;
  font-weight: 100;
}

.personal-bests-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: repeat(2, 150px);
  gap: 10px;
  margin-top: 28px;
}

.best-item {
  display: flex;
  gap: 20px;
  width: 100%;
  height: 100%;
  border-radius: 15px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
}

.box-one {
  flex-direction: row;
  align-items: center;
  justify-content: center;
  grid-area: 1 / 1 / 2 / 3;
  background-color: rgba(185, 159, 237, 0.6);
  padding: 15px;
  font-size: 1rem;
  font-weight: 700;
}

.box-one img {
  max-width: 90px;
  aspect-ratio: 1/1;
}

.box-two {
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  font-size: 0.9rem;
  font-weight: 700;
  padding: 10px;
  grid-area: 2 / 1 / 3 / 2;
  background-color: rgba(238, 184, 114, 0.6);
}

.box-two img {
  max-width: 80px;
  aspect-ratio: 3/2;
  align-self: flex-end;
}

.box-three {
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  font-size: 0.9rem;
  font-weight: 700;
  padding: 10px;
  grid-area: 2 / 2 / 3 / 3;
  background-color: rgba(184, 224, 192, 0.6);
}

.box-three img {
  max-width: 80px;
  aspect-ratio: 3/2;
  align-self: flex-end;
}

/* RIGHT CONTENT */

.right-content {
  display: grid;
  grid-template-rows: 22% 20% 75%;
  background: #f6f7fb;
  margin: 18px 0 18px 0;
  padding: 10px 0;
  border-radius: 15px;
}


.user-info h4 {
  margin-left: 40px;
}

.user-info img {
  width: 40px;
  aspect-ratio: 1/1;
  border-radius: 50%;
}

/* ACTIVE CALORIES  */

.active-calories {
  display: flex;
  flex-direction: column;
  align-items: center;
  background-color: rgb(214, 227, 248);
  padding: 0 10px;
  margin: 15px 10px 0;
  border-radius: 15px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
}

.active-calories h1 {
  margin-top: 10px;
  font-size: 1.2rem;
  font-weight: 100;
}

.active-calories-container {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 10px;
}

.calories-content p {
  font-size: 1rem;
}

.calories-content p span {
  font-weight: 700;
}

.box {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  position: relative;
  padding: 10px 0;
  /* width: 200px; */
}

.box h2 {
  position: relative;
  text-align: center;
  font-size: 1.25rem;
  color: rgb(91, 95, 111);
  font-weight: 600;
}

.box h2 small {
  font-size: 0.8rem;
  font-weight: 600;
}

.circle {
  position: relative;
  width: 80px;
  aspect-ratio: 1/1;
  background: conic-gradient(
    from 0deg,
    #663399 0%,
    #663399 0% var(--i),
    #b3b2b2 var(--i),
    #b3b2b2 100%
  );
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.circle::before {
  content: "";
  position: absolute;
  inset: 10px;
  background-color: rgb(214, 227, 248);
  border-radius: 50%;
}

/* MOBILE PERSONAL BESTS  */

.mobile-personal-bests {
  display: none;
}

/* FRIEND ACTIVITIES  */

.friends-activity {
  display: flex;
  flex-direction: column;
}

.friends-activity h1 {
  font-size: 1.2rem;
  font-weight: 100;
  margin: 15px 0 10px 15px;
}

.card-container {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.card {
  background-color: #fff;
  margin: 0 10px;
  padding: 5px 7px;
  border-radius: 15px;
  box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 3px;
}

.card-two {
  display: block;
}

.card-user-info {
  display: flex;
  flex-direction: row;
  align-items: center;
  padding-bottom: 5px;
}

.card-user-info img {
  width: 25px;
  aspect-ratio: 1/1;
  border-radius: 50%;
  object-fit: cover;
}

.card-user-info h2 {
  font-size: 1rem;
  font-weight: 700;
  margin-left: 5px;
}

.card-img {
  display: block;
  width: 100%;
  aspect-ratio: 7/4;
  margin-bottom: 10px;
  object-fit: cover;
  border-radius: 10px;
  object-position: 50% 30%;
}

.card p {
  font-size: 0.9rem;
  padding: 0 5px 5px;
}

</style>

