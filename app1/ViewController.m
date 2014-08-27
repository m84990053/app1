//
//  ViewController.m
//  app1
//
//  Created by Mirror on 14-7-24.
//  Copyright (c) 2014年 Music. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIButton *btn;
    UIButton *btn1;

    UIImageView *showImage;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(10, 80, 250, 30);
    btn.backgroundColor=[UIColor blackColor];
    [btn setTitle:@"获取剪贴板图片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame=CGRectMake(10, 150, 250, 30);
    btn1.backgroundColor=[UIColor blackColor];
    [btn1 setTitle:@"跳转到APP2" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(clickeded:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    showImage=[[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 300, 350)];
    [self.view addSubview:showImage];
//    
//    UIPasteboard* appPasteBoard = [UIPasteboard pasteboardWithName:@"OperationReportHD_image" create:YES];
//    self.view.backgroundColor=[UIColor colorWithPatternImage:appPasteBoard.image];
//    btn.backgroundColor=[UIColor colorWithPatternImage:appPasteBoard.image];
}


-(void)viewWillAppear:(BOOL)animated{
    //self.view.backgroundColor=[UIColor whiteColor];
}

-(void)clickeded:(id)sender{

     NSURL *url  = [NSURL URLWithString:@"myappcc://"];
    [[UIApplication sharedApplication] openURL:url];
}



-(void)clicked:(id)sender{
    
    //获取粘贴板的数据
    NSDate *today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter  alloc ]  init ];
    [formatter setDateFormat:@"yyyy-MM-dd HH"];
    NSString *todayTime = [formatter stringFromDate:today];
    
    
    //NSString *todaytimeccc=[NSString stringWithFormat:@"myapp%@",todayTime];
    //UIPasteboard *pb = [UIPasteboard pasteboardWithName:todaytimeccc create:YES];
    
    UIPasteboard *pb = [UIPasteboard pasteboardWithName:@"myapp" create:YES];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:[pb dataForPasteboardType:@"myType"]];
    UIImage *myImage=(UIImage*)[dict objectForKey:@"image"];
    showImage.image=myImage;
    
    
    
    
//    NSURL *url  = [NSURL URLWithString:@"myappcc://"];
//    [[UIApplication sharedApplication] openURL:url];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
