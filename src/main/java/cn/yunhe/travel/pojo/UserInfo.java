package cn.yunhe.travel.pojo;

import lombok.Data;

import java.util.List;

@Data
public class UserInfo {
  private String id;
  private String email;
  private String username;
  private String password;
  private String phoneNum;
  private Integer status;
  private List<Role> roles;
}
