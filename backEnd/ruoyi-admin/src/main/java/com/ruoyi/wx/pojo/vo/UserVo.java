package com.ruoyi.wx.pojo.vo;

import com.ruoyi.wx.pojo.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.http.ResponseEntity;

import java.io.Serializable;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class UserVo extends User implements Serializable {
    private Long userId;
    private Long openId;
    private String nickname;
    private String pwd;
    private String profileImage;
    private String age;
    private String love;
    private String sex;
    private String phone;
    private Long permission;
    private Boolean perm;
    private  String address;
    private String[] loveList;
    private String token;
    private ResponseEntity<byte[]> responseEntity;

}
