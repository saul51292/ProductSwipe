//
//  MAVESpinnerImageView.m
//  MaveSDK
//
//  Created by Danny Cosson on 4/13/15.
//
//

#import "MAVESpinnerImageView.h"
#import "MAVEBuiltinUIElementUtils.h"

@implementation MAVESpinnerImageView

- (instancetype)init {
    if (self = [super init]) {
        [self doInitialSetup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self doInitialSetup];
    }
    return self;
}

- (void)doInitialSetup {
    NSString *bundleName = @"MaveSDK";
    self.animationImages = [NSArray arrayWithObjects:
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner1.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner2.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner3.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner4.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner5.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner6.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner7.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner8.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner9.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner10.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner11.png" fromBundle:bundleName],
                            [MAVEBuiltinUIElementUtils imageNamed:@"MAVESpinner12.png" fromBundle:bundleName],
                            nil];
    self.animationDuration = 0.7f;
    self.animationRepeatCount = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self startAnimating];
}

@end
