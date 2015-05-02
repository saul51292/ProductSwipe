//
//  MAVERemoteConfigurationClipboardShare.m
//  MaveSDK
//
//  Created by Danny Cosson on 1/11/15.
//
//

#import "MAVERemoteConfigurationClipboardShare.h"
#import "MAVEClientPropertyUtils.h"
#import "MAVETemplatingUtils.h"

NSString * const MAVERemoteConfigKeyClipboardShareTemplate = @"template";
NSString * const MAVERemoteConfigKeyClipboardShareTemplateID = @"template_id";
NSString * const MAVERemoteConfigKeyClipboardShareCopy = @"copy_template";

@implementation MAVERemoteConfigurationClipboardShare

- (instancetype)initWithDictionary:(NSDictionary *)data {
    if (self = [super init]) {
        NSDictionary *template = [data objectForKey:MAVERemoteConfigKeyClipboardShareTemplate];

        NSString *templateID = [template objectForKey:MAVERemoteConfigKeyClipboardShareTemplateID];
        if (![templateID isEqual: [NSNull null]]) {
            self.templateID = templateID;
        }
        NSString *text = [template objectForKey:MAVERemoteConfigKeyClipboardShareCopy];
        if (![text isEqual:[NSNull null]]) {
            self.textTemplate = text;
        }
        if (!self.textTemplate) {
            return nil;
        }

    }
    return self;
}

- (NSString *)text {
    return [MAVETemplatingUtils interpolateWithSingletonDataTemplateString:self.textTemplate];
}

+ (NSDictionary *)defaultJSONData {
    // With the clipboard we probably want to copy just the link
    NSString *text = @"";
    return @{
             MAVERemoteConfigKeyClipboardShareTemplate: @{
                     MAVERemoteConfigKeyClipboardShareTemplateID: @"0",
                     MAVERemoteConfigKeyClipboardShareCopy: text,
                     },
             };
}

@end
