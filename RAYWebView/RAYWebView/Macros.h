//
//  Macros.h
//  RAYWebView
//
//  Created by 党磊 on 15/9/16.
//  Copyright (c) 2015年 党磊. All rights reserved.
//

#ifndef RAYWebView_Macros_h
#define RAYWebView_Macros_h

// 设备相关
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define IsIOS7OrLater  ([CurrentSystemVersion floatValue] >= 7.0 ? YES : NO)
#define IsIOS8OrLater  ([CurrentSystemVersion floatValue] >= 8.0 ? YES : NO)

//NSUserDefaults 实例化
#define UserDefault         [NSUserDefaults standardUserDefaults]
#define NotificationCenter  [NSNotificationCenter defaultCenter]
#define SharedApplication   [UIApplication sharedApplication]

//#define DeviceOpenUDID  ([OpenUDID value])
#define DeviceModel     ([[UIDevice currentDevice] model])
#define DeviceName      ([[UIDevice currentDevice] name])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
#define APPVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define FirstLaunch     APPVersion      //以系統版本來判斷是否第一次啓動，包括升級後啓動
#define FirstRun        @"firstRun"     //判斷是否第一次運行，升級後啓動不算
#define First_Launched  @"firstLaunch"  //判断程序是否是第一次启动

//  字符串
#ifndef nilToEmpty
#define nilToEmpty(object) (object!=nil)?object:@""
#endif

#ifndef formatStringOfObject
#define formatStringOfObject(object) [NSString stringWithFormat:@"%@", object]
#endif

#ifndef nilToEmptyFormatStringOfObject
#define nilToEmptyFormatStringOfObject(object) formatStringOfObject(nilToEmpty(object))
#endif

// File functions
#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// G C D
#define Back(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define Main(block) dispatch_async(dispatch_get_main_queue(),block)

// U I
#define ScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight         ([UIScreen mainScreen].bounds.size.height)
//  大小尺寸

#define NavBarHeight                        self.navigationController.navigationBar.bounds.size.height
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height

//get the size of the Application
#define APPHeight [[UIScreen mainScreen]applicationFrame].size.height
#define APPWidth  [[UIScreen mainScreen]applicationFrame].size.width

//get the right bottom origin's x,y of a view
#define VIEW_BX(view)  (view.frame.origin.x + view.frame.size.width)
#define VIEW_BY(view)  (view.frame.origin.y + view.frame.size.height )

//bounds就是屏幕的全部区域，applicationFrame就是app显示的区域，不包含状态栏（高度20，如果状态栏隐藏的话，那么，这个结果就和bounds一样了）

//  网络指示
#define ShowNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()      [UIApplication sharedApplication].networkActivityIndicatorVisible = NO
#define NetworkActivityIndicatorVisible(x)  [UIApplication sharedApplication].networkActivityIndicatorVisible = x


//----------------------图片----------------------------
//读取本地图片//建议使用前两种宏定义,性能高于后者
#define LoadImage(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]

//定义UIImage对象
#define Image(A)            [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]
//----------------------图片----------------------------

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define Color(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define BackgroundColor [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

//清除背景色
#define ClearColor [UIColor clearColor]


//----------------------颜色类--------------------------

//一般的提示信息
#define AlertView(title, msg) \
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil]; [alert show];

//----------------------调试类--------------------------
// 区别模拟器和真机
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//release时，屏蔽log
#if defined (DEBUG) && DEBUG == 1

#else
    #define NSLog(...) {};
#endif

#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)
#define NSLogPoint(point) NSLog(@"%s x:%.4f, y:%.4f", #point, point.x, point.y)
//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//单例化一个类

//+ (instancetype)sharedInstance {
//    static id sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[self alloc] init];
//    });
//    return sharedInstance;
//}

//+ (NetworkManager *)sharedInstance
//{
//    static dispatch_once_t  onceToken;
//    static NetworkManager * sSharedInstance;
//
//    dispatch_once(&onceToken;, ^{
//        sSharedInstance = [[NetworkManager alloc] init];
//    });
//    return sSharedInstance;
//}
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = ［self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}



#endif
