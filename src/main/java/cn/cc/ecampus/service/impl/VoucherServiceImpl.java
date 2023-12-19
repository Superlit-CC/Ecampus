package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.dto.Result;
import cn.cc.ecampus.entity.SeckillVoucher;
import cn.cc.ecampus.entity.Voucher;
import cn.cc.ecampus.mapper.VoucherMapper;
import cn.cc.ecampus.service.ISeckillVoucherService;
import cn.cc.ecampus.service.IVoucherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author superlit
 * @create 2023/12/14 11:12
 */
@Service
public class VoucherServiceImpl extends ServiceImpl<VoucherMapper, Voucher> implements IVoucherService {

    @Resource
    private ISeckillVoucherService seckillVoucherService;

    @Override
    @Transactional // 保证两个数据库表的一致性
    public void addSeckillVoucher(Voucher voucher) {
        // 保存优惠券
        save(voucher);
        // 保存秒杀信息
        SeckillVoucher seckillVoucher = new SeckillVoucher();
        seckillVoucher.setVoucherId(voucher.getId());
        seckillVoucher.setStock(voucher.getStock());
        seckillVoucher.setBeginTime(voucher.getBeginTime());
        seckillVoucher.setEndTime(voucher.getEndTime());
        seckillVoucherService.save(seckillVoucher);
    }

    @Override
    public Result queryVoucherOfShop(Long shopId) {
        // TODO 查询店铺的优惠券列表
        return Result.fail("功能暂未实现！");
    }
}
