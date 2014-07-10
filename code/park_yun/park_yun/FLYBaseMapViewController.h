//
//  FLYBaseMapViewController.h
//  park_yun
//
//  Created by chen on 14-7-7.
//  Copyright (c) 2014年 无线飞翔. All rights reserved.
//

#import "FLYBaseViewController.h"
#import "BMapKit.h"
#import "FLYBaseMap.h"
#import "FLYParkModel.h"


#define kBlueColor Color(86,127,188,1)
#define kParkInfoHight 115
#define kBUNDLE_NAME @ "mapapi.bundle"
#define kBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: kBUNDLE_NAME]
#define kBUNDLE [NSBundle bundleWithPath: kBUNDLE_PATH]


#pragma mark - UIImage
@interface UIImage(InternalMethod)
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;
@end


#pragma mark - RouteAnnotation
@interface RouteAnnotation : BMKPointAnnotation
{
	int _type; ///<0:起点 1：终点 2：公交 3：地铁 4:驾乘 5:途经点
	int _degree;
}

@property (nonatomic) int type;
@property (nonatomic) int degree;
@end


#pragma mark - FLYBaseMapViewController
@interface FLYBaseMapViewController : FLYBaseViewController<BMKRouteSearchDelegate,FLYMapDelegate>{
    //地图
    FLYBaseMap  *_mapBaseView;
    //位置服务
    BMKLocationService *_locationService;
    //寻路服务
    BMKRouteSearch *_routesearch;
    
    //人当前位置
    CLLocationCoordinate2D _curCoordinate;

    //屏幕上次绘制标记时中心位置
    double lastMarkLat;
    double lastMarkLon;
    
    //屏幕上次加载数据时中心位置
    double lastLoadingLat;
    double lastLoadingLon;
    
    //是否跟随
    BOOL _isFollow;
    //是否定位
    BOOL _isLocation;
    //选中标记弹出框
    UIView *_parkInfoView;
    //当前标记数据
    FLYParkModel *_curModel;
    //标记是否已经被选中
    BOOL _isClick;
    //加载停车场位置
    BOOL _isLoading;
    
    BOOL _isReload;
}

//绘制标记面板
- (void)renderParkInfo;
//地图滑动、放大、缩小
- (void)regionChange:(BMKMapView *)mapView;

//获取导航路线图标
- (BMKAnnotationView*)getRouteAnnotationView:(BMKMapView *)mapview viewForAnnotation:(RouteAnnotation*)routeAnnotation;

//缓存导航Annotation
@property (strong, nonatomic)NSMutableArray *routeAnnotations;
//缓存导航Annotation
@property (strong, nonatomic)BMKPolyline *routeOverlay;
//缓存停车场Annotation
@property (strong, nonatomic)NSMutableDictionary *annotationDics;
//停车场数据（精简查询接口）
@property (strong, nonatomic)NSMutableArray *locationDatas;

- (void)loadLocationData:(id)data;

-(void)updateUserLocation:(BMKUserLocation *)userLocation;

@end



