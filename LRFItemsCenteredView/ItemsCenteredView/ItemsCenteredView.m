//
//  ItemsCenteredView.m
//  LRFItemsCenteredView
//
//  Created by Luckyfy on 15/9/5.
//  Copyright (c) 2015年 LRF. All rights reserved.
//

#import "ItemsCenteredView.h"

@implementation ItemsCenteredView


- (void)setItems:(NSArray *)items withSpacing:(CGFloat)spacing {
    
    CGFloat width = 0;
    for (int i = 0; i<items.count; i++) {
        id item = [items objectAtIndex:i];
        
        if ([item isMemberOfClass:[NSString class]] || [item isKindOfClass:[NSString class]] ) {
            
            UILabel * label = nil;
            if ([self viewWithTag:i+100]) {
                label = (UILabel *)[self viewWithTag:i+100];
                [label setText:items[i]];
                [label sizeToFit];
            }
            else {
                label = [[UILabel alloc]initWithFrame:CGRectMake(0, (self.frame.size.height-14)/2, 0, self.frame.size.height)];
                [label setText:item];
                [label setFont:[UIFont systemFontOfSize:14]];
                [label setBackgroundColor:[UIColor clearColor]];
                [label setTag:i+100];
                [self addSubview:label];
                [label sizeToFit];
            }
            CGRect frame = label.frame;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
            [label setFrame:frame];
            
            
            width += label.frame.size.width;
        }
        else if ([item isKindOfClass:[UIImage class]]) {
            
            UIImageView * imageView = nil;
            if ([self viewWithTag:i+100]) {
                imageView = (UIImageView *)[self viewWithTag:i+100];
                [imageView setImage:item];
                [imageView sizeToFit];
            }
            else {
                imageView = [[UIImageView alloc]initWithImage:item];
                [imageView setTag:i+100];
                [self addSubview:imageView];
                [imageView sizeToFit];
            }
            CGRect frame = imageView.frame;
            frame.origin.y = (self.frame.size.height-frame.size.height)/2;
            [imageView setFrame:frame];
            
            width += imageView.frame.size.width;
        }
    }
    
    CGFloat originX = 0;
    originX = (self.frame.size.width - width - (items.count-1)*spacing)/2;
    for (int i=0 ; i < items.count; i++) {
        UIView * view = [self viewWithTag:i+100];
        CGRect frame = view.frame;
        frame.origin.x = originX;
        view.frame = frame;
        originX += frame.size.width+5;
    }
}

@end
