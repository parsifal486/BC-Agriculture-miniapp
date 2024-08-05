<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-col :span="6" :offset="3">
          <el-form-item label="客服名称" prop="chatName">
            <el-input
              v-model="queryParams.chatName"
              placeholder="请输入客服名称"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="公告内容" prop="chatContext">
            <el-input
              v-model="queryParams.chatContext"
              placeholder="请输入公告内容"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="公告状态" prop="permission">
            <el-select
              v-model="queryParams.permission"
              placeholder="公告状态"
              clearable
              @change="handleCancelPermission"
            >
              <el-option
                v-for="dict in dict.type.sys_normal_disable"
                :key="dict.value"
                :label="dict.label"
                :value="dict.value"
              />
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="24" style="display: flex;justify-content: center">
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" round size="small" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="small" round @click="resetQuery">重置</el-button>
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

    <el-table v-loading="loading" :data="messageList" @selection-change="handleSelectionChange" stripe>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="公告编号" align="center" width="110" prop="messageId"/>
      <el-table-column label="用户对象" align="center" width="120" prop="userId">
        <template slot-scope="scope">
          <span>全体成员</span>
        </template>
      </el-table-column>
      <el-table-column label="客服名称" width="100" align="center" prop="chatName"/>
      <el-table-column label="公告标题" align="center" prop="title"/>
      <el-table-column label="活动网址" align="center" width="110" prop="url">
        <template slot-scope="scope">
          <el-link :underline="false" type="primary" :href="scope.row.url" target="_blank" icon="el-icon-link">查看
          </el-link>
        </template>
      </el-table-column>
      <el-table-column label="公告内容" width="320" align="center" prop="chatContext"/>
      <el-table-column label="公告权限" align="center" width="130" prop="permission">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.permission"
            :active-value="0"
            :inactive-value="1"
            @change="handleSwitch(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        :sortable="true"
        width="140"
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5" :offset="5">
              <el-button
                size="small"
                round
                plain
                type="danger"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
              >删除
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5" :offset="5">
              <el-button
                size="small"
                round
                plain
                type="success"
                icon="el-icon-edit-outline"
                @click="handleUpdate(scope.row)"
              >修改
              </el-button>
            </el-col>
          </el-row>
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

    <!-- 添加或修改公告对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body top="11" custom-class="custom-dialog">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :span="20" :offset="2">
            <el-form-item prop="chatName">
              <template slot="label">
                <i class="el-icon-user"></i>
                客服名称
              </template>
              <el-input v-model="form.chatName" placeholder="请输入客服名称" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20" :offset="2">
            <el-form-item prop="title">
              <template slot="label">
                <i class="el-icon-reading"></i>
                公告标题
              </template>
              <el-input v-model="form.title" placeholder="请输入公告标题" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20" :offset="2">
            <el-form-item prop="chatContext">
              <template slot="label">
                <i class="el-icon-notebook-2"></i>
                公告内容
              </template>
              <el-input v-model="form.chatContext" type="textarea" placeholder="请输入公告内容" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="20" :offset="2">
            <el-form-item prop="url">
              <template slot="label">
                <i class="el-icon-connection"></i>
                活动网址
              </template>
              <el-input v-model="form.url" placeholder="请输入活动网址" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
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

.el-button--small {
  font-size: 12px !important;
}

.dialog-footer {
  display: flex;
  justify-content: center;
}
</style>

<script>
import {addMessage, changeMessagePermission, delMessage, listMessage, updateMessage} from "@/api/benefit/notice";
import {parseTime} from "@/utils/ruoyi";

export default {
  name: "Notice",
  dicts: ["sys_normal_disable"],
  data() {
    return {
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
      // 公告表格数据
      messageList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        chatFlag: null,
        chatName: null,
        chatContext: null,
        permission: null,
        messageId: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    parseTime,
    // 管理公告状态
    handleSwitch(row) {
      const id = row.messageId;
      this.$modal
        .confirm('是否确认修改编号为"' + row.messageId + '"的公告状态？')
        .then(function () {
          return changeMessagePermission(id, !row.permission);
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
    /** 查询消息列表 */
    getList() {
      this.loading = true;
      listMessage(this.queryParams).then(response => {
        this.messageList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 清空查询参数
    resetQueryParams() {
      this.queryParams = {
        userId: undefined,
        chatName: undefined,
        chatContext: undefined,
        permission: undefined,
        messageId: undefined,
      };
    },
    // 表单重置
    reset() {
      this.form = {
        messageId: null,
        userId: null,
        chatFlag: null,
        chatName: null,
        chatContext: null,
        createTime: null,
        updateTime: null,
        permission: null
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.messageId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加公告";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.queryParams.messageId = row.messageId;
      listMessage(this.queryParams).then(response => {
        this.form = response.rows[0];
        this.open = true;
        this.title = "修改公告";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.messageId != null) {
            updateMessage(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.queryParams.messageId = undefined;
              this.getList();
            });
          } else {
            addMessage(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.queryParams.messageId = undefined;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const messageIds = row.messageId || this.ids;
      this.$modal.confirm('是否确认删除公告编号为"' + messageIds + '"的数据项？').then(function () {
        return delMessage(messageIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    // 处理取消状态
    handleCancelPermission(value) {
      if (value === null) {
        this.queryParams.permission = undefined;
      }
      this.getList();
    },
  }
};
</script>
