<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!--学院数据-->
      <el-col :span="4" :xs="24">
        <div class="head-container">
          <el-tree
            :data="commodityOptions"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            class="tree"
            @node-click="handleNodeClick"
          />
        </div>
      </el-col>
      <!--用户数据-->
      <el-col :span="20" :xs="24">
        <el-form
          :model="queryParams"
          ref="queryForm"
          size="small"
          :inline="true"
          v-show="showSearch"
          label-width="68px"
        >
          <el-row>
            <el-col :span="7" :offset="2">
              <el-form-item label="商品名称" prop="commodityName">
                <el-input
                  v-model="queryParams.commodityName"
                  placeholder="请输入商品名称"
                  clearable
                  @keyup.enter.native="handleQuery"
                  @change="handleCancelName"
                />
              </el-form-item>
            </el-col>
            <el-col :span="7">
              <el-form-item label="商品状态" prop="permission">
                <el-select
                  v-model="queryParams.permission"
                  placeholder="商品状态"
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
            <el-col :span="7">
              <el-form-item label="创建时间">
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
          <el-row>
            <el-col :span="24" style="display: flex;justify-content: center">
              <el-form-item>
                <el-button
                  type="primary"
                  icon="el-icon-search"
                  size="small"
                  @click="handleQuery"
                  round
                >搜索
                </el-button
                >
                <el-button
                  icon="el-icon-refresh"
                  size="small"
                  @click="resetQuery"
                  round
                >重置
                </el-button>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              round
            >新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-edit-outline"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              round
            >修改
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              round
            >删除
            </el-button
            >
          </el-col>
          <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table
          v-loading="loading"
          :data="commodityList"
          @selection-change="handleSelectionChange"
          highlight-current-row
          stripe
          style="font-size: 15px"
        >
          <el-table-column
            type="selection"
            width="60"
            align="center"
          />
          <el-table-column
            label="商品编号"
            align="center"
            sortable
            key="commodityId"
            prop="commodityId"
            width="150"
          />
          <el-table-column
            label="商品图像"
            align="center"
            key="profileImage"
            prop="profileImage"
            :show-overflow-tooltip="true"
            width="100"
          >
            <template slot-scope="scope">
              <img
                :src="scope.row.profileImage"
                style="width: 50px; height: 50px; border-radius: 50%;"
                alt=""
              />
            </template>
          </el-table-column>
          <el-table-column
            label="商品名称"
            align="center"
            key="commodityName"
            prop="commodityName"
            width="110"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="商品产地"
            align="center"
            key="origin"
            prop="origin"
            width="80"
          />
          <el-table-column
            label="临期状态"
            align="center"
            key="expirationFlag"
            prop="expirationFlag"
            width="90"
          >
            <template slot-scope="scope">
              <el-tag
                :type="scope.row.expirationFlag === 0 ? 'success' : 'danger'"
                size="mini"
                style="font-size: 15px"
              >{{ scope.row.expirationFlag === 0 ? '正常' : '过期' }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column
            label="商品状态"
            align="center"
            key="permission"
            width="80"
          >
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
            :sortable="sort"
            width="110"
          >
            <template slot-scope="scope">
              <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作"
            align="center"
            class-name="small-padding fixed-width"
          >
            <template
              slot-scope="scope"
            >
              <el-button
                size="small"
                round
                plain
                type="warning"
                icon="el-icon-delete"
                style="font-size: 14px"
                @click="handleDynamicPricing(scope.row)"
              >&nbsp;动态定价
              </el-button>
              <el-button
                size="small"
                round
                plain
                type="primary"
                icon="el-icon-s-data"
                style="font-size: 14px"
                @click="handleDetail(scope.row)"
              >&nbsp;详情
              </el-button>
              <el-button
                size="small"
                round
                plain
                type="success"
                icon="el-icon-edit-outline"
                style="font-size: 14px"
                @click="handleUpdate(scope.row)"
              >&nbsp;修改
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <pagination
          v-show="total > 0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />
      </el-col>
    </el-row>

    <!-- 详情对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="850px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-descriptions border :column="3" :content-style="content_style" :label-style="label_style">
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-sell"></i>
            销量
          </template>
          {{ this.form.selling }} Kg
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-price-tag"></i>
            价格
          </template>
          {{ this.form.commodityPrice }} 元/Kg
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-data-line"></i>
            损失率
          </template>
          {{ this.form.lossRate }} %/Kg
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-search"></i>
            编号
          </template>
          {{ this.form.partitionId }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-coordinate"></i>
            所属类
          </template>
          {{ this.form.partitionName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-position"></i>
            产地
          </template>
          {{ this.form.origin }}
        </el-descriptions-item>
      </el-descriptions>
      <el-descriptions border :column="1" :content-style="content_style" :label-style="label_style">
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-collection-tag"></i>
            名称
          </template>
          {{ this.form.commodityName }}
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-picture-outline"></i>
            图像
          </template>
          <img
            :src="this.form.profileImage"
            style="width: 50px; height: 50px; border-radius: 50%;"
            alt=""
          />
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-time"></i>
            保质期
          </template>
          {{ this.form.expirationTime }} 天
        </el-descriptions-item>
        <el-descriptions-item>
          <template slot="label">
            <i class="el-icon-date"></i>
            简介
          </template>
          {{ this.form.remark }}
        </el-descriptions-item>
      </el-descriptions>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="simpleConfirm">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 修改或添加对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="openCommodity"
      width="600px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-form ref="form" :model="form" label-width="90px" label-position="left">
        <el-row>
          <el-col :span="24">
            <el-form-item prop="profileImage">
              <template slot="label">
                <i class="el-icon-picture-outline"></i>
                商品图像
              </template>
              <el-input v-model="form.profileImage" type="textarea" clearable placeholder="请输入商品图像"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item prop="partitionId">
              <template slot="label">
                <i class="el-icon-search"></i>
                商品分类
              </template>
              <treeselect
                v-model="form.partitionId"
                :multiple="false"
                :options="commodityOptions"
                :default-expand-all="true"
                :clearable="true"
                :placeholder="'请选择商品分类'"
              />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="40">
          <el-col :span="12">
            <el-form-item prop="commodityName">
              <template slot="label">
                <i class="el-icon-collection-tag"></i>
                商品名称
              </template>
              <el-input v-model="form.commodityName" clearable placeholder="请输入商品名称"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="commodityPrice">
              <template slot="label">
                <i class="el-icon-price-tag"></i>
                商品价格
              </template>
              <el-input v-model="form.commodityPrice" clearable placeholder="请输入商品价格">
                <template slot="append">元/Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="40">
          <el-col :span="12">
            <el-form-item prop="selling">
              <template slot="label">
                <i class="el-icon-sell"></i>
                商品销量
              </template>
              <el-input v-model="form.selling" clearable placeholder="请输入商品销量">
                <template slot="append">Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="lossRate">
              <template slot="label">
                <i class="el-icon-data-line"></i>
                损失率
              </template>
              <el-input v-model="form.lossRate" clearable placeholder="请输入损失率">
                <template slot="append">%/Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="40">
          <el-col :span="12">
            <el-form-item prop="expirationTime">
              <template slot="label">
                <i class="el-icon-time"></i>
                保质期
              </template>
              <el-input v-model="form.expirationTime" clearable placeholder="请输入保质期">
                <template slot="append">天</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="origin">
              <template slot="label">
                <i class="el-icon-position"></i>
                商品产地
              </template>
              <el-input v-model="form.origin" clearable placeholder="请输入商品产地"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item prop="remark">
              <template slot="label">
                <i class="el-icon-date"></i>
                商品简介
              </template>
              <el-input v-model="form.remark" type="textarea" :autosize="{ minRows: 3, maxRows: 6}" clearable
                        placeholder="请输入商品简介"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="submitForm">确 定</el-button>
        <el-button round @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 动态定价对话框   -->
    <el-dialog
      :title="title"
      :visible.sync="openDynamicPricing"
      width="600px"
      append-to-body
      custom-class="custom-dialog"
    >
      <el-form ref="priceForm" :model="priceForm" label-width="90px" label-position="left">
        <el-col :span="23">
          <el-form-item prop="commodityName">
            <template slot="label">
              <i class="el-icon-collection-tag"></i>
              商品名称
            </template>
            <el-input v-model="priceForm.commodityName" clearable placeholder="请输入商品名称" disabled/>
          </el-form-item>
        </el-col>
        <el-row>
          <el-col :span="11">
            <el-form-item prop="commodityPrice">
              <template slot="label">
                <i class="el-icon-price-tag"></i>
                商品进价
              </template>
              <el-input v-model="priceForm.commodityPrice" clearable placeholder="请输入商品进价">
                <template slot="append">元/Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="11" :offset="1">
            <el-form-item prop="selling">
              <template slot="label">
                <i class="el-icon-sell"></i>
                商品销量
              </template>
              <el-input v-model="priceForm.selling" clearable placeholder="请输入商品销量">
                <template slot="append">Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="11">
            <el-form-item prop="lossRate">
              <template slot="label">
                <i class="el-icon-data-line"></i>
                损失率
              </template>
              <el-input v-model="priceForm.lossRate" clearable placeholder="请输入损失率">
                <template slot="append">%/Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="11" :offset="1">
            <el-form-item prop="expirationTime">
              <template slot="label">
                <i class="el-icon-time"></i>
                保质期
              </template>
              <el-input v-model="priceForm.expirationTime" clearable placeholder="请输入保质期">
                <template slot="append">天</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="23">
            <el-form-item prop="dynamicPrice">
              <template slot="label">
                <i class="el-icon-star-off"></i>
                建议定价
              </template>
              <el-input v-model="priceForm.dynamicPrice" clearable placeholder="商品建议定价">
                <template slot="append">元/Kg</template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" round @click="cancel">确 定</el-button>
        <el-button round @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<style scoped>
/deep/ .custom-dialog {
  border-radius: 8px;
}

.el-button--small {
  font-size: 12px !important;
}

.el-form-item >>> .el-form-item--medium {
  margin-right: 25px !important;
}

.tree >>> .el-tree-node__label {
  font-size: 15px;
  font-weight: 500;
}

.tree >>> .el-tree-node__label:before {
  content: '-';
  margin-right: 8px;
}

.head-container >>> .el-tree-node {
  margin-bottom: 5px;
}

.dialog-footer {
  display: flex;
  justify-content: center;
}
</style>

<script>
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import alt from "@/assets/images/404.png"
import {
  addCommodity,
  changeCommodityPermission,
  delCommodity,
  getCommodityTree, getDynamicPricing,
  listCommodity, updateCommodity
} from "@/api/back/commodity";
import {parseTime} from "@/utils/ruoyi";

export default {
  name: "Commodity",
  dicts: ["sys_normal_disable", "sys_user_sex"],
  components: {Treeselect},
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
      // 表格排序
      sort: true,
      alt: alt,
      // 只读
      disabled: true,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个停用
      single: true,
      // 非多个停用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 用户表格数据
      commodityList: [],
      // 弹出层标题
      title: "",
      // 商品树选项
      commodityOptions: undefined,
      // 是否显示弹出层
      open: false,
      // 是否显示查看商品列表弹出层
      openCommodity: false,
      // 是否显示动态定价弹出层
      openDynamicPricing: false,
      // 学院名称
      deptName: undefined,
      // 日期范围
      dateRange: [],
      // 表单参数
      form: {},
      // 定价表单
      priceForm: {},
      // 树选项
      defaultProps: {
        children: "children",
        label: "label",
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        commodityName: undefined,
        permission: undefined,
        partitionName: undefined,
        commodityId: undefined,
      },
      // 动态定价查询参数
      priceQueryParams: {
        pageNum: 1,
        pageSize: 10,
        commodityId: undefined,
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
  watch: {
    // 根据名称筛选蔬菜树
    deptName(val) {
      this.$refs.tree.filter(val);
    },
  },
  created() {
    this.getList();
    this.getDeptTree();
  },
  methods: {
    // 处理动态定价
    handleDynamicPricing(row) {
      this.title = "动态定价";
      this.priceQueryParams.commodityId = row.commodityId;
      listCommodity(this.priceQueryParams).then(response => {
        this.priceForm = response.rows[0];
        getDynamicPricing(row.commodityId).then(response => {
          this.priceForm.dynamicPrice = response.data.toFixed(2);
          this.openDynamicPricing = true;
        });
      });
    },
    // 表单重置
    reset() {
      this.form = {
        commodityId: undefined,
        commodityName: undefined,
        permission: undefined,
        dateRange: [],
      };
      this.resetForm("form");
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.queryParams.commodityId = this.ids[0] || row.commodityId; // 选中的id
      listCommodity(this.queryParams).then(response => {
        this.form = response.rows[0];
        this.openCommodity = true;
        this.title = "修改详情";
      });
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.openCommodity = true;
      this.title = "添加商品";
    },
    // 提交按钮
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.commodityId !== undefined) {
            updateCommodity(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openCommodity = false;
              this.resetQuery(); // 重置搜索参数
              this.getList();
            });
          } else {
            addCommodity(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.openCommodity = false;
              this.resetQuery(); // 重置搜索参数
              this.getList();
            });
          }
        }
      });
    },
    // 添加保质期单位
    addExpirationTime(row, column, cellValue) {
      return cellValue + ' 天';
    },
    parseTime,
    /** 查询用户列表 */
    getList() {
      this.loading = true;
      listCommodity(this.addDateRange(this.queryParams
        , this.dateRange)).then(
        (response) => {
          this.commodityList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    /** 查询学院下拉树结构 */
    getDeptTree() {
      getCommodityTree().then((response) => {
        this.commodityOptions = response.data;
      });
    },
    // 筛选节点
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      // 重置
      this.queryParams.commodityId = undefined;
      this.queryParams.partitionName = data.label;
      this.handleQuery();
    },
    // 新增和修改取消按钮
    cancel() {
      this.openCommodity = false;
      this.openDynamicPricing = false;
    },
    // 详情取消按钮
    simpleConfirm() {
      this.open = false;
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.queryParams.commodityId = undefined;
      this.$refs.tree.setCurrentKey(null);
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.commodityId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 详情按钮 */
    handleDetail(row) {
      this.reset();
      this.queryParams.commodityId = this.ids[0] || row.commodityId; // 选中的id
      listCommodity(this.queryParams).then(response => {
        this.form = response.rows[0];
        this.open = true;
        this.title = "查看详情";
      });
    },
    /** 删除按钮 */
    handleDelete(row) {
      const id = row.commodityId || this.ids;
      this.$modal
        .confirm('是否删除商品编号为"' + id + '"的数据项？')
        .then(function () {
          return delCommodity(id);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {
          this.$modal.msgWarning("取消删除");
        });
    },
    // 管理用户状态
    handleSwitch(row) {
      const id = row.commodityId;
      this.$modal
        .confirm('是否确认修改名称为"' + row.commodityName + '"的商品状态？')
        .then(function () {
          return changeCommodityPermission(id, !row.permission);
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
    // 处理取消日期
    handleCancelDate(value) {
      if (value === null) {
        this.dateRange = [];
      }
      this.getList();
    },
    // 处理取消状态
    handleCancelPermission(value) {
      if (value === null) {
        this.queryParams.permission = undefined;
      }
      this.getList();
    },
    // 处理取消名称
    handleCancelName(value) {
      if (value === null) {
        this.queryParams.commodityName = undefined;
      }
      this.getList();
    },
  },
};
</script>
