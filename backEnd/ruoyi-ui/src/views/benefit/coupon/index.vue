<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row>
        <el-col :span="6" :offset="3">
          <el-form-item label="名称" prop="couponsName">
            <el-input
              v-model="queryParams.couponsName"
              placeholder="请输入优惠卷名称"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="用户编号" prop="userId">
            <el-input
              v-model="queryParams.userId"
              placeholder="请输入用户编号"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="状态" prop="permission">
            <el-select
              v-model="queryParams.permission"
              placeholder="优惠卷状态"
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

    <el-table v-loading="loading" :data="couponsList" @selection-change="handleSelectionChange" stripe>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="优惠卷编号" align="center" width="100" prop="couponsId"/>
      <el-table-column label="优惠卷类型" align="center" width="120" prop="couponsName"/>
      <el-table-column label="满减金额" align="center" width="110" prop="reductionFull"/>
      <el-table-column label="优惠金额" align="center" width="110" prop="reductionPrice"/>
      <el-table-column label="有限期" align="center" prop="expirationTime" :formatter="addExpirationTime"/>
      <el-table-column label="标志" align="center" prop="expirationFlag">
        <template slot-scope="scope">
          <el-tag :type="scope.row.expirationFlag === 0 ? 'success' : 'danger'">
            {{ scope.row.expirationFlag === 0 ? '正常' : '过期' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="所有者编号" align="center" prop="userId"/>
      <el-table-column label="优惠卷状态" align="center" prop="permission">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.permission"
            :active-value="0"
            :inactive-value="1"
            @change="handleSwitch(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" width="110" prop="createTime">
        <template slot-scope="scope">
          {{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5" :offset="6">
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
            <el-col :span="1.5" class="mt5" :offset="6">
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

    <!-- 添加或修改优惠卷对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body custom-class="custom-dialog">
      <el-form ref="form" :model="form" label-width="100px">
        <el-row>
          <el-col :span="19" :offset="2">
            <el-form-item prop="couponsName">
              <template slot="label">
                <i class="el-icon-collection"></i>
                名称
              </template>
              <el-input v-model="form.couponsName" placeholder="请输入优惠卷名称" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="19" :offset="2">
            <el-form-item prop="reductionPrice">
              <template slot="label">
                <i class="el-icon-discount"></i>
                优惠金额
              </template>
              <el-input v-model="form.reductionPrice" placeholder="请输入优惠金额" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="19" :offset="2">
            <el-form-item prop="reductionFull">
              <template slot="label">
                <i class="el-icon-wallet"></i>
                满减金额
              </template>
              <el-input v-model="form.reductionFull" placeholder="请输入满减金额" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="19" :offset="2">
            <el-form-item prop="expirationTime">
              <template slot="label">
                <i class="el-icon-time"></i>
                有限期
              </template>
              <el-input v-model="form.expirationTime" placeholder="请输入保质期" clearable/>
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

.dialog-footer {
  display: flex;
  justify-content: center;
}
</style>

<script>
import {addCoupon, changeCouponStatus, listCoupon, updateCoupon} from "@/api/benefit/coupon";
import {parseTime} from "../../../utils/ruoyi";

export default {
  name: "Coupon",
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
      // 优惠卷表格数据
      couponsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        couponsName: null,
        expirationTime: null,
        expirationFlag: null,
        permission: null,
        couponsId: null,
        userId: null
      },
      // 表单参数
      form: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    parseTime,
    // 管理公告状态
    handleSwitch(row) {
      const id = row.couponsId;
      this.$modal
        .confirm('是否确认修改编号为"' + row.couponsId + '"的优惠卷状态？')
        .then(function () {
          return changeCouponStatus(id, !row.permission);
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
    /** 查询代金卷列表 */
    getList() {
      this.loading = true;
      listCoupon(this.queryParams).then(response => {
        this.couponsList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        couponsId: null,
        couponsName: null,
        code: null,
        expirationTime: null,
        createTime: null,
        updateTime: null,
        expirationFlag: null,
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
      this.ids = selection.map(item => item.couponsId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加优惠卷";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.queryParams.couponsId = row.couponsId;
      listCoupon(this.queryParams).then(response => {
        this.form = response.rows[0];
        this.open = true;
        this.title = "修改优惠卷";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.couponsId != null) {
            updateCoupon(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.queryParams.couponsId = undefined;
              this.open = false;
              this.getList();
            });
          } else {
            addCoupon(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.queryParams.couponsId = undefined;
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const couponsIds = row.couponsId || this.ids;
      this.$modal.confirm('是否确认删除优惠卷编号为"' + couponsIds + '"的数据项？').then(function () {
        return delCoupons(couponsIds);
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
    // 添加保质期单位
    addExpirationTime(row, column, cellValue) {
      return cellValue + ' 天';
    },
  }
};
</script>
