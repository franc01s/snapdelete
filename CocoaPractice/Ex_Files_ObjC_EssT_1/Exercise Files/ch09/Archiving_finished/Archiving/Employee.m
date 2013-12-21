#import "Employee.h"

@implementation Employee

@synthesize name, grade;

-(void) encodeWithCoder: (NSCoder *) coder {
    [coder encodeObject:name forKey:@"EMPname"];
    NSNumber *gradeBox = [NSNumber numberWithInt:grade];
    [coder encodeObject:gradeBox forKey:@"EMPgrade"];
}

-(id) initWithCoder:(NSCoder *) coder {
    name = [[coder decodeObjectForKey:@"EMPname"] retain];
    NSNumber *gradeBox = [coder decodeObjectForKey:@"EMPgrade"];
    grade = (int) [gradeBox integerValue];
    return self;
}

-(NSString *) description {
    NSString *desc = 
    [NSString stringWithFormat:@"Employee: %@, Grd: %i", name,grade]; 
    return desc;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [name release];
    [super dealloc];
}

@end
