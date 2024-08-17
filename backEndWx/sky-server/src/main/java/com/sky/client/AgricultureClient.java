package com.sky.client;


import com.sky.contract.Agriculture;
import org.fisco.bcos.sdk.BcosSDK;
import org.fisco.bcos.sdk.client.Client;
import org.fisco.bcos.sdk.crypto.keypair.CryptoKeyPair;
import org.fisco.bcos.sdk.model.TransactionReceipt;
import org.fisco.bcos.sdk.model.callback.TransactionCallback;
import org.fisco.bcos.sdk.transaction.model.exception.ContractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;

@Component
public class AgricultureClient {

    @Resource
    private BcosSDK bcosSDK;

    @Resource
    private Client client;

    @Resource
    private CryptoKeyPair cryptoKeyPair;

    @Value("${fisco.contractAddress.asset}")
    private String contractAddress;

    /**
     * 添加商品(注意这里的时间都是时间戳)
     *
     * @param id            商品id
     * @param name          商品名称
     * @param origin        商品产地
     * @param x             商品经度
     * @param y             商品纬度
     * @param partition     商品分类
     * @param bagging       是否套袋
     * @param growTime      种植时间
     * @param irrigateTime  浇水时间
     * @param fertilizeTime 施肥时间
     * @param weedingTime   除草时间
     * @param temperature   保存温度
     * @param farming       种植方法
     * @param pickingTime   采摘时间
     * @param remark        备注
     * @param supervisor    负责人
     * @param delete        是否没删除(这里一般填ture)
     */
    public void addCommodity(BigInteger id, String name, String origin, BigInteger x, BigInteger y, String partition,
                             BigInteger bagging, BigInteger growTime, BigInteger irrigateTime, BigInteger fertilizeTime,
                             BigInteger weedingTime, BigInteger temperature, String farming, BigInteger pickingTime,
                             String remark, String supervisor, boolean delete) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        Agriculture.Struct0 set = new Agriculture.Struct0(id, name, origin, x, y, partition, bagging, growTime, irrigateTime, fertilizeTime, weedingTime, temperature, farming, pickingTime, remark, supervisor, delete);
        agriculture.addOrigin(set);

    }

    /**
     * 查询商品
     *
     * @param id 商品id
     * @return 商品信息
     */
    public Agriculture.Struct0 queryCommodity(BigInteger id) throws ContractException {
        System.out.println("-----------------------------------------------------");
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);

        return agriculture.getOrigin(id);
    }

    /**
     * 删除商品
     *
     * @param id 商品id
     */
    public void deleteCommodity(BigInteger id) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        agriculture.deleteOrigin(id, new CallbackResponse());
    }

    /**
     * 添加运输信息
     *
     * @param id         商品id
     * @param name       商品名称
     * @param transport  运输方式
     * @param time       运输时间(时间戳)
     * @param x          运输经度
     * @param y          运输纬度
     * @param remark     备注
     * @param status     运输状态(0已到达，1运输中)
     * @param supervisor 负责人
     * @param delete     是否删除(这里一般填ture)
     */
    public void addTransport(BigInteger id, String name, String transport, BigInteger time,
                             BigInteger x, BigInteger y, String remark, BigInteger status,
                             String supervisor, boolean delete) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        Agriculture.Struct1 set = new Agriculture.Struct1(id, name, transport, time, x, y, remark, status, supervisor, delete);
        agriculture.addTransport(set);
    }

    /**
     * 查询运输信息
     *
     * @param id 商品id
     * @return 运输信息
     */
    public Agriculture.Struct1 queryTransport(BigInteger id) throws ContractException {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        return agriculture.getTransport(id);
    }

    /**
     * 删除运输信息
     *
     * @param id 商品id
     */
    public void deleteTransport(BigInteger id) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        agriculture.deleteTransport(id, new CallbackResponse());
    }

    /**
     * 添加销售信息
     *
     * @param id          商品id
     * @param name        商品名称
     * @param time        销售时间(时间戳)
     * @param testResult  检测结果(0合格,1不合格)
     * @param remark      备注
     * @param testPicture 检测图片
     * @param supervisor  负责人
     * @param delete      是否删除(这里一般填ture)
     */
    public void addSell(BigInteger id, String name, BigInteger time, BigInteger testResult, String remark,
                        String testPicture, String supervisor, boolean delete) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        Agriculture.Struct2 set = new Agriculture.Struct2(id, name, time, testResult, remark, testPicture, supervisor, delete);
        agriculture.addSell(set, new CallbackResponse());
    }


    /**
     * 查询销售信息
     *
     * @param id 商品id
     * @return 销售信息
     */
    public Agriculture.Struct2 querySell(BigInteger id) throws ContractException {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        return agriculture.getSell(id);
    }

    /**
     * 删除销售信息
     *
     * @param id 商品id
     */
    public void deleteSell(BigInteger id) {
        Agriculture agriculture = Agriculture.load(contractAddress, client, cryptoKeyPair);
        agriculture.deleteSell(id, new CallbackResponse());
    }

    private static class CallbackResponse extends TransactionCallback {
        @Override
        public void onResponse(TransactionReceipt transactionReceipt) {
            System.out.println("回调结果：");
            System.out.println("合约地址：" + transactionReceipt.getContractAddress());
            System.out.println("发送者地址：" + transactionReceipt.getFrom());
            System.out.println("gas使用量：" + transactionReceipt.getGasUsed());
            System.out.println("剩余gas：" + transactionReceipt.getRemainGas());
            System.out.println("状态：" + transactionReceipt.getStatus());
            System.out.println("消息：" + transactionReceipt.getMessage());
            System.out.println("状态消息：" + transactionReceipt.getStatusMsg());
        }
    }
}
