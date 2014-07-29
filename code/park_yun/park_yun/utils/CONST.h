//
//  CONST.h
//
//  Created by chen on 14-6-7.
//  Copyright (c) 2014年 无线飞翔. All rights reserved.
//


//主题切换通知
#define kThemeDidChangeNotification @"kThemeDidChangeNotification"
//当前位置改变
#define kMapLocationNotification @"kMapLocationNotification"

#define kNavigationBarTitleLabel @"kNavigationBarTitleLabel"



//颜色
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//本机
#define kHttpDomain @"http://192.168.110.55:8080/park_yun"
//window
//#define kHttpDomain @"http://123.85.3.220:8105/park_yun"
//linux
//#define kHttpDomain @"http://123.85.3.25:8105/park_yun"
//小朱
//#define kHttpDomain @"http://192.168.110.117:8080/park_yun"

//------停车场-----
//周边停车场查询
#define kHttpQueryNearbyList @"/park/queryNearbyList.json"
//周边停车场查询(精简版本)
#define kHttpQueryNearbySimplifyList @"/park/queryNearbySimplifyList.json"
//自动巡航
#define kHttpQuerySelfMotionParkList @"/park/querySelfMotionParkList.json"
//停车场详情
#define kHttpQueryParkDetail @"/park/queryParkDetail.json"
//停车场入口列表
#define kHttpQueryParkGateList @"/park/queryParkGateList.json"

//------会员------
//登陆
#define kHttpLogin @"/member/loginForAes256.json"
//注销
#define kHttpLogout @"/member/logout.json"
//注册
#define kHttpMemberRegister @"/member/register.json"
//找回密码
#define kHttpFindPassword @"/member/findPwd.json"
//修改密码
#define kHttpUpdatePassword @"/member/updatePwd.json"
//添加停车场收藏
#define kHttpParkCollectAdd @"/member/addMemberCollect.json"
//删除停车场收藏
#define kHttpParkCollectRemove @"/member/removeMemberCollect.json"
//查询账单
#define kHttpQueryBillList @"/member/queryMemberTraceList.json"
//用户反馈
#define kHttpAddFeedback @"/member/addFeedback.json"
//查询足迹
#define kHttpFootmarkList @"/member/queryParkHisList.json"
//查询停车场会员列表
#define kHttpQueryParkCardList @"/member/queryParkCardList.json"
//查询用户收藏列表
#define kHttpQueryMemberCollectList @"/member/queryMemberCollectList.json"
//查询余额
#define kHttpQueryBalance @"/member/queryBalance.json"
//查询车牌列表
#define kHttpQueryCarnoList @"/member/queryMemberCarnoList.json"
//切换默认车牌
#define kHttpChangeCarno @"/member/changeCarno.json"
//解绑车牌
#define kHttpRemoveCarno @"/member/removeCarno.json"
//绑定车牌
#define kHttpAddCarno @"/member/addMemberCarno.json"
//添加评论
#define kHttpAddRemark @"/member/addRemark.json"
//查询评论
#define kHttpQueryRemarkList @"/member/queryRemarkList.json"

//------其他------
//商圈列表
#define kHttpQueryBusinessList @"/common/queryBusinessList.json"


//停车场标注
#define kAnnotationTypePark @"PARK"
//地图显示范围
#define kMapRange 0.005f

//json flag
#define kFlagYes @"0"

//百度地图
#define kBaiduKey @"U2NLMulqHTdAa5hnalS2Ps9c"
//百度统计（公司）
#define kBaiduStat @"8c73d05bef"
//百度统计（个人测试）
//#define kBaiduStat @"c5c1533fb8"
//讯飞语音
#define kXunfeiKey @"53c47fda"


