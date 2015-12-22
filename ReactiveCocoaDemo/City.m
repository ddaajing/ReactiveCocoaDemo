//
//  City.m
//  ReactiveCocoaDemo
//
//  Created by dajing on 14-6-12.
//  Copyright (c) 2014年 Anjuke. All rights reserved.
//

#import "City.h"

@implementation City

// Mantle定制的value parse path
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cityName": @"toponymName",
             @"cityImage": @"toponymName"
             };
}

// 城市封面属性转换器
+ (NSValueTransformer *)cityImageJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *cityName) {
        if ([cityName isEqualToString:@"Beijing"])
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/9/95/BeijingWatchTower.jpg/220px-BeijingWatchTower.jpg";
        else if([cityName isEqualToString:@"Seoul"])
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Gyeongbok-gung_palace-05_%28xndr%29.jpg/220px-Gyeongbok-gung_palace-05_%28xndr%29.jpg";
        else if([cityName isEqualToString:@"Tokyo"])
            return @"http://upload.wikimedia.org/wikipedia/commons/thumb/1/12/TokyoMetropolitanGovernmentOffice.jpg/220px-TokyoMetropolitanGovernmentOffice.jpg";
        else if([cityName isEqualToString:@"Mexico City"])
            return @"http://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Old_architecture_Mexico_City.jpg/220px-Old_architecture_Mexico_City.jpg";
        else if([cityName isEqualToString:@"Manila"])
        return @"http://upload.wikimedia.org/wikipedia/en/thumb/7/72/Intramuros_002.JPG/220px-Intramuros_002.JPG";
        else if([cityName isEqualToString:@"Dhaka"])
            return @"http://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/Dhaka_Lalbagh_Fort_5.JPG/220px-Dhaka_Lalbagh_Fort_5.JPG";
        else if([cityName isEqualToString:@"Jakarta"])
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Andries_Beeckman_-_The_Castle_of_Batavia.jpg/220px-Andries_Beeckman_-_The_Castle_of_Batavia.jpg";
        else if([cityName isEqualToString:@"Taipei"])
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Chiang_Kai-shek_memorial_amk.jpg/220px-Chiang_Kai-shek_memorial_amk.jpg";
        else if([cityName isEqualToString:@"Hong Kong"])
            return @"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/HK_Central_Statue_Square_Legislative_Council_Building_n_Neoclassicism_n_Lippo_Centre.JPG/220px-HK_Central_Statue_Square_Legislative_Council_Building_n_Neoclassicism_n_Lippo_Centre.JPG";
        else if([cityName isEqualToString:@"Bogotá"])
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Old_timer_structural_worker2.jpg/220px-Old_timer_structural_worker2.jpg" ;
        else
            return @"http://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Ngaye_%28Naraka%29_in_Burmese_art.jpg/220px-Ngaye_%28Naraka%29_in_Burmese_art.jpg";
    } reverseBlock:^id(NSString *imgName) {
        return @"http://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Ngaye_%28Naraka%29_in_Burmese_art.jpg/220px-Ngaye_%28Naraka%29_in_Burmese_art.jpg";
    }];
}

@end
