//
//  ViewController.m
//  CarthageDemo
//
//  Created by Vipan Kumar on 5/2/17.
//  Copyright © 2017 Vipan Kumar. All rights reserved.
//

#import "ViewController.h"
typedef void (^successBlock)(NSURLSessionTask *task, id responseObject);
typedef void (^failureBlock )(NSURLSessionTask *task, NSError *error);


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self postDataForUrl:nil parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
    } failure:^(NSURLSessionTask *task, NSError *error) {
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)postDataForUrl:(NSString *)URLString
           parameters:(NSDictionary *)parameters
              success:(successBlock)success
              failure:(failureBlock)failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://web.esferasoft.biz/fetch_countries" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        success(task,responseObject);
    } failure:^(NSURLSessionTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
        failure(task,error);
    }];
}

@end
