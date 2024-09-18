package cn.yunhe.travel.pojo;


import lombok.Data;

import java.util.List;
import java.util.Set;

@Data
public class Role {

  private String id;
  private String roleName;
  private String roleDesc;
  private List<Permission> permissions;
}
