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

    <el-table v-loading="loading" :data="originList" stripe>
      <el-table-column label="作物编号" align="center" prop="commodityId"/>
      <el-table-column label="作物名称" align="center" width="110" prop="commodityName"/>
      <el-table-column label="套袋状态" width="120" align="center" prop="bagging">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.bagging === 0" type="success">已套袋</el-tag>
          <el-tag v-else type="primary">未套袋</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="种植方式" align="center" width="130" prop="farming"/>
      <el-table-column label="备注" width="300" align="center" prop="remark">
        <template slot-scope="scope">
          <el-link type="info" :underline="false">{{ scope.row.remark }}</el-link>
        </template>
      </el-table-column>
      <el-table-column label="采摘时间" align="center" prop="pickingTime" width="140">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.pickingTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="负责人" width="120" align="center" prop="supervisor"/>
      <el-table-column label="操作" align="center" width="220" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
              <el-button
                size="small"
                round
                plain
                type="primary"
                icon="el-icon-info"
                @click="handleStart(scope.row)"
              >&nbsp;质检证明
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
              >&nbsp;产地溯源
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
              >取消供应
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5">
              <el-button
                size="small"
                round
                plain
                type="info"
                icon="el-icon-edit-outline"
                @click="handlePeriod(scope.row)"
              >&nbsp;周期记录
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

    <!-- 质检证明对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openDetail"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-form :model="testForm" label-width="100px">
        <el-form-item label="质检图片" prop="img">
          <el-image
            style="width: 280px; height: 280px;border: 1px solid #606266;border-radius: 15px"
            src="https://th.bing.com/th/id/R.9fb38b4a1ce1e8082e3b52a3f564c982?rik=VI%2fUAHrXbJ9aCA&riu=http%3a%2f%2f5b0988e595225.cdn.sohucs.com%2fimages%2f20190615%2fa6e1fdcbc3a74b9485bf5ed0f688b0c6.jpeg&ehk=X4fZvkiYT9PUVfRr6%2bcR6q1GRycgUk%2fNsXvCjAkBkIQ%3d&risl=&pid=ImgRaw&r=0"
            fit="cover"
          ></el-image>
        </el-form-item>
        <el-row>
          <el-col :span="24">
            <el-form-item label="质检结果" prop="testResult">
              <el-radio-group v-model="testForm.testResult">
                <el-radio disabled :label="0">质检合格</el-radio>
                <el-radio disabled :label="1">质检失败</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注" prop="remark">
              <el-input v-model="testForm.remark" placeholder="请输入备注" disabled/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button round @click="ok">确 认</el-button>
      </div>
    </el-dialog>

    <!-- 新增对话框   -->
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
            <el-form-item label="作物种类" prop="commodityPartition">
              <el-input v-model="addForm.commodityPartition" placeholder="请输入作物种类" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="作物产地" prop="origin">
          <el-input v-model="addForm.origin" placeholder="请输入作物产地详细地址" clearable/>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="产地经度" prop="originX">
              <el-input v-model="addForm.originX" placeholder="请输入产地经度" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="产地纬度" prop="originY">
              <el-input v-model="addForm.originY" placeholder="请输入产地纬度" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="育苗温度" prop="temperature">
              <el-input v-model="addForm.temperature" placeholder="请输入育苗温度" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="套袋状态" prop="bagging">
              <el-radio-group v-model="addForm.bagging">
                <el-radio label="0">已套袋</el-radio>
                <el-radio label="1">未套袋</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="育苗周期" prop="growTime">
              <el-input v-model="addForm.growTime" placeholder="请输入育苗周期" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="灌溉周期" prop="irrigateTime">
              <el-input v-model="addForm.irrigateTime" placeholder="请输入灌溉周期" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="施肥周期" prop="fertilizerTime">
              <el-input v-model="addForm.fertilizerTime" placeholder="请输入施肥周期" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="除草周期" prop="weedingTime">
              <el-input v-model="addForm.weedingTime" placeholder="请输入除草周期" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="种植方式" prop="farming">
              <el-input v-model="addForm.farming" placeholder="请输入种植方式" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="负责人" prop="supervisor">
              <el-input v-model="addForm.supervisor" placeholder="请输入负责人" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="addForm.remark" placeholder="请输入备注" clearable/>
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="submitForm">确 定</el-button>
        <el-button round @click="ok">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 产地溯源对话框 -->
    <el-dialog
      title="产地溯源"
      :visible.sync="openTrace"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <template>
        <div id="container" v-loading="loading"></div>
        <el-row style="margin-top: 16px">
          <el-col :span="19" :offset="5">
            <span style="font-size: 16px;font-weight: bold">详细地址:{{ this.address }}</span>
          </el-col>
        </el-row>
      </template>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="ok">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 周期记录对话框 -->
    <el-dialog
      title="周期记录"
      :visible.sync="openPeriod"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-descriptions border :column="1" :content-style="content_style" :label-style="label_style">
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-goods"></i>
            作物名称
          </template>
          {{ this.form.commodityName }}
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions border :column="2" :content-style="content_style" :label-style="label_style">
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-date"></i>
            作物编号
          </template>
          {{ this.form.commodityId }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-document"></i>
            作物种类
          </template>
          {{ this.form.commodityPartition }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-position"></i>
            产地
          </template>
          {{ this.form.origin }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-odometer"></i>
            温度
          </template>
          {{ this.form.temperature }} ℃
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-sunrise"></i>
            种植时间
          </template>
          {{ this.form.growTime }} 天
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-heavy-rain"></i>
            灌溉时间
          </template>
          {{ this.form.irrigateTime }} 天
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-light-rain"></i>
            施肥时间
          </template>
          {{ this.form.fertilizerTime }} 天
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-sunny"></i>
            除草时间
          </template>
          {{ this.form.weedingTime }} 天
        </el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="ok">确 定</el-button>
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
import {
  addOrigin,
  delOrigin,
  getOriginByCommodityId,
  getOriginByCommodityName, getOriginBySupervisor,
  listOrigin
} from "@/api/traceability/offer";
import AMapLoader from "@amap/amap-jsapi-loader";

export default {
  name: "Offer",
  data() {
    return {
      testForm:{
        testResult: 0,
        remark: "价格实惠，物美价廉"
      },
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
      originList: [],
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
      // 地图开关
      openTrace: false,
      // 周期记录开关
      openPeriod: false,
      // 新增开关
      openAdd: false,
      // 质检证明开关
      openDetail: false,
      // 周期记录表单
      form: {},
      // 新增表单
      addForm: {},
      // 详细地址
      address: "",
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 质检证明
    handleStart(row) {
      this.title = "质检证明";
      this.openDetail = true;
    },
    submitForm() {
      addOrigin(this.addForm).then(() => {
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
      this.title = "新增作物";
      this.reset();
    },
    // 周期记录
    handlePeriod(row) {
      this.openPeriod = true;
      this.form = row;
    },
    // 产地溯源
    handleChase(row) {
      this.openTrace = true;
      this.address = row.origin;
      this.initAMap(row.originX, row.originY);
    },
    // 地图初始化
    initAMap(x, y) {
      this.loading = true;
      AMapLoader.load({
        key: "866871328dce226ffe76e29ff2631279",
        version: "2.0",
        plugins: ['AMap.ToolBar', 'AMap.Scale', 'AMap.HawkEye', 'AMap.ControlBar'],
      })
        .then((AMap) => {
          this.map = new AMap.Map("container", {
            viewMode: "3D", // 是否为3D地图模式
            zoom: 11, // 初始化地图级别(越大越精确)
            center: [x, y], // 初始化地图中心点位置
          });
          this.map.addControl(new AMap.ToolBar());
          this.map.addControl(new AMap.Scale());
          this.map.addControl(new AMap.HawkEye());
          this.map.addControl(new AMap.ControlBar());
          this.loading = false;
        })
        .catch((e) => {
          console.log(e);
        });
    },

    parseTime,
    /** 查询订单列表 */
    getList() {
      this.loading = true;
      if(this.queryParams.commodityId !== null){
        getOriginByCommodityId(this.queryParams).then(response => {
          this.originList = response.data;
          this.total = 1;
          this.loading = false;
        });
      }else if(this.queryParams.commodityName !== null){
        getOriginByCommodityName(this.queryParams).then(response => {
          this.originList = response.data;
          this.total = 1;
          this.loading = false;
        });
      }else if(this.queryParams.supervisor !== null){
        getOriginBySupervisor(this.queryParams).then(response => {
          this.originList = response.rows;
          this.total = response.rows.length;
          this.loading = false;
        });
      }else{
        listOrigin(this.queryParams).then(response => {
          this.originList = response.rows;
          this.total = response.total;
          this.loading = false;
        });
      }
    },
    // 表单重置
    reset() {
      this.form = {
        commodityId: null,
        commodityName: null,
        supervisor: null,
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
      this.reset()
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.commodityId;
      const query = {
        commodityId: id
      };
      this.$modal.confirm('是否确认删除作物编号为"' + id + '"的数据？').then(function () {
        return delOrigin(query);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
        this.$modal.msgError("取消删除");
      });
    },
    // 产地溯源开关
    ok() {
      this.openTrace = false;
      this.openPeriod = false;
      this.openAdd = false;
      this.openDetail = false;
    },
  }
};
</script>
