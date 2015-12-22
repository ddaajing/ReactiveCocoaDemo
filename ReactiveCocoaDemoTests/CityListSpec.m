#import "Kiwi.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "GeoCityViewModel.h"

SPEC_BEGIN(CityListSpec)

__block GeoCityViewModel *viewModel;

describe(@"GeoCityViewModel", ^{

    beforeEach(^{
        viewModel = [[GeoCityViewModel alloc] init];
    });

    context(@"After loading", ^{
        it(@"should have 10 cities", ^{
            viewModel.uid = @"11";
            [[expectFutureValue(viewModel.cities) shouldEventually] haveCountOf: 10];
        });
    });
});

SPEC_END
