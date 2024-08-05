<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-col :span="7" :offset="3">
          <el-form-item label="商品编号" prop="commodityId">
            <el-input
              v-model="queryParams.commodityId"
              placeholder="请输入商品编号"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="用户编号" prop="userId">
            <el-input
              v-model="queryParams.userId"
              placeholder="请输入用户编号"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="评论内容" prop="viewContext">
            <el-input
              v-model="queryParams.viewContext"
              placeholder="请输入评论内容"
              clearable
              @keyup.enter.native="handleQuery"
            />
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
          icon="el-icon-coordinate"
          size="mini"
          round
          @click="handleAudit"
        >审核
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          round
          :disabled="multiple"
          @click="handleDelete"
        >删除
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="viewList" @selection-change="handleSelectionChange" stripe>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="评论编号" align="center" prop="viewId"/>
      <el-table-column label="商品编号" align="center" prop="commodityId"/>
      <el-table-column label="用户编号" align="center" prop="userId"/>
      <el-table-column label="评论内容" align="center" prop="viewContext"/>
      <el-table-column label="评价" align="center" prop="loveFlag">
        <template slot-scope="scope">
          <el-rate
            v-model="scope.row.loveFlag"
            show-score
            disabled
            text-color="#ff9900"
          />
        </template>
      </el-table-column>
      <el-table-column label="评论状态" align="center" prop="permission">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.permission"
            :active-value="0"
            :inactive-value="1"
            @change="handleSwitch(scope.row)"
            class="switchStyle"
          />
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="small"
            round
            type="success"
            plain
            icon="el-icon-edit-outline"
            @click="handleUpdate(scope.row)"
          >&nbsp;修改
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

    <!-- 审核评论对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="900px" append-to-body>
      <el-table :data="auditList" stripe border>
        <el-table-column align="center" label="评论编号" width="80" prop="viewId"/>
        <el-table-column align="center" label="商品编号" width="150" prop="commodityId"/>
        <el-table-column align="center" label="用户编号" width="90" prop="userId"/>
        <el-table-column align="center" label="评论内容" prop="viewContext"/>
        <el-table-column align="center" label="评价" prop="loveFlag">
          <template slot-scope="scope">
            <el-rate
              v-model="scope.row.loveFlag"
              show-score
              disabled
              text-color="#ff9900"
            />
          </template>
        </el-table-column>
        <el-table-column
          label="审核"
          align="center"
        >
          <template slot-scope="scope">
            <el-col :span="12">
              <el-button
                class="icon-mapper-right"
                circle
                @click="handleAllow(scope.row)"
              >
                <i class="icon"></i>
              </el-button>
            </el-col>
            <el-col :span="12">
              <el-button
                class="icon-mapper-wrong"
                circle
                @click="handleDeny(scope.row)"
              >
                <i class="icon"></i>
              </el-button>
            </el-col>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="ok">确 定</el-button>
        <el-button round @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 修改评论对话框 -->
    <el-dialog :title="title" :visible.sync="openRemark" width="550px" append-to-body custom-class="custom-dialog">
      <el-form ref="remarkForm" :model="remarkForm" label-width="90px" label-position="left">
        <el-row>
          <el-col :span="18" :offset="2">
            <el-form-item prop="viewContext">
              <template slot="label">
                <i class="el-icon-date"></i>
                评论内容
              </template>
              <el-input v-model="remarkForm.viewContext"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="18" :offset="2">
            <el-form-item prop="loveFlag">
              <template slot="label">
                <i class="el-icon-star-off"></i>
                评价得分
              </template>
              <el-rate v-model="remarkForm.loveFlag" show-score text-color="#ff9900"/>
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

<script>
import {changeViewStatus, delView, listView, updateView} from "@/api/benefit/reamrk";

export default {
  name: "remark",
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
      // 评论表格数据
      viewList: [],
      // 审核表格数据
      auditList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 显示评论弹出层
      openRemark: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        commodityId: null,
        userId: null,
        viewContext: null,
        loveFlag: null,
        permission: null,
        viewId: null,
        auditFlag: null
      },
      // 表单参数
      remarkForm: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 处理审核通过
    handleAllow(row) {
      const data = {
        viewId: row.viewId,
        perm: true,
        audit: true
      };
      updateView(data).then(() => {
        this.handleAudit();
        this.getList();
        this.$modal.msgSuccess("审核通过");
      });
    },
    // 处理审核不通过
    handleDeny(row) {
      const data = {
        viewId: row.viewId,
        perm: false,
        audit: true
      };
      updateView(data).then(() => {
        this.handleAudit();
        this.getList();
        this.$modal.msgError("审核不通过");
      })
    },
    // 处理用户状态
    handleSwitch(row) {
      const id = row.viewId;
      this.$modal
        .confirm('是否确认修改编号为"' + row.viewId + '"的评论状态？')
        .then(function () {
          return changeViewStatus(id, !row.permission);
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
    /** 查询评论列表 */
    getList() {
      this.loading = true;
      this.queryParams.auditFlag = 1; // 1表示已审核
      listView(this.queryParams).then(response => {
        this.viewList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openRemark = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        viewId: undefined,
        commodityId: undefined,
        userId: undefined,
        viewContext: undefined,
        loveFlag: undefined,
        createTime: undefined,
        permission: undefined
      };
      this.resetForm("form");
    },
    // 查询参数重置
    resetQueryParams() {
      this.queryParams.auditFlag = 1;
      this.queryParams.viewId = undefined;
      this.queryParams.commodityId = undefined;
      this.queryParams.userId = undefined;
      this.queryParams.viewContext = undefined;
      this.queryParams.loveFlag = undefined;
      this.queryParams.permission = undefined;
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
      this.ids = selection.map(item => item.viewId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.resetQueryParams();
      this.queryParams.viewId = row.viewId || this.ids;
      listView(this.queryParams).then(response => {
        this.remarkForm = response.rows[0];
        this.openRemark = true;
        this.title = "修改评论";
      });
    },
    // 处理审核评论
    handleAudit() {
      this.resetQueryParams();
      this.queryParams.auditFlag = 0; // 0表示未审核
      listView(this.queryParams).then(response => {
        this.auditList = response.rows;
        this.open = true;
        this.title = "审核评论";
      });
    },
    /** 提交按钮 */
    ok(){
      this.open = false;
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const viewIds = row.viewId || this.ids;
      this.$modal.confirm('是否确认删除评论编号为"' + viewIds + '"的数据项？').then(function () {
        return delView(viewIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    // 提交表单
    submitForm() {
      this.$refs.remarkForm.validate(valid => {
        if (valid) {
          updateView(this.remarkForm).then(() => {
            this.resetQueryParams();
            this.getList();
            this.openRemark = false;
            this.$modal.msgSuccess("修改成功");
          });
        }
      });
    }
  }
}
;
</script>

<style scoped>
/deep/ .custom-dialog {
  border-radius: 8px;
}

.icon-mapper-right, .icon-mapper-wrong {
  position: relative;
  width: 40px;
  height: 40px;
  padding: 0;
  border: none;
  background-color: transparent;
}

.icon-mapper-right::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("../../../assets/images/right.png");
  background-size: cover;
}

.icon-mapper-right:hover, .icon-mapper-wrong:hover {
  border-radius: 40px;
  box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.2),
  -6px -6px 15px rgba(255, 255, 255, 0.2);
}


.icon {
  display: block;
  width: 100%;
  height: 100%;
  background-color: transparent;
}

.icon-mapper-wrong::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("../../../assets/images/wrong.png");
  background-size: cover;
}


.dialog-footer {
  display: flex;
  justify-content: center;
}
</style>
