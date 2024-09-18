package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.RoleMapper;
import cn.yunhe.travel.pojo.Permission;
import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAllRoles() {
        return roleMapper.findAllRoles();
    }

    @Override
    public void addRole(Role role) {
        roleMapper.addRole(role);
    }

    @Override
    public List<Permission> findOtherPermission(String roleId) {
        return roleMapper.findOtherPermission(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) {
        for (String permissionId : ids) {
            roleMapper.addPermissionToRole(roleId, permissionId);
        }
    }
}
