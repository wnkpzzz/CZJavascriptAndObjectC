//
//  ViewController.m
//  JS_OC_Demo
//
//  Created by Hans on 2019/8/22.
//  Copyright © 2019 Cheng. All rights reserved.
//

#import "ViewController.h"
#import "AppJSObject.h"

@interface ViewController ()<UIWebViewDelegate,AppJSObjectDelegate>
@property(nonatomic ,strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initWebViewAction];
}

// 1、UIWebView初始化
-(void)initWebViewAction{
  
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"OCJSTest" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

// 2、网页即将开始加载
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    return YES;
}

// 3、网页加载完成
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    AppJSObject *jsObject = [AppJSObject new];
    jsObject.delegate = self;
    context[@"app"] = jsObject; // 这里的app和JS里面的app对应
    // 这里通过onPayParameter接受JS传递的参数
    context[@"onPayParameter"] = ^(NSString * p1, NSString * p2) {
        NSLog(@"这里相应JS传递的参数，参数1:%@, 参数2:%@", p1, p2);
    };
}

// 4、微信第三方支付JS->OC
- (void)onWechatPay:(NSString*)message{
    
    NSLog(@"这里相应JS传递的事件，按照业务逻辑执行相关代码");
    
    // 执行完毕，在需要的时候OC调用JS方法进行回调想用。
    [self wechatPayBack];
}

// 5、微信第三方支付结果返回OC->JS
- (void)wechatPayBack{
    
    JSContext *context=[self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    NSString *alertJS= [NSString stringWithFormat:@"wechatPayBack('%@','%@')",@"回调参数1",@"回调参数2"];
    [context evaluateScript:alertJS];//通过OC方法调用JS
}

@end
