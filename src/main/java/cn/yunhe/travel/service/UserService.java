package cn.yunhe.travel.service;

import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.pojo.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    List<UserInfo> findAllUsers();

    // 添加用户
    void addUser(UserInfo user);

    /**
     * 根据id查询用户详情
     * @param userId 用户id
     */
    UserInfo findUserById(String userId);
    /**
     * 根据userId查询出可以添加的角色
     */
    List<Role> findOtherRole(String userId);
    /*
    用户添加对应的角色
   */
    void addRoleToUser(String userId, String[] ids);
}
