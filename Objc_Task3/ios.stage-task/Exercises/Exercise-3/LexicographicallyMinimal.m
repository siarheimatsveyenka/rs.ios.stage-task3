#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    
    while (string1.length > 0 || string2.length > 0) {
        if (string1.length == 0) {
            [result appendString: string2];
            break;
        }
        else if (string2.length == 0) {
            [result appendString: string1];
            break;
        }
        
        NSString *firstCharOfString1 = [string1 substringWithRange: NSMakeRange(0, 1)];
        NSString *firstCharOfString2 = [string2 substringWithRange: NSMakeRange(0, 1)];
        NSComparisonResult comparingResult = [firstCharOfString1 compare: firstCharOfString2];
        
        switch (comparingResult) {
            case NSOrderedAscending:
            case NSOrderedSame:
                [result appendString: firstCharOfString1];
                string1 = [string1 substringFromIndex: 1];
                break;
            case NSOrderedDescending:
                [result appendString: firstCharOfString2];
                string2 = [string2 substringFromIndex: 1];
                break;
        }
    }
    return result;
}

@end
