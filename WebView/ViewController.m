//
//  ViewController.m
//  WebView
//
//  Created by Apple on 15/7/18.
//  Copyright (c) 2015年 深圳侨报文化传播有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, UIScrollViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://news.163.com/special/qingsongyike"]];
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView"
                                             withExtension: @"htm"];
    
    [_webview loadRequest: [NSURLRequest requestWithURL: htmlURL]];
    _webview.delegate = self;
    //_webview.scrollView.delegate = self;
    //_webview.opaque = NO;
    [self.view addSubview: _webview];
    //[_webview loadRequest:request];
//    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
//    //doubleTap.numberOfTouchesRequired = 2;
//    doubleTap.delegate=self;
//    doubleTap.cancelsTouchesInView=YES;
//    [_webview addGestureRecognizer:doubleTap];
   
}
//#pragma mark- TapGestureRecognizer
//
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
//{
//    return YES;
//}
//-(void) doubleTap:(UITapGestureRecognizer*) sender
//{
//    //NSLog(@"image url");
//    int scrollPositionY = [[self.webview stringByEvaluatingJavaScriptFromString:@"window.pageYOffset"] intValue];
//    int scrollPositionX = [[self.webview stringByEvaluatingJavaScriptFromString:@"window.pageXOffset"] intValue];
//    
//    int displayWidth = [[self.webview stringByEvaluatingJavaScriptFromString:@"window.outerWidth"] intValue];
//    CGFloat scale = _webview.frame.size.width / displayWidth;
//    
//    CGPoint pt = [sender locationInView:self.webview];
//    pt.x *= scale;
//    pt.y *= scale;
//    pt.x += scrollPositionX;
//    pt.y += scrollPositionY;
//    
////    NSString *js = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).tagName", pt.x, pt.y];
////    NSString * tagName = [self.webview stringByEvaluatingJavaScriptFromString:js];
////    if ([tagName isEqualToString:@"IMG"]) {
//        NSString *imgURL = [NSString stringWithFormat:@"document.elementFromPoint(%f, %f).src", pt.x, pt.y];
//        NSString *urlToSave = [self.webview stringByEvaluatingJavaScriptFromString:imgURL];
//        NSLog(@"image url urlToSave=%@", urlToSave);
//    //}
////    NSLog(@"image url=%@", tagName);
//}
#pragma mark - 浏览器链接处理

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.absoluteString hasPrefix:@"file"]) {return YES;}
//
//    //    [Utils analysis:[request.URL absoluteString] andNavController:self.navigationController];
//    ImageViewerController *imageViewerVC = [[ImageViewerController alloc] initWithImageURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [request.URL absoluteString]]]];
//    
//    [self.navigationController presentViewController:imageViewerVC animated:YES completion:nil];
    
    NSLog(@"Url=%@",[request.URL absoluteString]);
    return [request.URL.absoluteString isEqualToString:@"about:blank"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
