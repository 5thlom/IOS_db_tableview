
#import "ItemStore.h"
#import "Product.h"

@interface ItemStore ()
//assume this is private array. - zhy
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+ (instancetype)sharedStore
{
    static ItemStore *sharedStore;

    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    [sharedStore setCount];
    return sharedStore;
}

// If a programmer calls [[ItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[ItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
        self.blah = @"this is a blah";
        self.flag = false;
        self.count = 0;
        self.sqlstmt =  "";//"select * from lang where name = \"c++\"";
        self.alernFlag = false;
        self.reports = [[NSMutableArray alloc]init];
        
        NSMutableArray *a = [[NSMutableArray alloc]init];
        Product * p = [[Product alloc]init];
        p.name = @"NULL";
        [a addObject:p];
        
        [self.reports addObject:a];

    }
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

-(char *)getSqlstmt{
    return self.sqlstmt;
}

-(void)setSqlstmt:(char *)sqlstmt{
    _sqlstmt = sqlstmt;
}

-(void)removeItem:(Item *)item{
    [self.privateItems removeObjectIdenticalTo:item];
}

-(void)setBlah:(NSString *)blah{
    _blah = blah;
}
-(NSString*)description{
    return self.blah;
}

-(void)setFlag:(BOOL)flag{
    _flag = flag;
}

-(BOOL)getFlag{
    return self.flag;
}

-(void)setCount{
    _count +=10;
}

-(NSInteger)getCount{
    return self.count;
}

@end
