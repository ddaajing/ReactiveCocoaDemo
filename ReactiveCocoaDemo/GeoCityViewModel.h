//
//  GeoCityViewModel
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-5.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoCityViewModel : NSObject

/**
 *  城市数组
 */
@property (nonatomic, strong) NSMutableArray *cities;
 
/**
 *  用户ID
 */
@property (nonatomic, strong) NSString *uid;

/**
 *  服务的状态消息
 */
@property (nonatomic, strong) NSString *statusMessage;


@end
