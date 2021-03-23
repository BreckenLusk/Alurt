#import <Preferences/Preferences.h>

@interface AlurtPrefsListController: PSListController {
}
@end

@implementation AlurtPrefsListController

-(id) readPreferenceValue:(PSSpecifier *)specifier {
	// if ([self karenPrefsShouldBypassCfprefsd]) {
		NSDictionary *karenPrefsPlist = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", [specifier.properties objectForKey:@"defaults"]]];
		if (![karenPrefsPlist objectForKey:[specifier.properties objectForKey:@"key"]]) {
			return [specifier.properties objectForKey:@"default"];
		}
		return [karenPrefsPlist objectForKey:[specifier.properties objectForKey:@"key"]];
}

-(void) setPreferenceValue:(id)value specifier:(PSSpecifier *)specifier {
	NSMutableDictionary *karenPrefsPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", [specifier.properties objectForKey:@"defaults"]]];
	[karenPrefsPlist setObject:value forKey:[specifier.properties objectForKey:@"key"]];
	[karenPrefsPlist writeToFile:[NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", [specifier.properties objectForKey:@"defaults"]] atomically:1];
	if ([specifier.properties objectForKey:@"PostNotification"]) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)[specifier.properties objectForKey:@"PostNotification"], NULL, NULL, YES);
	}
	[super setPreferenceValue:value specifier:specifier];
}
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"AlurtPrefs" target:self] retain];
	}
	return _specifiers;
}
- (void)donate {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.paypal.me/BreckenLusk"]];
}
- (void)contact {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:breckenpl10@outlook.com?subject=Alurt!"]];
}
- (void)follow {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.twitter.com/BreckenLusk"]];
}
- (void)github {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/BreckenLusk/Alurt"]];
}
- (void)lockscreenNotification {
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.breckenlusk.alurt/ls"), nil, nil, true);
}
- (void)normalNotification {
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.breckenlusk.alurt/nc"), nil, nil, true);
}
-(void)save {
  [self.view endEditing:YES];
}
@end

// vim:ft=objc
