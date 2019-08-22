//
//  AppJSObject.h
//  JS_OC_Demo
//
//  Created by Hans on 2019/8/22.
//  Copyright © 2019 Cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol AppJSObjectDelegate <JSExport>

// 方法名和JS代码必须一一对应
-(void)onWechatPay:(NSString *)message;

@end

@interface AppJSObject : NSObject<AppJSObjectDelegate>

@property(nonatomic,weak) id<AppJSObjectDelegate> delegate;

@end

