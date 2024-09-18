package cn.yunhe.travel.mapper;

import cn.yunhe.travel.pojo.SysLog;

import java.util.List;

public interface SysLogMapper {
    /**
     * 添加日志
     */
    void save(SysLog sysLog);

    /**
     * 获取所有日志
     */
    List<SysLog> findAllSysLog();
}
