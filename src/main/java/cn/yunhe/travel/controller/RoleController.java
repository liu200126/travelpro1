package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Permission;
import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    @GetMapping("/toAdd")
    public String toAdd(){
        return "role-add";
    }

    @RequestMapping("/findAll")
    public String findAllRoles(Model model) {
        List<Role> roleList = roleService.findAllRoles();
        model.addAttribute("roleList", roleList);
        return "role-list";
    }

    @RequestMapping("/addRole")
    public String addRole(Role role) {
        roleService.addRole(role);
        return "redirect:findAll";
    }

    @RequestMapping("/findRoleByIdAndPermission/{roleId}")
    public String findRoleByIdAndPermission(@PathVariable("roleId") String roleId, Model model){
        List<Permission> permissionList = roleService.findOtherPermission(roleId);
        model.addAttribute("permissionList", permissionList);
        return "role-permission-add";
    }

    @RequestMapping("/addPermissionToRole")
    public String addPermissionToRole(String roleId,String[] ids){
        roleService.addPermissionToRole(roleId, ids);
        return "redirect:findAll";
    }
}
