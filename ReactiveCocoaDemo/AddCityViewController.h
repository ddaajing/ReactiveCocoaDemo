//
//  AddCityViewController.h
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-10.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

// 新建城市的回调
@protocol SaveDataCallBack <NSObject>

@optional
-(void)didSaveDataCallback:(City *)city;

@end

@interface AddCityViewController : UIViewController

@property (nonatomic, weak) id<SaveDataCallBack> delegate;

@end
