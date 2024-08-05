<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row :gutter="10" class="mb8">
        <el-col :span="6" :offset="3">
          <el-form-item label="订单编号" prop="ordersId">
            <el-input
              v-model="queryParams.ordersId"
              placeholder="请输入订单编号"
              clearable
              @keyup.enter.native="handleQuery"
              @change="handleCancelOrdersId"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="交易状态" prop="flag">
            <el-select v-model="queryParams.flag" placeholder="请选择交易状态" clearable @change="handleCancelFlag">
              <el-option label="已完成" value="0"/>
              <el-option label="交易中" value="1"/>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="创建时间" prop="createTime">
            <el-date-picker
              v-model="dateRange"
              value-format="yyyy-MM-dd"
              style="width: 230px"
              type="daterange"
              range-separator="-"
              :picker-options="pickerOptions"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              @change="handleCancelDate"
            ></el-date-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :span="24" style="display: flex;justify-content: center">
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="small" round @click="handleQuery">查询</el-button>
          <el-button icon="el-icon-refresh" size="small" round @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-row>
    </el-form>
    <el-row :gutter="10" class="mb8">
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ordersList" @selection-change="handleSelectionChange" stripe>
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="订单编号" align="center" prop="ordersId"/>
      <el-table-column label="用户编号" align="center" prop="userId"/>
      <el-table-column label="商品编号" align="center" prop="commodityId"/>
      <el-table-column label="交易数量" width="110" align="center" prop="quantity"/>
      <el-table-column label="交易状态" align="center" prop="flag" width="110">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.flag === 0" type="success">已完成</el-tag>
          <el-tag v-else type="danger">交易中</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="订单状态" align="center" prop="permission" width="110">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.permission"
            :active-value="0"
            :inactive-value="1"
            @change="handleSwitch(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="交易金额" width="100" align="center" prop="price"/>
      <el-table-column label="创建时间" align="center" prop="createTime" width="110">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="small"
            round
            plain
            type="danger"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
          >&nbsp;删除
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
  </div>
</template>

<script>
import {listOrder, delOrder, changeOrderStatus} from "@/api/back/order";
import {parseTime} from "@/utils/ruoyi";

export default {
  name: "Order",
  data() {
    return {
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
      // 订单表格数据
      ordersList: [],
      // 弹出层标题
      title: "",
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ordersId: null,
        permission: null
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
    // 处理取消日期
    handleCancelDate(value) {
      if (value === null) {
        this.dateRange = [];
      }
      this.getList();
    },
    parseTime,
    /** 查询订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.addDateRange(this.queryParams
        , this.dateRange)).then(response => {
        this.ordersList = response.rows;
        this.total = response.total;
        this.loading = false;
        console.log(this.ordersList)
      });
    },
    // 表单重置
    reset() {
      this.form = {
        ordersId: null,
        userId: null,
        commodityId: null,
        date: null,
        flag: null,
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
      this.ids = selection.map(item => item.ordersId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ordersIds = row.ordersId || this.ids;
      this.$modal.confirm('是否确认删除订单编号为"' + ordersIds + '"的数据项？').then(function () {
        return delOrder(ordersIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
        this.$modal.msgError("取消删除");
      });
    },
    // 管理订单状态
    handleSwitch(row) {
      const id = row.ordersId;
      this.$modal
        .confirm('是否确认修改编号为"' + row.ordersId + '"的订单状态？')
        .then(function () {
          return changeOrderStatus(id, !row.permission);
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
    // 处理取消状态
    handleCancelFlag(value) {
      if (value === null) {
        this.queryParams.flag = undefined;
      }
      this.getList();
    },
    // 处理取消名称
    handleCancelOrdersId(value) {
      if (value === null) {
        this.queryParams.ordersId = undefined;
      }
      this.getList();
    },
  }
};
</script>

<style scoped>
.el-button {
  font-size: 12px !important;
}
</style>
