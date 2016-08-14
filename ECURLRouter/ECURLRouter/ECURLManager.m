//
//  ECURLManager.m
//  ECURLRouter
//
//  Created by kiri on 16/8/15.
//
//

#import "ECURLManager.h"
#import "ECURLLog.h"

@interface ECURLManager ()

@property (nonatomic, strong) NSDictionary *handlers;

@end

@implementation ECURLManager

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = self.new;
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadConfigruation];
    }
    return self;
}

- (void)loadConfigruation
{
    NSString *fileName = [NSBundle mainBundle].infoDictionary[@"ECURLConfiguration"] ?: @"ECURLConfiguration.plist";
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:fileName withExtension:@""];
    if (!fileURL) {
        ECLogError(@"Can't find configuration file: %@", fileName);
        return;
    }
}

@end
