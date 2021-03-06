//
//  HDKAFJSONRequestOperation.m
//  HuddleKit
//
//  Copyright (c) 2014 Huddle. All rights reserved.
//

#import "HDKAFJSONRequestOperation.h"

@implementation HDKAFJSONRequestOperation

- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response {
    if (response) {
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:request.URL];
        [urlRequest setValue:[self.request valueForHTTPHeaderField:@"Authorization"] forHTTPHeaderField:@"Authorization"];
        for (NSString *header in [[request allHTTPHeaderFields] keyEnumerator]) {
            [urlRequest setValue:[request valueForHTTPHeaderField:header] forHTTPHeaderField:header];
        }

        return urlRequest;
    } else {
        return request;
    }
}

+ (NSSet *)acceptableContentTypes {
    return [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"application/vnd.huddle.data.v2+json", nil];
}

@end
