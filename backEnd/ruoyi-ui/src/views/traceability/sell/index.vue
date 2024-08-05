<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-row :gutter="10" class="mb8">
        <el-col :span="6" :offset="3">
          <el-form-item label="作物编号" prop="commodityId">
            <el-input
              v-model="queryParams.commodityId"
              placeholder="请输入作物编号"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="作物名称" prop="commodityName">
            <el-input
              v-model="queryParams.commodityName"
              placeholder="请输入作物名称"
              clearable
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
        </el-col>
        <el-col :span="6">
          <el-form-item label="负责人" prop="supervisor">
            <el-input
              v-model="queryParams.supervisor"
              placeholder="请输入负责人"
              clearable
              @keyup.enter.native="handleQuery"
            />
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="sellList" stripe>
      <el-table-column label="作物编号" align="center" prop="commodityId"/>
      <el-table-column label="作物名称" align="center" width="110" prop="commodityName"/>
      <el-table-column label="备注" width="300" align="center" prop="remark">
        <template slot-scope="scope">
          <el-link type="info" :underline="false">{{ scope.row.remark }}</el-link>
        </template>
      </el-table-column>
      <el-table-column label="销售时间" align="center" prop="sellTime" width="140">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.sellTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="质检结果" align="center" width="120" prop="testResult">
        <template slot-scope="scope">
          <el-button round plain v-if="scope.row.testResult === 0" type="success">质检合格</el-button>
          <el-button round plain v-else type="warning">质检失败</el-button>
        </template>
      </el-table-column>
      <el-table-column label="负责人" width="120" align="center" prop="supervisor"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button
                size="small"
                round
                plain
                type="primary"
                icon="el-icon-edit-outline"
                @click="handleStart(scope.row)"
              > 确认销售
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5">
              <el-button
                size="small"
                round
                plain
                type="success"
                icon="el-icon-delete"
                @click="handleChase(scope.row)"
              >&nbsp;销售图表
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5">
              <el-button
                size="small"
                round
                plain
                type="danger"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
              >&nbsp;取消销售
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5">
              <el-button
                size="small"
                round
                plain
                type="info"
                icon="el-icon-info"
                @click="handleDetail(scope.row)"
              >&nbsp;销售明细
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

    <!-- 新增对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openAdd"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-form ref="addForm" :model="addForm" label-width="100px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="作物名称" prop="commodityName">
              <el-input v-model="addForm.commodityName" placeholder="请输入作物名称" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="质检结果" prop="testResult">
              <el-radio-group v-model="addForm.testResult">
                <el-radio label="0">质检合格</el-radio>
                <el-radio label="1">质检失败</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="addForm.remark" placeholder="请输入备注" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="负责人" prop="supervisor">
              <el-input v-model="addForm.supervisor" placeholder="请输入负责人" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="质检图片" prop="testPicture">
          <el-input v-model="addForm.testPicture" placeholder="请输入质检图片" clearable/>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="submitForm">确 定</el-button>
        <el-button round @click="ok">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 销售明细对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openDetail"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-descriptions border :column="2" :content-style="content_style" :label-style="label_style">
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-data-analysis">销量</i>
          </template>
          <span>{{ this.sellForm.quantity }}</span>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-money">收入</i>
          </template>
          <span>{{ this.sellForm.amount }}</span>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-suitcase">价格</i>
          </template>
          <span>{{ this.sellForm.price }}</span>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-scissors">损耗</i>
          </template>
          <span>{{ this.sellForm.loss }}</span>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-time">时间</i>
          </template>
          <span>{{ parseTime(this.sellForm.sellTime, '{y}-{m}-{d}') }}</span>
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-user">负责人</i>
          </template>
          <span>{{ this.sellForm.supervisor }}</span>
        </el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button round type="primary" @click="ok">确 认</el-button>
      </div>
    </el-dialog>

    <!-- 图表对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openChart"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-row>
        <div ref="chart" id="container" style="width: 100%;height: 400px;"></div>
      </el-row>
      <div slot="footer" class="dialog-footer">
        <el-button round type="primary" @click="ok">确 认</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
