package cn.yunhe.travel.mapper;

import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    UserInfo findUserByUserName(String username);

    // 查询所有用户
    List<UserInfo> findAllUsers();
    //添加用户
    void addUser(UserInfo user);
    //获取用户详情
    UserInfo findUserById(String id);
    /**
     * 根据userId查询出可以添加的权限
     * @param userId
     */
    List<Role> findOtherRole(String userId);

    /**
     *  用户添加对应的角色
     * @param userId 用户id
     * @param roleId 角色id
     */
    void addRoleToUser(@Param("userId") String userId, @Param("roleId") String roleId);
}
