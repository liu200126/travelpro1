package cn.yunhe.travel.controller;

import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.pojo.UserInfo;
import cn.yunhe.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/findAll")
    public String findAllUsers(Model model) {
        List<UserInfo> userList = userService.findAllUsers();
        model.addAttribute("userList", userList);
        return "user-list";
    }

    @GetMapping("/toAdd")
    public String toAdd(){
        return "user-add";
    }

    @RequestMapping("/addUser")
    public String addUser(UserInfo user) {
        userService.addUser(user);
        return "redirect:findAll";
    }
    //@PreAuthorize("hasAuthority('test')")//必须拥有test权限
    //@PreAuthorize("hasRole('ADMIN')")//必须拥有ROLE_ADMIN角色
    //@PreAuthorize("hasAuthority('ROLE_ADMIN')")//必须拥有ROLE_ADMIN角色
    //@PreAuthorize("#userId.equals('111-222')")//传递的userID必须是111-222才可以看
    //@PreAuthorize("authentication.principal.username.equals('tom')")//当前认证主体的用户名必须是tom
    //@PreAuthorize("authentication.principal.username.equals('tom') or hasRole('test')")//当前认证主体的用户名必须是tom或者拥有ROLE_test角色
    @RequestMapping("/findById/{id}")
    public String findById(@PathVariable("id") String userId, Model model) {
        UserInfo userInfo = userService.findUserById(userId);
        model.addAttribute("user", userInfo);
        return "user-show";
    }

    @RequestMapping("/findUserByIdAndRole/{userId}")
    public String findUserByIdAndRole(@PathVariable("userId") String userId,Model model) {
        List<Role> otherRoles = userService.findOtherRole(userId);
        model.addAttribute("userId", userId);
        model.addAttribute("roleList", otherRoles);
        return "user-role-add";
    }
    /*
    添加用户的权限
   */
    @RequestMapping("/addRoleToUser")
    public String addRoleToUser(String userId, String[] ids) {
        userService.addRoleToUser(userId, ids);
        return "redirect:findAll";
    }
}
