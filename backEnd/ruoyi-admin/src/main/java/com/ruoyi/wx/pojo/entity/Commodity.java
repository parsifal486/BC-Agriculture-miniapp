package com.ruoyi.wx.pojo.entity;

import com.ruoyi.common.core.domain.BaseEntity;
import lombok.Data;


@Data
public class Commodity extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 商品ID */
    private Long commodityId;

    /** 分区ID */
    private Long partitionId;

    /** 分区名称 */
    private String partitionName;

    /** 商品价格 */
    private Float commodityPrice;

    /** 商品名称 */
    private String commodityName;

    /** 商品图片 */
    private String profileImage;

    /** 商品来源 */
    private String origin;

    /** 销售数量 */
    private Long selling;

    /** 过期标志 */
    private Long expirationFlag;

    /** 过期时间 */
    private Long expirationTime;

    /** 权限 */
    private Long permission;

    /** 损耗率 */
    private Float lossRate;

    /** 是否权限 */
    private Boolean perm;

    /** 分数 */
    private Float score;


}
