package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Permission;
import cn.yunhe.travel.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/permission")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @RequestMapping("/findAll")
    public String findAllPermission(Model model) {
        List<Permission> permissionList = permissionService.findAllPermissions();
        model.addAttribute("permissionList",permissionList);
        return "permission-list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(){
        return "permission-add";
    }

    @RequestMapping("/addPermission")
    public String addPermission(Permission permission) {
        permissionService.addPermission(permission);
        return "redirect:findAll";
    }

}
