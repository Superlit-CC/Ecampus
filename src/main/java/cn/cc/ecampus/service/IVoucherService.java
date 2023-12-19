package cn.cc.ecampus.service;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.Voucher;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author superlit
 * @create 2023/12/14 11:01
 */
public interface IVoucherService extends IService<Voucher> {
    void addSeckillVoucher(Voucher voucher);

    Result queryVoucherOfShop(Long shopId);
}
