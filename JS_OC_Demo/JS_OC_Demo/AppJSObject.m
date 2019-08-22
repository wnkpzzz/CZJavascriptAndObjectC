//
//  AppJSObject.m
//  JS_OC_Demo
//
//  Created by Hans on 2019/8/22.
//  Copyright © 2019 Cheng. All rights reserved.
//

#import "AppJSObject.h"

@implementation AppJSObject

-(void)onWechatPay:(NSString *)message{
    [self.delegate onWechatPay:message];
}

@end
