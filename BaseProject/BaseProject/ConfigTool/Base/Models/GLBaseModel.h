/*!
 *	producted by oc_json_plugin.py
 *	auth: w6
*/
#import <Foundation/Foundation.h>


@interface GLBaseModel : NSObject

@property (nonnull, nonatomic, strong) NSArray *feed;

@property (nonnull, nonatomic, strong) NSArray *answer;

@property (nonnull, nonatomic, strong) NSArray *recommend;

@property (nonnull, nonatomic, strong) NSDictionary *data;

@property (nonnull, nonatomic, copy) NSString *code;

@property (nonnull, nonatomic, strong) NSArray *list;

@property (nonnull, nonatomic, copy) NSString *msg;

@end
