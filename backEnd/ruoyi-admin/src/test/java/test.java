import com.ruoyi.RuoYiApplication;
import com.ruoyi.framework.web.service.WebUserDetailsServiceImpl;
import com.ruoyi.web.controller.client.AgricultureClient;
import com.ruoyi.web.controller.contract.Agriculture;
import com.ruoyi.web.mapper.SysUserViewMapper;
import com.ruoyi.web.mapper.WebUserDetailMapper;
import com.ruoyi.web.service.impl.WebCommodityDetailServiceImpl;
import org.fisco.bcos.sdk.transaction.model.exception.ContractException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.math.BigInteger;

@SpringBootTest(classes = RuoYiApplication.class)
@RunWith(SpringRunner.class)
public class test {
    @Autowired
    private WebCommodityDetailServiceImpl webCommodityDetailMapper;

    @Autowired
    private WebUserDetailsServiceImpl webUserDetailsService;

    @Autowired
    private SysUserViewMapper sysUserViewMapper;


    @Autowired
    private WebUserDetailMapper webUserDetailMapper;

    @Autowired
    private AgricultureClient agricultureClient;

    @Test
    public void test(){
//        System.out.println(sysUserViewMapper.selectRateOfEasy());
        System.out.println("1");
    }




/*    @Test
    public  void loginTest(){
//        WebUser webUser=new WebUser("YinJialun","123");
        sysUserViewMapper.insertOriginId(10L);
    }*/

    @Test
    public void testAddCommodity(){
        BigInteger id = new BigInteger("102900005115762");
        String name = "苋菜";
        String origin = "山东济宁";
        BigInteger x = new BigInteger("35");
        BigInteger y = new BigInteger("115");
        String partition = "花菜类";
        BigInteger bagging = new BigInteger("0"); // 0表示没套袋
        BigInteger growTime = new BigInteger("2");
        BigInteger irrigateTime = new BigInteger("3");
        BigInteger fertilizeTime = new BigInteger("4");
        BigInteger weedingTime = new BigInteger("4");
        BigInteger temperature = new BigInteger("20");
        String farming = "大棚种植";
        BigInteger pickingTime = new BigInteger(String.valueOf(System.currentTimeMillis()+5));
        String remark = "无";
        String supervisor = "张三";
        boolean delete = true;
        agricultureClient.addCommodity(id, name, origin, x, y, partition, bagging, growTime, irrigateTime, fertilizeTime, weedingTime, temperature, farming, pickingTime, remark, supervisor, delete);
        System.out.println("发布成功！");
    }

    @Test
    public void testQueryCommodity() throws ContractException {
        BigInteger id = new BigInteger("102900005115763");
        Agriculture.Struct0 set = agricultureClient.queryCommodity(id);
//        System.out.println(set);
//        System.out.println("负责人: " + set.supervisor);
//        System.out.println("发布成功！");
        if(set==null){
            System.out.println("不存在！");
        }else{
            System.out.println("负责人: " + set.supervisor);
            System.out.println("发布成功！");
        }
    }

    @Test
    public void testDeleteCommodity() {
        BigInteger id = new BigInteger("102900005115762");
        agricultureClient.deleteCommodity(id);
        System.out.println("删除成功！");
    }

}
