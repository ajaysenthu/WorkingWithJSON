//
//  ViewController.m
//  WorkingWithJSON
//
//  Created by Ajay on 5/26/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import "ViewController.h"
#import "DataTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    self.URLRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://itunes.apple.com/ch/rss/topfreeapplications/limit=100/json?l=en"]];
    
    self.URLRequest.HTTPMethod = @"POST";
    
    self.dataTask = [self.URLSession dataTaskWithRequest:_URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        NSLog(@"Data received");
        
        
        _response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
        
          UINavigationController *nav = [self.storyboard instantiateViewControllerWithIdentifier:@"navigation"];
        
        

        
        DataTableViewController *dtTVC = (DataTableViewController*)nav.topViewController;
        
        
        
            dtTVC.textArray = [[NSMutableArray alloc]init];
            
            dtTVC.imageArray = [[NSMutableArray alloc]init];
        
        dtTVC.descriptionArray = [[NSMutableArray alloc]init];
        
            
            for(unsigned int i=0; i<[[[self.response objectForKey:@"feed"] objectForKey:@"entry"]count]; i++) {
                
                
                NSLog(@"response is %@", [[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"im:name"]objectForKey:@"label"]);
                
                
                [dtTVC.textArray addObject:[[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"im:name"]objectForKey:@"label"]];
                
                
                NSLog(@"response is %@",[[[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"im:image"]objectAtIndex:2] objectForKey:@"label"]);
                
                [dtTVC.imageArray addObject:[[[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"im:image"]objectAtIndex:2] objectForKey:@"label"]];
                
                
                NSLog(@"response is %@",[[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"summary"]objectForKey:@"label"]);
                
                [dtTVC.descriptionArray addObject:[[[[[self.response objectForKey:@"feed"]objectForKey:@"entry"]objectAtIndex:i]objectForKey:@"summary"]objectForKey:@"label"]];
            }
        
        
        

        

        [self presentViewController:nav animated:YES completion:nil];

        
        
        
        

      }];
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTapGetTopApps:(id)sender {
    
    
    [self.dataTask resume];
    
    
}
@end
