//
//  AddCityViewModel.h
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-10.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddCityViewModel : NSObject
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, assign) float population;
@property (nonatomic, strong) UIColor *popColor;
@property (nonatomic ,strong) RACSignal *cityNameValidatorSignal;
@property (nonatomic, strong) RACCommand *saveCommand;
@end