/deep/ .custom-dialog {
  border-radius: 8px;
}

#container {
  width: 100%;
  height: 400px;
}

.dialog-footer {
  display: flex;
  justify-content: center;
  margin-top: -35px;
}

.el-button {
  font-size: 12px !important;
}
</style>

<script>
import {parseTime} from "@/utils/ruoyi";
import {addSell, delSell, getSellById, getSellByName, getSellBySupervisor, listSell} from "@/api/traceability/sell";
import * as echarts from "echarts";
import logo from '../../../assets/logo/logo.png';

export default {
  name: "Sell",
  data() {
    return {
      imageUrl: logo,
      content_style: {
        'text-align': 'center',
        'word-break': 'break-all',
      },
      label_style: {
        'text-align': 'center',
        'word-break': 'break-all',
        'width': '100px',
      },
      // 遮罩层
      loading: false,
      // 显示搜索条件
      showSearch: true,
      // 订单表格数据
      sellList: [],
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        commodityId: null,
        commodityName: null,
        supervisor: null,
      },
      // 新增开关
      openAdd: false,
      // 详情开关
      openDetail: false,
      // 二维码开关
      openChart: false,
      // 新增表单
      addForm: {},
      // 销售表单
      sellForm: {
        amount: "352.35￥",
        quantity: "43.5Kg",
        price: "8.1￥/Kg",
        sellTime: null,
        supervisor: null,
        loss: "8.5Kg",
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 图表初始化
    initEcharts() {
      const option = {
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          left: 'center'
        },
        series: [
          {
            name: 'Access From',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: 40,
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: [
              { value: 788, name: '花叶类' },
              { value: 735, name: '花菜类' },
              { value: 553, name: '水生根茎类' },
              { value: 594, name: '辣椒类' },
              { value: 526, name: '茄类' },
              { value: 239, name: '食用菌' },
            ]
          }
        ]
      };
      const myChart = echarts.init(this.$refs.chart);
      myChart.setOption(option);
      //随着屏幕大小调节图表
      window.addEventListener("resize", () => {
        myChart.resize();
      });
    },
    // 销售占比图例
    handleChase(row) {
      this.openChart = true;
      this.title = "销售图表";
      this.$nextTick(() => {
        this.initEcharts();
      });
    },
    // 销售明细
    handleDetail(row) {
      this.openDetail = true;
      this.title = "销售明细";
      this.sellForm.sellTime = row.sellTime;
      this.sellForm.supervisor = row.supervisor;
    },
    // 新增
    submitForm() {
      addSell(this.addForm).then(() => {
        this.getList();
        this.$modal.msgSuccess("新增成功");
        this.openAdd = false;
      }).catch(() => {
        this.$modal.msgError("新增失败");
      });
    },
    // 新增
    handleAdd() {
      this.openAdd = true;
      this.title = "新增销售";
    },
    // 通知记录
    handleStart(row) {
      this.$message({
        message: "通知成功",
        type: "success"
      });
    },
    parseTime,
    /** 查询订单列表 */
    getList() {
      this.loading = true;
      if (this.queryParams.commodityId !== null) {
        getSellById(this.queryParams).then(response => {
          this.sellList = response.data;
          this.total = 1;
          this.loading = false;
        });
      } else if (this.queryParams.commodityName !== null) {
        getSellByName(this.queryParams).then(response => {
          this.sellList = response.data;
          this.total = 1;
          this.loading = false;
        });
      } else if (this.queryParams.supervisor !== null) {
        getSellBySupervisor(this.queryParams).then(response => {
          this.sellList = response.rows;
          this.total = response.rows.length;
          this.loading = false;
        });
      } else {
        listSell(this.queryParams).then(response => {
          this.sellList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      }
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
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.commodityId;
      const query = {
        commodityId: id
      }
      this.$modal.confirm('是否确认删除作物编号为"' + id + '"的数据？').then(function () {
        return delSell(query);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
        this.$modal.msgError("取消删除");
      });
    },
    // 新增开关
    ok() {
      this.openAdd = false;
      this.openDetail = false;
      this.openChart = false;
    },
  }
};
</script>
