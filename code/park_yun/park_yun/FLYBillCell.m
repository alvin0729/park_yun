//
//  FLYBillCell.m
//  park_yun
//
//  Created by chen on 14-7-9.
//  Copyright (c) 2014年 无线飞翔. All rights reserved.
//

#import "FLYBillCell.h"
#import "FLYUtils.h"

@implementation FLYBillCell

- (void)awakeFromNib
{
    //商品名称
    _orderNameLabel = (UILabel *)[self viewWithTag:101];
    
    _mtPaydateImage = (UIImageView *)[self viewWithTag:102];
    //交易时间
    _mtPaydateLabel = (UILabel *)[self viewWithTag:103];
    
    _mtPriceTitle = (UILabel *)[self viewWithTag:104];
    //交易金额
    _mtPriceLabel = (UILabel *)[self viewWithTag:105];
    
    _orderInfoImage = (UIImageView *)[self viewWithTag:106];
    //订单信息
    _orderInfoLabel = (UILabel *)[self viewWithTag:107];
    
    _mtBalanceTitle = (UILabel *)[self viewWithTag:108];
    //余额
    _mtBalanceLabel = (UILabel *)[self viewWithTag:109];
    
    _dateView = (UIView *)[self viewWithTag:110];
    
    _monthLabel = (UILabel *)[self viewWithTag:111];
    _monthLabel.textAlignment = NSTextAlignmentCenter;
    _monthLabel.font = [UIFont systemFontOfSize:8.0];
    
    _dayLabel = (UILabel *)[self viewWithTag:112];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.font = [UIFont systemFontOfSize:8.0];
    
    UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"mfpparking_kuang_all_0.png"]];
    _dateView.backgroundColor = bgColor;
}

- (void)layoutSubviews{
    _orderNameLabel.text = @"";
    
    if(self.traceModel.order != nil && [FLYBaseUtil isNotEmpty:self.traceModel.order.orderId]){
        if([self.traceModel.order.orderType isEqualToString:@"01"]) {
            _orderNameLabel.text = @"账户充值";
            _orderInfoImage.hidden = NO;
        }else if([self.traceModel.order.orderType isEqualToString:@"02"]) {
            _orderNameLabel.text = @"办理畅停卡";
            _orderInfoImage.hidden = YES;
        }else if([self.traceModel.order.orderType isEqualToString:@"03"]){
            _orderNameLabel.text = @"停车消费";
            _orderInfoImage.hidden = NO;
        }else if([self.traceModel.order.orderType isEqualToString:@"04"]) {
            _orderNameLabel.text = @"账户充值";
            _orderInfoImage.hidden = NO;
        }else if([self.traceModel.order.orderType isEqualToString:@"05"]) {
            _orderNameLabel.text = @"车位预定";
            _orderInfoImage.hidden = YES;
        }else if([self.traceModel.order.orderType isEqualToString:@"06"]){
            _orderNameLabel.text = @"车位预定(按小时)";
            _orderInfoImage.hidden = YES;
        }

        //支付方式
        //00余额
        if ([self.traceModel.order.orderPayflag isEqualToString:@"00"]) {
            _orderInfoImage.image = [UIImage imageNamed:@"mfpparking_time_all_0.png"];
            NSString *addTime = self.traceModel.order.orderAddtime;
            NSString *payTime = self.traceModel.order.orderPaytime;
            //
            if ([FLYBaseUtil isNotEmpty:addTime] && [FLYBaseUtil isNotEmpty:payTime]) {
                NSDate *beginDate = [FLYUtils dateFromFomate:addTime formate:@"yyyyMMddHHmmss"];
                NSDate *endDate = [FLYUtils dateFromFomate:payTime formate:@"yyyyMMddHHmmss"];
                _orderInfoLabel.text = [FLYUtils betweenDate:beginDate endDate:endDate];
            }
        }
        //01支付宝
        else if ([self.traceModel.order.orderPayflag isEqualToString:@"01"]) {
            _orderInfoImage.image = [UIImage imageNamed:@"mfpparking_zfb_all_0.png"];
            _orderInfoLabel.text = @"支付宝充值";
        }
        //02银联
        else if([self.traceModel.order.orderPayflag isEqualToString:@"02"]){
            _orderInfoImage.image = [UIImage imageNamed:@""];
            _orderInfoLabel.text = @"银联充值";
        }
        //03微信
        else if([self.traceModel.order.orderPayflag isEqualToString:@"03"]){
            _orderInfoImage.image = [UIImage imageNamed:@"mfpparking_wx_all_0.png"];
            _orderInfoLabel.text = @"微信充值";
        }
        else if([self.traceModel.order.orderPayflag isEqualToString:@"99"]){
            _orderInfoImage.image = [UIImage imageNamed:@"icon_hongbao.png"];
            _orderInfoLabel.text = @"优惠劵";
        }
        else{
            _orderInfoImage.image = nil;
            _orderInfoLabel.text = @"";
        }
    }else{
        NSString *parkName = self.traceModel.mtParkname != nil ? self.traceModel.mtParkname:@"";
        NSString *beginTime = self.traceModel.mtParkbegin;
        NSString *endTime = self.traceModel.mtParkend;
        _orderNameLabel.text = [NSString stringWithFormat:@"%@%@",parkName,@""];
        
        NSDate *beginDate = [FLYUtils dateFromFomate:beginTime formate:@"yyyyMMddHHmmss"];
        NSDate *endDate = [FLYUtils dateFromFomate:endTime formate:@"yyyyMMddHHmmss"];
        _orderInfoImage.image = [UIImage imageNamed:@"mfpparking_time_all_0.png"];
        _orderInfoLabel.text = [FLYUtils betweenDate:beginDate endDate:endDate];
    }
    
    //时间
    NSString *mtPaydate = self.traceModel.mtPaydate;
    if (mtPaydate != nil && mtPaydate.length > 0) {
        int month = [[mtPaydate substringWithRange:NSMakeRange(4,2)] intValue];
        int day = [[mtPaydate substringWithRange:NSMakeRange(6,2)] intValue];
        
        _monthLabel.text = [NSString stringWithFormat:@"%d%@",month,@"月"];
        _dayLabel.text = [NSString stringWithFormat:@"%d%@",day,@"日"];
        
        NSString *payDateHour = [mtPaydate substringWithRange:NSMakeRange(8,2)];
        NSString *payDateMin = [mtPaydate substringWithRange:NSMakeRange(10,2)];
        _mtPaydateLabel.text = [NSString stringWithFormat:@"%@:%@",payDateHour,payDateMin];
    }
    _dateView.hidden = !self.showDate;
    
    //余额
    double douleBalance = [self.traceModel.mtBalance doubleValue] / 100;
    _mtBalanceLabel.text = [NSString stringWithFormat:@"%0.2f",douleBalance];
    
    //消费
    double doulePrice = [self.traceModel.mtPrice doubleValue];
    doulePrice = doulePrice / 100;
    
    if (doulePrice > 0) {
        _mtPriceLabel.textColor = Color(66,139,202,1);
        _mtPriceLabel.text = [NSString stringWithFormat:@"+ %0.2f",doulePrice];
        _mtPriceTitle.text = @"充值：";
    }else{
        _mtPriceLabel.textColor = [UIColor orangeColor];
        _mtPriceLabel.text = [NSString stringWithFormat:@"- %0.2f",fabs(doulePrice)];
        _mtPriceTitle.text = @"消费：";
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

}

@end
