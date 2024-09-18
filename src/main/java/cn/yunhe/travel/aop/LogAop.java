package cn.yunhe.travel.aop;

import cn.yunhe.travel.mapper.SysLogMapper;
import cn.yunhe.travel.pojo.SysLog;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    @Resource
    private SysLogMapper sysLogMapper;

    private Logger logger = LoggerFactory.getLogger(LogAop.class);
    private Date start;
    private Date end;

    //定义切面
    @Pointcut("execution(* cn.yunhe.travel.service..*.*(..))")
    public void pointCut(){}

    @Before("pointCut()")
    public void before(JoinPoint joinpoint){
        start = new Date();
        String time = dateToStr(start, "yyyy-MM-dd HH:mm:ss");
        logger.info("==============>>>>>"+time+"进入到了"+joinpoint.getTarget().getClass().getSimpleName()+"类的"+joinpoint.getSignature().getName()
        +"方法，参数是:"+ Arrays.toString(joinpoint.getArgs()));
    }


    @After("pointCut()")
    public void after(JoinPoint joinPoint){
        SecurityContext context = SecurityContextHolder.getContext();
        if (context!=null){
            Authentication authentication = context.getAuthentication();
            String method = joinPoint.getSignature().getName();
            //没有登录时不进行日志记录，访问日志管理时不记录！
            if (authentication!=null&&!"findAllSysLog".equals(method)){
                ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
                HttpServletRequest request = requestAttributes.getRequest();
                end = new Date();
                String time = dateToStr(end, "yyyy-MM-dd HH:mm:ss");
                long useTime = end.getTime() - start.getTime();
                logger.info("==============>>>>>"+time+"执行"+joinPoint.getTarget().getClass().getSimpleName()+"类的"+joinPoint.getSignature().getName()
                        +"方法结束,花费的时间是："+useTime+"ms");
                SysLog sysLog = new SysLog();
                sysLog.setVisitTime(start);
                sysLog.setExecutionTime(useTime);
                sysLog.setMethod(method);
                String url = request.getRequestURL().toString();
                sysLog.setUrl(url);
                sysLog.setIp(request.getRemoteAddr());
                User principal = (User) authentication.getPrincipal();
                sysLog.setUsername(principal.getUsername());
                sysLogMapper.save(sysLog);
            }

        }


    }
    /**
     * 将日期转换成指定格式的字符串
     */
    private String dateToStr(Date date,String pattern){
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.format(date);
    }
}
