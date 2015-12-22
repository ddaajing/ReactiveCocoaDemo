//
//  City.h
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-12.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface City : MTLModel<MTLJSONSerializing>

/**
 *  城市名称
 */
@property(nonatomic, copy) NSString *cityName;

/**
 *  城市封面
 */
@property(nonatomic, copy) NSString *cityImage;

@property (nonatomic, strong) NSData *thumbnailData;

@end
