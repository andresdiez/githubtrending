//
//  Model.h
//  GitHubTrending
//
//  Created by Andres Diez on 2016-08-15.
//  Copyright © 2016 Andres Diez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject


@property BOOL isLoaded;

//-(int) isLoaded;
-(void) loadModel:(void(^)())callBack;
-(NSString*) row:(NSInteger) index;
-(NSDictionary*) detail:(NSInteger)index;
-(NSUInteger) getLength;

@end
