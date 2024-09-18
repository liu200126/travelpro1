package cn.yunhe.travel.service.impl;

import cn.yunhe.travel.mapper.SysLogMapper;
import cn.yunhe.travel.pojo.SysLog;
import cn.yunhe.travel.service.SysLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class SysLogServiceImpl implements SysLogService {
    @Resource
    private SysLogMapper sysLogMapper;
    @Override
    public List<SysLog> findAllSysLog() {
        return sysLogMapper.findAllSysLog();
    }
}
