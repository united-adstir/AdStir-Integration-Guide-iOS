//
//  ViewController.m
//
//  Copyright (c) 2015 UNITED, Inc. All rights reserved.
//

#import "WebViewIntegrationViewController.h"

@interface WebViewIntegrationViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewIntegrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://ja.ad-stir.com/"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.webView.delegate = nil;
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *url = request.URL;
    NSString *host = url.host;
    
    // 自サイトのドメイン以外の場合はSafariに飛ばすため、openURLし、falseを返す
    // Open URL with Safari if unknown host name.
    if (navigationType == UIWebViewNavigationTypeLinkClicked && ![host isEqualToString:@"ja.ad-stir.com"]) {
        [[UIApplication sharedApplication] openURL:url];
        return NO;
    }
    
    return YES;
}

@end
