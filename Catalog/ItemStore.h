
#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;
@property (nonatomic,copy)NSString *blah;
@property (nonatomic)BOOL flag;
@property (nonatomic) char *sqlstmt;
@property NSInteger count;
@property (nonatomic)BOOL alernFlag;
@property (strong, nonatomic) NSMutableArray* reports;



// Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;
-(void)removeItem:(Item *)item;
-(void)setBlah:(NSString *)blah;
-(BOOL)getFlag;
-(void)setFlag:(BOOL)flag;
-(void)setCount;
-(NSInteger)getCount;
-(void)setSqlstmt:(char *)sqlstmt;
-(char *)getSqlstmt;



@end
