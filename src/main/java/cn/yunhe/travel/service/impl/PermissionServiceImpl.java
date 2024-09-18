package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.PermissionMapper;
import cn.yunhe.travel.pojo.Permission;
import cn.yunhe.travel.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionMapper permissionMapper;
    @Override
    public List<Permission> findAllPermissions() {
        return permissionMapper.findAllPermissions();
    }

    @Override
    public void addPermission(Permission permission) {
        permissionMapper.addPermission(permission);
    }
}
