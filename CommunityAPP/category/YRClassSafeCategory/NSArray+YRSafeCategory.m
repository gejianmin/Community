//
//  NSArray+YRSafeCategory.m
//  YRSnippets
//
//  Created by 王晓宇 on 13-7-12.
//  Copyright (c) 2013年 王晓宇. All rights reserved.
//

#import "NSArray+YRSafeCategory.h"

@implementation NSArray (YRSafeCategory)
+(id)arrayWithObjectSafe:(id)anObject{
    if (!anObject) {
        DLog(@"NSArray arrayWithObjectSafe add nil into array");
        return nil;
    }
    return [self arrayWithObject:anObject];
}

-(id)objectAtIndexSafe:(NSUInteger)uindex{
    NSInteger index=uindex;
    if (index<0||index>=self.count) {
        DLog(@"NSArray objectAtIndexSafe out of bounds for array , %ld out of (0,%lu),array=%@",(long)index,(unsigned long)self.count,self);
        return nil;
    }
    return [self objectAtIndex:index];
}
-(NSArray *)arrayByAddingObjectSafe:(id)anObject{
    if (!anObject) {
        DLog(@"NSArray arrayByAddingObjectSafe add nil into array,array=%@",self);
        return [self copy];
    }
    return [self arrayByAddingObject:anObject];
}
@end


@implementation NSMutableArray (YRSafeCategory)
-(void)addObjectSafe:(id)anObject{
    if (!anObject) {
        DLog(@"NSMutableArray addObjectSafe add nil into array,array=%@",self);
        return;
    }
    [self addObject:anObject];
}
-(void)insertObjectSafe:(id)anObject atIndex:(NSUInteger)index{
    if (!anObject) {
        DLog(@"NSMutableArray insertObjectSafe insert nil into array,array=%@",self);
        return;
    }
    if (index>=self.count) {
        DLog(@"NSMutableArray insertObjectSafe insert index out of bounds , do addObject,array=%@",self);
        [self addObjectSafe:anObject];
        return;
    }
    [self insertObject:anObject atIndex:index];
}
-(void)replaceObjectAtIndexSafe:(NSUInteger)uindex withObject:(id)anObject{
    if (!anObject) {
        DLog(@"NSMutableArray replaceObjectAtIndexSafe relpace nil into array,array=%@",self);
        return;
    }
    NSInteger index=uindex;
    if (index<0||index>=self.count) {
        DLog(@"NSMutableArray replaceObjectAtIndexSafe relpace index out of bounds,%ld out of %lu,array=%@",(long)index,(unsigned long)self.count,self);
        return;
    }
    [self replaceObjectAtIndex:index withObject:anObject];
}
-(void)removeObjectAtIndexSafe:(NSUInteger)uindex{
    NSInteger index=uindex;
    if (index<0||index>=self.count) {
        DLog(@"NSMutableArray removeObjectAtIndexSafe index out of bounds ,%lu out of %lu,array=%@",(long)index,(unsigned long)self.count,self);
        return;
    }
    [self removeObjectAtIndex:index];
}
@end
