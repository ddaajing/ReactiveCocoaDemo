//
//  GeoCityViewModel
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-5.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import "GeoCityViewModel.h"
#import "AFHTTPRequestOperationManager+RACSupport.h"
#import "City.h"

// mock up data request URL
static NSString *const kSubscribeURL = @"http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=anjuke";

@interface GeoCityViewModel()

// 查询信号
@property (nonatomic, strong) RACSignal *searchSignal;

@end

@implementation GeoCityViewModel

-(id)init {
    self = [super init];
    if(!self) return nil;

    [self initSearchSubscrition];
    
    return self;
}

- (void)initSearchSubscrition {
    [[self.searchSignal deliverOn:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDictionary *jsonSearchResult) {
        NSArray *rawArray = jsonSearchResult[@"geonames"];
        
        self.cities =
            [[[rawArray.rac_sequence
               map:^id(NSDictionary *rawDic) {
                                NSMutableDictionary *dic = [(NSDictionary *)rawDic mutableCopy];
                                City *city = [MTLJSONAdapter modelOfClass:City.class fromJSONDictionary:dic error:nil];
                                [self downloadImageForCity:city];
                                return city;
            }] array] mutableCopy];
    }];
    
    [self.searchSignal subscribeError:^(NSError *error) {
        self.statusMessage = @"offline";
    }];
}

-(RACSignal *)searchSignal {
    if (_searchSignal == nil) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer new];
        NSDictionary *params = @{@"user_id": @"88"};
         _searchSignal = [manager rac_GET:kSubscribeURL parameters:params];
    }
    return _searchSignal;
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
