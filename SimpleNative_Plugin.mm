#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

// ---------------------------------------------------
@interface SimpleNative_Plugin: NSObject {
    // Class member vars here
    int mInt;
}
@end

// ---------------------------------------------------
@implementation SimpleNative_Plugin

// Init
- (id) init {
    if (self = [super init]) {
        mInt = 1;
    }
    return self;
}

// Int test
-(int) getInt {
    return mInt;
}

-(void) setInt:(int)value {
    mInt = value;
}

@end
// ---------------------------------------------------




// ---------------------------------------------------
// ---------------------------------------------------
// ---------------------------------------------------
extern "C" {
    // Make static Instance
    static SimpleNative_Plugin *plugin =[[SimpleNative_Plugin alloc] init];
    

    int getInt_OBJC() {
        NSLog(@"You call getInt_OBJC! Plugin return %d", [plugin getInt]);
        return [plugin getInt];
    }

    void setInt_OBJC(int value) {
        NSLog(@"You call setInt_OBJC! Plugin set val %d to %d", [plugin getInt], value);
        [plugin setInt: value];
    }
}
