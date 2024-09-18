package cn.yunhe.travel.service;

import cn.yunhe.travel.pojo.Permission;

import java.util.List;

public interface PermissionService {
    /*
     查询所有的资源权限
    */
    public List<Permission> findAllPermissions();

    /**
     * 添加资源管理权限
     */
    void addPermission(Permission permission);
}
