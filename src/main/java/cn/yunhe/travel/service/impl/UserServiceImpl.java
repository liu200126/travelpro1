package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.UserMapper;
import cn.yunhe.travel.pojo.Permission;
import cn.yunhe.travel.pojo.Role;
import cn.yunhe.travel.pojo.UserInfo;
import cn.yunhe.travel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = userMapper.findUserByUserName(username);
        if (userInfo==null){
            return null;
        }

        //判断用户是否启用
        boolean enable = userInfo.getStatus().equals(1);
        //retern的意思就是把认证后的UserDetails放入到了Security上下文中
        return new User(username,userInfo.getPassword(),enable,true,
                true,true,getAuthorityList(userInfo));
    }

    private Collection<? extends GrantedAuthority> getAuthorityList(UserInfo userInfo) {
        ArrayList<SimpleGrantedAuthority> list = new ArrayList<>();
        List<Role> roles = userInfo.getRoles();
        if (roles!=null&&roles.size()>0){
            for (Role role : roles) {
                list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
                List<Permission> permissions = role.getPermissions();
                if (permissions!=null&&permissions.size()>0){
                    for (Permission permission : permissions) {
                        list.add(new SimpleGrantedAuthority(permission.getPermissionName()));
                    }
                }

            }
        }
        return list;
    }

    @Override
    public List<UserInfo> findAllUsers() {
        return userMapper.findAllUsers();
    }

    @Override
    public void addUser(UserInfo user) {
        String encodePassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodePassword);
        userMapper.addUser(user);
    }

    @Override
    public UserInfo findUserById(String userId) {
        return userMapper.findUserById(userId);
    }

    @Override
    public List<Role> findOtherRole(String userId) {
        return userMapper.findOtherRole(userId);
    }

    @Override
    public void addRoleToUser(String userId, String[] ids) {
        for (String id : ids) {
            userMapper.addRoleToUser(userId, id);
        }
    }
}
