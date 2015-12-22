//
//  AddCityViewModel.m
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-10.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import "AddCityViewModel.h"
#import "City.h"

@implementation AddCityViewModel

-(id)init {
    self = [super init];
    if(!self) return nil;
    
    [self bindPopulationColor];
    
    return self;
}

/**
 *  色彩属性绑定，根据UI上Slider的值
 */
-(void)bindPopulationColor {
    RAC(self, popColor) = [RACObserve(self, population) map:^id(NSNumber *popu) {
        return [UIColor colorWithRed:[popu floatValue] / 255. green:59 /255. blue:93/255. alpha:1.];
    }];
}

/**
 *  城市名称验证器信号
 *
 *  @return 验证器的信号
 */
-(RACSignal *)cityNameValidatorSignal {
    if (_cityNameValidatorSignal == nil ) {
        _cityNameValidatorSignal = [RACObserve(self,cityName) map:^id(NSString *newName) {
            BOOL isValid = true;
            
            if ([newName isEqualToString:@""]) {
                isValid = false;
            }
            
            return [NSNumber numberWithBool:isValid];
        }];
    }
    return _cityNameValidatorSignal;
}

/**
 *  保存命令
 *
 *  @return 保存新建城市的命令
 */
-(RACCommand *)saveCommand {
    if (_saveCommand == nil) {
        _saveCommand = [[RACCommand alloc] initWithEnabled:self.cityNameValidatorSignal signalBlock:
            ^RACSignal *(id input) {
                return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                    NSDictionary *JSONDictionary = @{@"toponymName": self.cityName};
                    
                    // 用Mantle来组装对象
                    City *newCity = [MTLJSONAdapter modelOfClass:City.class fromJSONDictionary:JSONDictionary error:nil];
                    [self downloadImageForCity:newCity];

                    // 发送信号
                    [subscriber sendNext:newCity];
                    [subscriber sendCompleted];
                    return nil;
                }];
            }];

    }
    return _saveCommand;
}

- (void)downloadImageForCity:(City *)city {
    RAC(city, thumbnailData) = [self download:city.cityImage];
}

- (RACSignal *)download:(NSString *)urlString {
    NSAssert(urlString, @"URL must not be nil");
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    return [[[NSURLConnection rac_sendAsynchronousRequest:request]
             reduceEach:^id(NSURLResponse *response, NSData *data){
                 return data;
             }] deliverOn:[RACScheduler mainThreadScheduler]];
}

@end
