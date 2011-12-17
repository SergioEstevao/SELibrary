#import "SEWebViewBridge.h"

@interface SEWebViewBridge()
-(void)executeFunctions;
@end

@implementation SEWebViewBridge

@synthesize delegate;

- (id) initWithWebView:(UIWebView*) aWebView
{
    self = [super init];
    if (self != nil) {
        webView = [aWebView retain];
        webView.delegate = self;
        handlers = [[NSMutableDictionary dictionaryWithCapacity:10] retain];
    }
    return self;
}

- (void) dealloc 
{
    [webView release];
    [handlers release];
    [super dealloc];  
}

#pragma mark UIWebView delegate methods

- (void)webViewDidStartLoad:(UIWebView *)aWebView
{	
	if ( [[delegate class ] instancesRespondToSelector:@selector(webViewDidStartLoad:)]){
        [delegate webViewDidStartLoad:aWebView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView
{
	if ( [[delegate class ] instancesRespondToSelector:@selector(webViewDidFinishLoad:)]){
        [delegate webViewDidFinishLoad:aWebView];
    }
	
}

- (void)webView:(UIWebView *)aWebView didFailLoadWithError:(NSError *)error
{
	if ( [[delegate class ] instancesRespondToSelector:@selector(webView:didFailLoadWithError:)]){
        [delegate webView:aWebView didFailLoadWithError:error];
    }
		
}

- (BOOL)webView:(UIWebView *)webViewSender shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	NSURL * url = [request URL];
    NSString * absoluteString = [url absoluteString];
    NSString * schema = [url scheme];
	
    NSLog(@"URL 2: %@",absoluteString);
	[self executeFunctions];
	
    if ( [schema isEqual:@"function"]) {
		return NO;
	}  else {
        if ( [[delegate class ] instancesRespondToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]){
            return [delegate webView:webViewSender shouldStartLoadWithRequest:request navigationType:navigationType];
        } else {
            return YES;       
        }    
    }
    
    
}

- (void)executeFunctions{
	NSString * currentMethod = [webView stringByEvaluatingJavaScriptFromString:@"WebViewBridge.getNextFunction();"]; 
	while (![currentMethod isEqual:@""]) {
		NSURL * url = [NSURL URLWithString:currentMethod];
		
		if (url != nil){
			NSString * command = [url host];
            
			NSString * callback = [[url path] stringByReplacingOccurrencesOfString:@"/" withString:@""];
            
            NSString * query = [url query];
            
            id obj = [handlers objectForKey:command];
            if (obj != nil){            
              NSString* fullMethodName = [[NSString alloc] initWithFormat:@"%@:", command];
              if ([obj respondsToSelector:NSSelectorFromString(fullMethodName)]) {
                  NSArray * parameters = [query componentsSeparatedByString:@"&"];
                  NSMutableDictionary * arguments= [[NSMutableDictionary alloc] initWithCapacity:[parameters count]];
                  for (NSString* parameter in parameters) {
                      NSArray * pair=[parameter componentsSeparatedByString:@"="];
                      [arguments setObject:[[pair objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                                    forKey:[[pair objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
                  }
                  NSString * value = [obj performSelector:NSSelectorFromString(fullMethodName) withObject:arguments];
                  
                if (![callback isEqual:@""]){
                    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"%@('%@');", callback, value]];       
                }  
              }
              else {
                // There's no method to call, so throw an error.
                NSLog(@"Class method '%@' not defined in class '%@'", fullMethodName, [obj class]);
              }
                [fullMethodName release];
            } else {
                NSLog(@"Handler not defined for function '%@'", command);
            }
			
			
		}
		currentMethod = [webView stringByEvaluatingJavaScriptFromString:@"WebViewBridge.getNextFunction();"];
	}
}

- (void)addHandler:(id)handler toFunction:(NSString*) function{
    [handlers setObject:handler forKey:function];    
}

@end

