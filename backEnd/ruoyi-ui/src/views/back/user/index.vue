<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-col :span="5" :offset="2">
          <el-form-item label="用户名称" prop="nickname">
            <el-input
              v-model="queryParams.nickname"
              placeholder="请输入用户名称"
              clearable
              style="width: 200px"
              @keyup.enter.native="handleQuery"
              @change="handleCancelName"
            />
          </el-form-item>
        </el-col>
        <el-col :span="5">
          <el-form-item label="性别" prop="sex">
            <el-select
              v-model="queryParams.sex"
              placeholder="请选择用户性别"
              clearable
              style="width: 200px"
              @change="handleCancelSex"
            >
              <el-option
                v-for="type in sex"
                :key="type.value"
                :label="type.label"
                :value="type.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="5" :offset="1">
          <el-form-item label="创建时间">
            <el-date-picker
              v-model="startDateRange"
              style="width: 230px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              :picker-options="pickerOptions"
              @change="handleCancelCreateTime"
            ></el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="5" :offset="1">
          <el-form-item label="更新时间">
            <el-date-picker
              v-model="updateDateRange"
              style="width: 230px"
              value-format="yyyy-MM-dd"
              type="daterange"
              range-separator="-"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              :picker-options="pickerOptions"
              @change="handleCancelUpdateTime"
            ></el-date-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24" style="display: flex;justify-content: center">
          <el-form-item>
            <el-button type="primary" round icon="el-icon-search" size="small" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" round size="small" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          round
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          round
          icon="el-icon-edit-outline"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          round
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
        >删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="userList" @selection-change="handleSelectionChange" stripe>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="编号" align="center" prop="userId" width="70" style="font-size: 15px" sortable/>
      <el-table-column label="头像" align="center" prop="profileImage" width="100" style="font-size: 15px">
        <template slot-scope="scope">
          <el-image
            style="width: 50px; height: 50px; border-radius: 30px;"
            :src="scope.row.profileImage"
            fit="cover"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column label="名称" align="center" prop="nickname" style="font-size: 15px"
                       width="80"
                       :show-overflow-tooltip="true"/>
      <el-table-column label="密码" align="center" prop="pwd" width="130" style="font-size: 15px"/>
      <el-table-column
        label="性别"
        align="center"
        key="sex"
        prop="sex"
        :show-overflow-tooltip="true"
        width="100"
      >
        <template slot-scope="scope">
          <img
            :src="manImg"
            v-if="scope.row.sex === '0'"
            style="width: 20px; height: 20px;"
            alt=""
          />
          <img
            :src="womanImg"
            v-else
            style="width: 25px; height: 25px;"
            alt=""
          />
        </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="age" width="80" style="font-size: 15px" sortable/>
      <el-table-column label="爱好" align="center" prop="loveList" >
        <template slot-scope="scope">
          <el-tag
            v-for="(love, index) in scope.row.loveList"
            :key="index"
            :type="getLoveTagType(love)"
            style="margin-right: 8px"
            effect="dark"
          >{{ love }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="用户状态" align="center" prop="permission" width="120" style="font-size: 15px" sortable>
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.permission"
            :active-value="1"
            :inactive-value="0"
            @change="handleSwitch(scope.row)"
          />
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="100" style="font-size: 15px" sortable>
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="100" style="font-size: 15px" sortable>
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" style="font-size: 15px">
        <template slot-scope="scope">
          <el-button
              size="medium"
              plain
              round
              type="danger"
              icon="el-icon-delete"
              @click="handleDelete(scope.row)"
          >删除
          </el-button>
          <el-button
            size="medium"
            type="success"
            round
            plain
            icon="el-icon-edit-outline"
            @click="handleUpdate(scope.row)"
          >修改
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 增加或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="450px" append-to-body custom-class="custom-dialog">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户图像" prop="profileImage">
              <el-radio-group v-model="form.profileImage">
                <el-radio :label="image.url" v-for="image in images" :key="image.id">
                  <img :src="image.url" alt="用户图像" class="avatar-img">
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户名称" prop="nickname">
              <el-input v-model="form.nickname" placeholder="请输入用户名称" size="medium" class="centered-input"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户密码" prop="pwd">
              <el-input v-model="form.pwd" placeholder="请输入用户密码"
                        type="password" prefix-icon="el-icon-lock"
                        size="medium" class="centered-input" show-password/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户性别" prop="sex" style="margin-left: -8px">
              <el-radio-group v-model="form.sex">
                <el-radio
                  v-for="type in this.sex"
                  :key="type.value"
                  :label="type.value"
                  border
                  style="padding-left: 10px;margin-left: 8px"
                >{{ type.label }}
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户年龄" prop="age">
              <el-input v-model="form.age" placeholder="请输入用户年龄" size="medium" class="centered-input"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="手机号码" prop="phone">
              <el-input v-model="form.phone" placeholder="请输入用户手机号码" size="medium" class="centered-input"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23" :offset="1">
            <el-form-item label="用户爱好" prop="loveList">
              <el-select
                v-model="form.loveList"
                multiple
                placeholder="请选择用户爱好"
                clearable
                size="medium"
              >
                <el-option
                  v-for="type in love"
                  :key="type.value"
                  :label="type.label"
                  :value="type.value"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="submitForm">确 定</el-button>
        <el-button round @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
/deep/ .custom-dialog {
  border-radius: 8px;
}

.el-button {
  font-size: 12px !important;
}

.el-button--medium.is-round {
  padding: 9px 15px !important;
}

.dialog-footer {
  display: flex;
  justify-content: center;
}

.avatar-img {
  width: 50px;
  height: 50px;
  margin-top: 10px;
  border-radius: 50%;
}

.el-tag--dark.el-tag--purple {
  background-color: #815989 !important;
  border: none;
}

.el-tag--dark.el-tag--cauliflower {

  background-color: #228b22 !important;
  border: none;
}

.el-tag--dark.el-tag--petal {
  background-color: #87ae73 !important;
  border: none;
}


.centered-input >>> .el-input__inner {
  text-align: left;
  width: 280px;
  height: 40px;
}
</style>

<script>
import {addUser, changeUserStatus, delUser, listUser, updateUser} from "@/api/back/user";
import {parseTime} from "@/utils/ruoyi";
import man from "@/assets/images/man.svg"
import woman from "@/assets/images/woman.svg"
import alt from "@/assets/images/404.png"

export default {
  name: "User",
  data() {
    return {
      // 图片
      images: [
        {id:1, url: "https://s2.loli.net/2024/02/08/DE9qcKdWQymIu8C.jpg"},
        {id:2, url: "https://s2.loli.net/2024/02/08/irATxF7owf16JWD.jpg"},
        {id:3, url: "https://s2.loli.net/2024/02/08/R8pBfGQwqFkaWnt.jpg"},
        {id:4, url: "https://s2.loli.net/2024/02/08/Ds1nCMEFHOoQeAG.jpg"},
        {id:5, url: "https://s2.loli.net/2024/02/08/GLqpclg6iJt3uOz.jpg"},
        {id:3, url: "https://s2.loli.net/2024/02/10/dzQnjktuSAPXrOy.jpg"},
      ],
      // 爱好
      love: [
        {label: "辣椒类", value: "辣椒类"},
        {label: "花菜类", value: "花菜类"},
        {label: "花叶类", value: "花叶类"},
        {label: "水生根茎类", value: "水生根茎类"},
        {label: "食用菌", value: "食用菌"},
        {label: "茄类", value: "茄类"},
      ],
      // 性别图片
      manImg: man,
      womanImg: woman,
      //性别
      sex: [
        {label: "男", value: "0"},
        {label: "女", value: "1"},
      ],
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 字典表格数据
      userList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 创建日期范围
      startDateRange: [],
      // 更新日期范围
      updateDateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        nickname: undefined,
        sex: undefined,
        userid: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        nickname: [
          {required: true, message: "请输入用户名称", trigger: "blur"},
          {min: 1, max: 30, message: "长度在 1 到 30 个字符", trigger: "blur"}
        ],
        sex: [
          {required: true, message: "请选择性别", trigger: "blur"}
        ],
        age: [
          {required: true, message: "请输入用户年龄", trigger: "blur"},
          {pattern: /^[0-9]*$/, message: "年龄只能为数字", trigger: "blur"}
        ],
        phone: [
          {required: true, message: "请输入用户手机号码", trigger: "blur"},
          {pattern: /^1[3456789]\d{9}$/, message: "手机号码格式不正确", trigger: "blur"}
        ],
      },
      // 编辑日期选项
      pickerOptions: {
        shortcuts: [
          {
            text: '最近一周',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
              picker.$emit('pick', [start, end]);
            }
          }, {
            text: '最近一个月',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
              picker.$emit('pick', [start, end]);
            }
          }, {
            text: '最近三个月',
            onClick(picker) {
              const end = new Date();
              const start = new Date();
              start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
              picker.$emit('pick', [start, end]);
            }
          }]
      },

    };
  },
  created() {
    this.getList();
  },
  methods: {
    getLoveTagType(love) {
      const loveColors = {
        辣椒类: 'danger',
        花菜类: 'cauliflower',
        花叶类: 'petal',
        水生根茎类: 'primary',
        食用菌: 'warning',
        茄类: 'purple',
      };
      return loveColors[love];
    },
    parseTime,
    getList() {
      this.loading = true;
      listUser(this.addDateRange(this.addDateRange(this.queryParams, this.startDateRange, 'CreateTime'), this.updateDateRange, 'UpdateTime')).then(response => {
          this.userList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    // 处理用户状态
    handleSwitch(row) {
      const userId = row.userId;
      this.$modal
        .confirm('是否确认修改昵称为"' + row.nickname + '"的用户状态？')
        .then(function () {
          return changeUserStatus(userId, !row.permission);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("修改成功");
        })
        .catch(() => {
          this.$modal.msgWarning("取消修改")
          if (row.permission === 0) {
            row.permission = 1
          } else if (row.permission === 1) {
            row.permission = 0
          }
        });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        userId: undefined,
        nickname: undefined,
        sex: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.startDateRange = [];
      this.updateDateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 重置搜索参数
    resetQueryParams() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        nickname: undefined,
        sex: undefined,
        userId: undefined,
      };
      this.startDateRange = [];
      this.updateDateRange = [];
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户";
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.userId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.queryParams.userId = this.ids[0] || row.userId; // 选中的id
      listUser(this.queryParams).then(response => {
        this.form = response.rows[0];
        this.open = true;
        this.title = "修改详情";
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.userId !== undefined) {
            updateUser(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.resetQueryParams(); // 重置搜索参数
              this.getList();
            });
          } else {
            addUser(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.resetQueryParams(); // 重置搜索参数
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const userIds = row.userId || this.ids;
      this.$modal.confirm('是否确认删除用户编号为"' + userIds + '"的数据项？').then(function () {
        return delUser(userIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
        this.$modal.msgWarning("取消删除");
      });
    },
    // 名称取消
    handleCancelName(value) {
      if (value === null) {
        this.queryParams.nickname = undefined;
      }
      this.queryParams.userId = undefined;
      this.getList()
    },
    // 性别取消
    handleCancelSex(value) {
      if (value === null) {
        this.queryParams.sex = undefined;
      }
      this.queryParams.userId = undefined;
      this.getList()
    },
    // 创建时间取消
    handleCancelCreateTime(value) {
      if (value === null) {
        this.startDateRange = [];
      }
      this.queryParams.userId = undefined;
      this.getList()
    },
    // 更新时间取消
    handleCancelUpdateTime(value) {
      if (value === null) {
        this.updateDateRange = [];
      }
      this.queryParams.userId = undefined;
      this.getList()
    },
  }
};
</script>
