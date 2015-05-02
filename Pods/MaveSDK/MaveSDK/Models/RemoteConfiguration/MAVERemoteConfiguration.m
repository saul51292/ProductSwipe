//
//  MAVERemoteConfiguration.m
//  MaveSDK
//
//  Created by Danny Cosson on 12/18/14.
//
//

#import <Foundation/Foundation.h>
#import "MaveSDK.h"
#import "MAVEConstants.h"
#import "MAVERemoteConfiguration.h"
#import "MAVERemoteObjectBuilder.h"
#import "MAVERemoteConfigurationContactsPrePrompt.h"

NSString * const MAVERemoteConfigKeyInvitePageChoice = @"invite_page_choice";
NSString * const MAVERemoteConfigKeyContactsSync = @"contacts_sync";
NSString * const MAVERemoteConfigKeyContactsPrePrompt = @"contacts_pre_permission_prompt";
NSString * const MAVERemoteConfigKeyContactsInvitePage =
    @"contacts_invite_page";
NSString * const MAVERemoteConfigKeyCustomSharePage = @"share_page";
NSString * const MAVERemoteConfigKeyServerSMS = @"server_sms";
NSString * const MAVERemoteConfigKeyClientSMS = @"client_sms";
NSString * const MAVERemoteConfigKeyClientEmail = @"client_email";
NSString * const MAVERemoteConfigKeyFacebookShare = @"facebook_share";
NSString * const MAVERemoteConfigKeyTwitterShare = @"twitter_share";
NSString * const MAVERemoteConfigKeyClipboardShare = @"clipboard_share";


@implementation MAVERemoteConfiguration

- (instancetype)initWithDictionary:(NSDictionary *)data {
    if (self = [super init]) {
        self.invitePageChoice = [[MAVERemoteConfigurationInvitePageChoice alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyInvitePageChoice]];

        self.contactsSync = [[MAVERemoteConfigurationContactsSync alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyContactsSync]];

        self.contactsPrePrompt = [[MAVERemoteConfigurationContactsPrePrompt alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyContactsPrePrompt]];

        self.contactsInvitePage = [[MAVERemoteConfigurationContactsInvitePage alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyContactsInvitePage]];

        self.customSharePage = [[MAVERemoteConfigurationCustomSharePage alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyCustomSharePage]];

        self.serverSMS = [[MAVERemoteConfigurationServerSMS alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyServerSMS]];

        self.clientSMS = [[MAVERemoteConfigurationClientSMS alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyClientSMS]];

        self.clientEmail = [[MAVERemoteConfigurationClientEmail alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyClientEmail]];

        self.facebookShare = [[MAVERemoteConfigurationFacebookShare alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyFacebookShare]];

        self.twitterShare = [[MAVERemoteConfigurationTwitterShare alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyTwitterShare]];

        self.clipboardShare = [[MAVERemoteConfigurationClipboardShare alloc] initWithDictionary:[data objectForKey:MAVERemoteConfigKeyClipboardShare]];

        if (   !self.invitePageChoice
            || !self.contactsSync
            || !self.contactsPrePrompt
            || !self.contactsInvitePage
            || !self.customSharePage
            || !self.serverSMS
            || !self.clientSMS
            || !self.clientEmail
            || !self.facebookShare
            || !self.twitterShare
            || !self.clipboardShare) {
            NSString *errorMsg = @"Remote configuration failed, 1 or more sub-sections was nil:";
            if (!self.invitePageChoice) { errorMsg = [errorMsg stringByAppendingString:@" invitePageChoice"]; }
            if (!self.contactsSync) { errorMsg = [errorMsg stringByAppendingString:@" contactsSync"]; }
            if (!self.contactsPrePrompt) { errorMsg = [errorMsg stringByAppendingString:@" contactsPrePrompt"]; }
            if (!self.contactsInvitePage) { errorMsg = [errorMsg stringByAppendingString:@" contactsInvitePage"]; }
            if (!self.customSharePage) { errorMsg = [errorMsg stringByAppendingString:@" customSharePage"]; }
            if (!self.serverSMS) { errorMsg = [errorMsg stringByAppendingString:@" serverSMS"]; }
            if (!self.clientSMS) { errorMsg = [errorMsg stringByAppendingString:@" clientSMS"]; }
            if (!self.clientEmail) { errorMsg = [errorMsg stringByAppendingString:@" clientEmail"]; }
            if (!self.facebookShare) { errorMsg = [errorMsg stringByAppendingString:@" facebookShare"]; }
            if (!self.twitterShare) { errorMsg = [errorMsg stringByAppendingString:@" twitterShare"]; }
            if (!self.clipboardShare) { errorMsg = [errorMsg stringByAppendingString:@" clipboardShare"]; }
            MAVEErrorLog(errorMsg);
            return nil;
        }
    }
    return self;
}

+ (MAVERemoteObjectBuilder *)remoteBuilder {
    return [[MAVERemoteObjectBuilder alloc] initWithClassToCreate:[self class] preFetchBlock:^(MAVEPromise *promise) {
            [[MaveSDK sharedInstance].APIInterface getRemoteConfigurationWithCompletionBlock:^(NSError *error, NSDictionary *responseData) {
                MAVEDebugLog(@"RemoteConfiguration data was: %@", responseData);
                 if (error) {
                     [promise rejectPromise];
                 } else {
                     [promise fulfillPromise:(NSValue *)responseData];
                 }
             }];
            } defaultData:[self defaultJSONData]
            saveIfSuccessfulToUserDefaultsKey:MAVEUserDefaultsKeyRemoteConfiguration
            preferLocallySavedData:NO];
}

+ (NSDictionary *)defaultJSONData {
    return @{
        MAVERemoteConfigKeyInvitePageChoice: [MAVERemoteConfigurationInvitePageChoice defaultJSONData],
        MAVERemoteConfigKeyContactsSync: [MAVERemoteConfigurationContactsSync defaultJSONData],
        MAVERemoteConfigKeyContactsPrePrompt: [MAVERemoteConfigurationContactsPrePrompt defaultJSONData],
        MAVERemoteConfigKeyContactsInvitePage:[MAVERemoteConfigurationContactsInvitePage defaultJSONData],
        MAVERemoteConfigKeyCustomSharePage: [MAVERemoteConfigurationCustomSharePage defaultJSONData],
        MAVERemoteConfigKeyServerSMS: [MAVERemoteConfigurationServerSMS defaultJSONData],
        MAVERemoteConfigKeyClientSMS: [MAVERemoteConfigurationClientSMS defaultJSONData],
        MAVERemoteConfigKeyClientEmail: [MAVERemoteConfigurationClientEmail defaultJSONData],
        MAVERemoteConfigKeyFacebookShare: [MAVERemoteConfigurationFacebookShare defaultJSONData],
        MAVERemoteConfigKeyTwitterShare: [MAVERemoteConfigurationTwitterShare defaultJSONData],
        MAVERemoteConfigKeyClipboardShare: [MAVERemoteConfigurationClipboardShare defaultJSONData],
    };
}

@end
