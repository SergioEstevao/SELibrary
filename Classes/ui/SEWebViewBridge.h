#import <UIKit/UIKit.h>

/*!
    @class SEWebViewBridge 
    @abstract class that allows javascript methods to invoke cocoa funcionality
 */
@interface SEWebViewBridge : NSObject <UIWebViewDelegate>
{
	UIWebView	*webView;
    id<UIWebViewDelegate> delegate;
    NSMutableDictionary * handlers;
}

-initWithWebView:(UIWebView*) aWebView;
-(void) addHandler:(id)handler toFunction:(NSString*)function;

@property(nonatomic, assign) id<UIWebViewDelegate> delegate;

@end

