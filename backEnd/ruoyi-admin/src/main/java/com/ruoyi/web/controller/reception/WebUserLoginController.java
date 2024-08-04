package com.ruoyi.web.controller.reception;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.WebUser;

import com.ruoyi.framework.web.service.TokenService;
import com.ruoyi.framework.web.service.WebUserDetailsServiceImpl;

import com.ruoyi.web.domain.WebCommodityDetail;
import com.ruoyi.web.domain.WebUserDetail;
import com.ruoyi.web.domain.WebUserOrders;
import com.ruoyi.web.mapper.SysUserViewMapper;
import com.ruoyi.web.mapper.WebUserOrdersMapper;
import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
import org.fisco.bcos.sdk.abi.datatypes.generated.tuples.generated.Tuple2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/front")
//@CrossOrigin(origins = {"http://localhost:8080", "http://127.0.0.1:5503/"," http://192.168.0.108:80/"}, allowedHeaders = "*")
public class WebUserLoginController{

    @Resource
    @Qualifier("WebUserAuthenticationManager")
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private WebUserDetailsServiceImpl webUserDetailsService;

    @Autowired
    public WebCommodityDetailServiceImpl webCommodityDetailService;

    @Autowired
    public SysUserViewMapper sysUserViewMapper;

    @Autowired
    public WebUserOrdersMapper webUserOrdersMapper;
    /**
     * 会员登录验证
     *
     * @param
     * @return {@link String}
     */
//    @PostMapping("/webUser/login")
//    public AjaxResult login(@RequestParam("password") String Pwd, @RequestParam("username") String nikename) {
//        WebUser webuser=new WebUser(nikename,Pwd);
//        // 用户验证
//        Authentication authentication;
//        try {
//            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
//            authentication = authenticationManager
//                    .authenticate(new UsernamePasswordAuthenticationToken(webuser.getNickname(), webuser.getPwd()));
//        } catch (Exception e) {
//            if (e instanceof BadCredentialsException) {
//                throw new UserPasswordNotMatchException();
//            } else {
//                throw new ServiceException(e.getMessage());
//            }
//        }
//        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
//        String token = tokenService.createToken(loginUser);
//        // 生成token
//        HashMap<String, Object> map = new HashMap<>();
//        map.put("token",token);
//        map.put("user",loginUser.getWebUser());
//        return AjaxResult.success("登录成功",map);
//    }

    @RequestMapping("/Web/Login")
    public  AjaxResult login(@RequestBody Map params){
        String nickname= (String) params.get("userName");
        String Pwd= (String) params.get("password");
        WebUser webUser= webUserDetailsService.selectWebUserDetailByNickname(nickname);
        if(webUser==null){
            return AjaxResult.error("不存在该用户");
        }
        long uid;
        if(webUser.getPwd().equals(Pwd)){
            uid=webUser.getUserId();
        }else{
            return AjaxResult.error("登录失败");
        }
        return AjaxResult.success("登录成功",uid);
    }

    @RequestMapping("/user/Info/{userId}")
    public  AjaxResult getInfo(@PathVariable long userId ,HttpSession session){

        WebUser webUser=webUserDetailsService.getUserById(userId);
        session.setAttribute("user",webUser);

        Map returnMap=new HashMap<>();
        returnMap.put("userId",userId);
        return AjaxResult.success(returnMap);

    }

    @RequestMapping("/test")
    public WebUser test(HttpSession session){
        WebUser webUser=(WebUser) session.getAttribute("user");
        return webUser;
    }



    @RequestMapping("/user/popularList")
    public AjaxResult getPopularList()
    {
        List<WebCommodityDetail> webCommodityDetailList = new ArrayList<>();
        List<Tuple2<Long, Long>> tuple2s = sysUserViewMapper.selectWebCommodityByLoveFlag();
        for (Tuple2<Long, Long> map:tuple2s)
        {
            webCommodityDetailList.add(webCommodityDetailService.selectWebCommodityDetailByCommodityId(map.getValue1()));
        }
        return AjaxResult.success(webCommodityDetailList);
    }

    @RequestMapping("/user/Rate")
    public AjaxResult getRateList()
    {
        List<Long> longs = new ArrayList<>();
        List<Tuple2<Long, Long>> tuple2s = sysUserViewMapper.selectWebCommodityByLoveFlag();
        for (Tuple2<Long, Long> map:tuple2s)
        {
            longs.add(map.getValue2());
        }
        return AjaxResult.success(longs);
    }

//    @RequestMapping("/user/expirationRate")
//    public AjaxResult getExpirationListRate()
//    {
//        List<Long> longs = new ArrayList<>();
//        for (WebCommodityDetail webCommodityDetail:webCommodityDetailService.selectByExpiration_flag()){
//            longs.add(sysUserViewMapper.selectRateOfEasy(webCommodityDetail.getCommodityId()).getValue2());
//        }
//        return AjaxResult.success(longs);
//    }

    @RequestMapping("/user/expiration")
    public AjaxResult getExpirationList()
    {
        return AjaxResult.success(webCommodityDetailService.selectByExpiration_flag());
    }

//    @GetMapping("/personInfo/myOrders")
//    public AjaxResult selectByUserid(HttpSession session)
//    {
////        WebUser webUser=(WebUser)session.getAttribute("user");
//        return AjaxResult.success(webUserOrdersMapper.selectByUserid(200001L));
//    }

    @GetMapping("/personInfo/OrdersCommodity")
    public AjaxResult selectOrdersCommodityByOrders(HttpSession session)
    {
//        WebUser webUser=(WebUser)session.getAttribute("user");
        List<WebCommodityDetail> list = new ArrayList<>();
        for (WebUserOrders webUserOrders:webUserOrdersMapper.selectByUserid(200001L)){
            list.add(webCommodityDetailService.selectWebCommodityDetailByCommodityId(webUserOrders.getCommodityId()));
        }
        return AjaxResult.success(list);
    }
}

