//
//  main.m
//  SwitchKeyboardLayout
//
//  Created by Maxim Dobryakov on 1/21/15.
//  Copyright (c) 2015 Maxim Dobryakov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL enable = TRUE;
        NSString *sourceId = nil;
        
        for (int i = 1; i < argc; i++) {
            NSString *arg = [NSString stringWithUTF8String:argv[i]];
            
            if (i == 1) {
                enable = [arg isEqualToString:@"enable"];
            }
            
            if (i == 2) {
                sourceId = arg;
            }
        }
        
        NSLog(@"Enable: %d", enable);
        NSLog(@"SourceId: %@", sourceId);
        
        CFArrayRef sourceList = TISCreateInputSourceList(NULL, true);
        for (int i = 0; i < CFArrayGetCount(sourceList); i++) {
            TISInputSourceRef inputSource = (TISInputSourceRef)(CFArrayGetValueAtIndex(sourceList, i));
            NSString *currentSourceId = (__bridge NSString *)(TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID));
            
            if ([currentSourceId isEqualToString:sourceId]) {
                OSStatus status = enable ? TISEnableInputSource(inputSource) : TISDisableInputSource(inputSource);
                NSLog(@"Result: %@", status == noErr ? @"Success" : @"Error");
                break;
            }
        }
        CFRelease(sourceList);
    }
    return 0;
}
