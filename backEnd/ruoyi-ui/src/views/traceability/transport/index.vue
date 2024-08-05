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

    <el-table v-loading="loading" :data="transportList" stripe>
      <el-table-column label="作物编号" align="center" prop="commodityId"/>
      <el-table-column label="作物名称" align="center" width="110" prop="commodityName"/>
      <el-table-column label="运输方式" align="center" width="130" prop="commodityTransport"/>
      <el-table-column label="备注" width="300" align="center" prop="remark">
        <template slot-scope="scope">
          <el-link type="info" :underline="false">{{ scope.row.remark }}</el-link>
        </template>
      </el-table-column>
      <el-table-column label="运输时间" align="center" prop="transportTime" width="140">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.transportTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="运输状态" align="center" width="120" prop="transportStatus">
        <template slot-scope="scope">
          <el-button round plain v-if="scope.row.transportStatus === 0" type="success">已运输</el-button>
          <el-button round plain v-else type="warning">未运输</el-button>
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
                type="success"
                icon="el-icon-delete"
                @click="handleChase(scope.row)"
              >&nbsp;物流追踪
              </el-button>
            </el-col>
            <el-col :span="1.5" class="mt5">
              <el-button
                size="small"
                round
                plain
                type="primary"
                icon="el-icon-edit-outline"
                @click="handleStart(scope.row)"
              >&nbsp;通知配送
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
              >&nbsp;取消配送
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
            <el-form-item label="运输状态" prop="transportStatus">
              <el-radio-group v-model="addForm.transportStatus">
                <el-radio label="0">已配送</el-radio>
                <el-radio label="1">配送中</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="运输经度" prop="transportX">
              <el-input v-model="addForm.transportX" placeholder="请输入运输经度" clearable/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="运输纬度" prop="originY">
              <el-input v-model="addForm.transportY" placeholder="请输入运输纬度" clearable/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="运输方式" prop="commodityTransport">
              <el-input v-model="addForm.commodityTransport" placeholder="请输入运输方式" clearable/>
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

    <!-- 路程溯源对话框 -->
    <el-dialog
      title="物流追踪"
      :visible.sync="openTrace"
      width="650px"
      append-to-body
      custom-class="custom-dialog"
    >
      <template>
        <div id="container" v-loading="loading"></div>
      </template>
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
import AMapLoader from "@amap/amap-jsapi-loader";
import {
  addTransport,
  delTransport,
  getTransportById, getTransportByName, getTransportBySupervisor,
  getTransportCoordinate,
  listTransport
} from "@/api/traceability/transport";

export default {
  name: "Transport",
  data() {
    return {
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
      transportList: [],
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
      // 新增开关
      openAdd: false,
      // 周期记录表单
      form: {},
      // 新增表单
      addForm:{},
      // 开始点
      startPointX: undefined,
      startPointY: undefined,
      // 结束点
      endPointX: undefined,
      endPointY: undefined,
      // 中间点
      middlePointX: undefined,
      middlePointY: undefined,
    };
  },
  created() {
    this.getList();
  },
  methods: {
    submitForm() {
      addTransport(this.addForm).then(() => {
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
      this.title = "新增运输";
    },
    // 通知记录
    handleStart(row) {
      this.$message({
        message: "通知成功",
        type: "success"
      });
    },
    // 过程溯源
    handleChase(row) {
      this.openTrace = true;
      let query = {
        commodityId : row.commodityId
      }
      getTransportCoordinate(query).then(response => {
        console.log(response)
        this.startPointX = response.data[0].x;
        this.startPointY = response.data[0].y;
        this.endPointX = response.data[2].x;
        this.endPointY = response.data[2].y;
        this.middlePointX = response.data[1].x;
        this.middlePointY = response.data[1].y;
        this.initAMap(this.startPointX, this.startPointY, this.endPointX, this.endPointY, this.middlePointX, this.middlePointY);
      });
    },
    // 地图初始化
    initAMap(startX, startY, endX, endY, middleX, middleY) {
      this.loading = true;
      AMapLoader.load({
        key: "866871328dce226ffe76e29ff2631279",
        version: "2.0",
        plugins: [],
      })
        .then((AMap) => {
          this.map = new AMap.Map("container", {
            viewMode: "3D", // 是否为3D地图模式
            zoom: 7, // 初始化地图级别(越大越精确)
            center: [middleX,middleY], // 初始化地图中心点位置
          });
          var path = [
            new AMap.LngLat(startX, startY),
            new AMap.LngLat(middleX, middleY),
            new AMap.LngLat(endX, endY),
          ];
          var polyline = new AMap.Polyline({
            path: path, // 设置线覆盖物路径
            strokeWeight: 4,
            strokeColor: "#3366ff", // 线条颜色
            // 折线样式还支持 'dashed'
            strokeStyle: "solid",
            lineJoin: 'round',
            lineCap: 'round',
            zIndex: 50,
            isOutline: true,
          });
          const marker1 = new AMap.Marker({
            position: [startX, startY],
            title: "起始位置",
            icon: "https://webapi.amap.com/theme/v1.3/markers/n/start.png",
            offset: new AMap.Pixel(-13, -30),
          });
          const marker2 = new AMap.Marker({
            position: [middleX, middleY],
            title: "当前位置",
            icon: "https://webapi.amap.com/theme/v1.3/markers/n/mid.png",
            offset: new AMap.Pixel(-13, -30),
          });
          const marker3 = new AMap.Marker({
            position: [endX, endY],
            title: "终点位置",
            icon: "https://webapi.amap.com/theme/v1.3/markers/n/end.png",
            offset: new AMap.Pixel(-13, -30),
          });
          const markers = [marker1, marker2, marker3];
          this.map.add(markers);
          this.map.add(polyline);
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
      if (this.queryParams.commodityId !== null) {
        console.log(this.queryParams.commodityId)
        getTransportById(this.queryParams).then(response => {
          this.transportList = response.data;
          this.total = 1;
          this.loading = false;
        });
      } else if (this.queryParams.commodityName !== null) {
        getTransportByName(this.queryParams).then(response => {
          this.transportList = response.data;
          this.total = 1;
          this.loading = false;
        });
      } else if (this.queryParams.supervisor !== null) {
        getTransportBySupervisor(this.queryParams).then(response => {
          this.transportList = response.rows;
          this.total = response.rows.length;
          this.loading = false;
        });
      } else {
        listTransport(this.queryParams).then(response => {
          this.transportList = response.rows;
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
        return delTransport(query);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
        this.$modal.msgError("取消删除");
      });
    },
    // 路程溯源开关
    ok() {
      this.openTrace = false;
      this.openAdd = false;
    },
  }
};
</script>
