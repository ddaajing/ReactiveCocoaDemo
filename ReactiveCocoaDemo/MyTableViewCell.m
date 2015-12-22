//
//  MyTableViewCell.m
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-5.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import "MyTableViewCell.h"
#import "City.h"

@interface MyTableViewCell()

@property(nonatomic, strong) UIImageView *imgView;

@end

@implementation MyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 4, 80, 80)];
        [self.contentView addSubview:self.imgView];
        
        RAC(self.textLabel, text) = RACObserve(self, city.cityName);
        
        RAC(self.imgView, image) = [[[RACObserve(self, city.thumbnailData)
                                                                ignore:nil]
                                                                map:^id(id value) {
                                                                    return [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                                                                                     UIImage *image = [UIImage imageWithData:value];
                                                                                     [subscriber sendNext:image];
                                                                                     [subscriber sendCompleted];
                                                                                     return nil;
                                                                                }]
                                                                                subscribeOn:[RACScheduler scheduler]]
                                                                                deliverOn:[RACScheduler mainThreadScheduler]];
                                                                }]
                                                                switchToLatest];
    }
    
    return self;
}

@end
