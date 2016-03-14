//
//  main.m
//  TextSearch
//
//  Created by 黎朕宇 on 16/3/14.
//  Copyright © 2016年 黎朕宇. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString *searchString = @"WeicoCamp-dummy.m";
static NSString *path = @"/Users/sl2577/Desktop/weico3Git";

void textSearchWithPath(NSString *path) {
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory = 0;
    if ([mgr fileExistsAtPath:path isDirectory:&isDirectory]) {
        if (isDirectory) {
            //            NSLog(@"%@", path);
            NSArray *pathArr = [mgr contentsOfDirectoryAtPath:path error:nil];
            for (NSString *pathM in pathArr) {
                textSearchWithPath([path stringByAppendingPathComponent:pathM]);
            }
        } else {
            NSData *data = [NSData dataWithContentsOfFile:path];
            NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if ([text containsString:searchString]) {
                NSLog(@"exsitWord at path: %@", path);
            }
        }
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        textSearchWithPath(path);
        
    }
    return 0;
}
