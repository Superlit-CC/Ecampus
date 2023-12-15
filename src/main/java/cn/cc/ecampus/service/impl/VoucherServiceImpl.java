package cn.cc.ecampus.service.impl;

import cn.cc.ecampus.entity.Voucher;
import cn.cc.ecampus.mapper.VoucherMapper;
import cn.cc.ecampus.service.IVoucherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * @author superlit
 * @create 2023/12/14 11:12
 */
@Service
public class VoucherServiceImpl extends ServiceImpl<VoucherMapper, Voucher> implements IVoucherService {
}
