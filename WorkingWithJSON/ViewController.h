//
//  ViewController.h
//  WorkingWithJSON
//
//  Created by Ajay on 5/26/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property NSURLSession *URLSession;

@property NSMutableURLRequest *URLRequest;

@property NSURLSessionDataTask *dataTask;

@property NSDictionary *response;



- (IBAction)onTapGetTopApps:(id)sender;


@end

