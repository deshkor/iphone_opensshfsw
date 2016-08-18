#import "FSSwitchDataSource.h"
#import "FSSwitchPanel.h"
#import "NSTask.h"

@interface NSUserDefaults (Tweak_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"none";
static NSString *nsNotificationString = @"none/preferences.changed";

@interface opensshfswSwitch : NSObject <FSSwitchDataSource>
@end

@implementation opensshfswSwitch

- (NSString *)titleForSwitchIdentifier:(NSString *)switchIdentifier {
	return @"opensshfsw";
}

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier {
	NSNumber *n = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:nsDomainString];
	BOOL enabled = (n)? [n boolValue]:YES;
	return (enabled) ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyAlternateActionForSwitchIdentifier: (NSString *)switchIdentifier {
    return;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier {
    NSTask *task = [[NSTask alloc] init];
    
	switch (newState) {
	case FSSwitchStateIndeterminate:
            // Add stuff to check if the service is up and return
		break;
	case FSSwitchStateOn:
		[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"enabled" inDomain:nsDomainString];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
            
            [task setLaunchPath:@"/bin/bash"];
            [task setArguments:@[@"-c", @"/usr/sbin/sshd"]];
            [task launch];
            
		break;
	case FSSwitchStateOff:
		[[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:NO] forKey:@"enabled" inDomain:nsDomainString];
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)nsNotificationString, NULL, NULL, YES);
            
            [task setLaunchPath:@"/bin/bash"];
            [task setArguments:@[@"-c", @"/usr/bin/killall sshd"]];
            [task launch];
            
		break;
	}
	return;
}

@end
