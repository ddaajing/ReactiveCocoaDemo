#import "Kiwi.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "AddCityViewModel.h"

SPEC_BEGIN(AddCitySpec)

__block AddCityViewModel *viewModel;

describe(@"GeoCityViewModel", ^{

    beforeEach(^{
        viewModel = [[AddCityViewModel alloc] init];
    });

    context(@"After loading", ^{
        it(@"City name should be disable", ^{
            __block BOOL cityNameValid = NO;
            
            [viewModel.cityNameValidatorSignal subscribeNext:^(id value) {
                cityNameValid = [value boolValue];
            }];
            
            viewModel.cityName = @"";

            [[theValue(cityNameValid) should] beNo];
        });
    });

    context(@"After typing cityname ", ^{
        it(@"City name should be ok", ^{
            __block BOOL cityNameValid = NO;
            
            [viewModel.cityNameValidatorSignal subscribeNext:^(id value) {
                cityNameValid = [value boolValue];
            }];
            viewModel.cityName = @"non empty";

            [[theValue(cityNameValid) should] beYes];
        });
    });

});

SPEC_END
