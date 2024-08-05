<template>
  <div class="navbar">
    <hamburger id="hamburger-container"
               :is-active="sidebar.opened"
               class="hamburger-container"
               @toggleClick="toggleSideBar"/>

    <!--    <breadcrumb id="breadcrumb-container" class="breadcrumb-container" v-if="!topNav"/>-->
    <top-nav id="topmenu-container" class="topmenu-container" v-if="topNav"/>

    <div class="right-menu">
      <el-dropdown
        class="avatar-container right-menu-item hover-effect"
        trigger="click"
      >
        <div class="avatar-wrapper">
          <img :src="avatar" class="user-avatar"  alt=""/>
          <i class="el-icon-caret-bottom" />
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/user/profile">
            <el-dropdown-item>个人中心</el-dropdown-item>
          </router-link>
          <!-- <el-dropdown-item @click.native="setting = true">
          <span>布局设置</span>
          </el-dropdown-item> -->
          <el-dropdown-item divided @click.native="logout">
            <span>退出登录</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>

    <div class="right-badge">
      <el-badge class="right-badge-item" :value="12" :max="10">
        <el-button icon="el-icon-s-promotion" type="text"/>
      </el-badge>
      <el-badge class="right-badge-item" :value="12" :max="10">
        <el-button icon="el-icon-message-solid" type="text"/>
      </el-badge>
    </div>
    <!-- 自定义面包屑 -->
    <div class="new-breadcrumb">
      <i
        class="el-icon-location-outline"
        style="margin-left: 20px; margin-top: 16px"
      ></i>
      <breadcrumb id="breadcrumb-container" class="breadcrumb-container" />
    </div>
  </div>
</template>

<script>
import {mapGetters} from 'vuex'
import Breadcrumb from '@/components/Breadcrumb'
import TopNav from '@/components/TopNav'
import Hamburger from '@/components/Hamburger'
import Screenfull from '@/components/Screenfull'
import SizeSelect from '@/components/SizeSelect'
import Search from '@/components/HeaderSearch'
import RuoYiGit from '@/components/RuoYi/Git'
import RuoYiDoc from '@/components/RuoYi/Doc'

export default {
  components: {
    Breadcrumb,
    TopNav,
    Hamburger,
    Screenfull,
    SizeSelect,
    Search,
    RuoYiGit,
    RuoYiDoc
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device'
    ]),
    setting: {
      get() {
        return this.$store.state.settings.showSettings
      },
      set(val) {
        this.$store.dispatch('settings/changeSetting', {
          key: 'showSettings',
          value: val
        })
      }
    },
    topNav: {
      get() {
        return this.$store.state.settings.topNav
      }
    }
  },
  methods: {
    toggleSideBar() {
      this.$store.dispatch('app/toggleSideBar')
    },
    async logout() {
      this.$confirm('确定注销并退出系统吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.$store.dispatch('LogOut').then(() => {
          location.href = '/index';
        })
      }).catch(() => {
      });
    }
  }
}
</script>

<style scoped>
.el-button--medium {
  font-size: 20px;
}

.el-badge__content.is-fixed {
  top: 8px;
  right: 2px;
}

.right-badge {
  float: right;
  margin-right: 43px;
  margin-top: 15px;
}

.right-badge-item {
  width: 22px;
  margin-left: 43px;
  margin-top: -4px;
}

.new-breadcrumb {
  height: 50px;
  width: 100%;
  background: rgb(240, 241, 243);
  display: flex;
  position: absolute;
  top: 50px;
}

.navbar {
  height: 100px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, .08);
}

.navbar .hamburger-container {
  line-height: 46px;
  height: 100%;
  float: left;
  cursor: pointer;
  transition: background .3s;
  -webkit-tap-highlight-color: transparent;
}

.navbar .hamburger-container:hover {
  background: rgba(0, 0, 0, .025);
}

.navbar .breadcrumb-container {
  float: left;
}

.navbar .topmenu-container {
  position: absolute;
  left: 50px;
}

.navbar .errLog-container {
  display: inline-block;
  vertical-align: top;
}

.navbar .right-menu {
  float: right;
  height: 100%;
  line-height: 50px;
}

.navbar .right-menu:focus {
  outline: none;
}

.navbar .right-menu .right-menu-item {
  display: inline-block;
  padding: 0 8px;
  height: 100%;
  font-size: 18px;
  color: #5a5e66;
  vertical-align: text-bottom;
}

.navbar .right-menu .right-menu-item.hover-effect {
  cursor: pointer;
  transition: background .3s;
}

.navbar .right-menu .right-menu-item.hover-effect:hover {
  background: rgba(0, 0, 0, .025);
}

.navbar .right-menu .avatar-container {
  margin-right: 30px;
}

.navbar .right-menu .avatar-container .avatar-wrapper {
  margin-top: 5px;
  position: relative;
}

.navbar .right-menu .avatar-container .avatar-wrapper .user-avatar {
  cursor: pointer;
  width: 40px;
  height: 40px;
  border-radius: 10px;
}

.navbar .right-menu .avatar-container .avatar-wrapper .el-icon-caret-bottom {
  cursor: pointer;
  position: absolute;
  right: -20px;
  top: 25px;
  font-size: 12px;
}

</style>
