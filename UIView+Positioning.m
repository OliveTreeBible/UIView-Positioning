//
//  UIView+Positioning.m
//  iPhoneReader
//
//  Created by Tom Hamming on 3/25/13.
//  Copyright (c) 2013 Olive Tree Bible Software. All rights reserved.
//

#import "UIView+Positioning.h"

@implementation UIView (Positioning)

const static CGFloat _scale = [UIScreen mainScreen].scale;

#pragma mark - Center absolutely

-(void)centerSubview:(UIView *)view
{
    CGFloat xOrigin = [self xOriginForCenteringSubview:view];
    CGFloat yOrigin = [self yOriginForCenteringSubview:view];
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

#pragma mark - Center subviews horizontally

-(void)centerSubviewHorizontally:(UIView *)view
{
    CGFloat xOrigin = [self xOriginForCenteringSubview:view];
    view.frame = CGRectMake(xOrigin, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewHorizontally:(UIView *)view pointsFromBottom:(CGFloat)points
{
    CGFloat xOrigin = [self xOriginForCenteringSubview:view];
    CGFloat yOrigin = self.frame.size.height - points - view.frame.size.height;
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewHorizontally:(UIView *)view pointsFromTop:(CGFloat)points
{
    CGFloat xOrigin = [self xOriginForCenteringSubview:view];
    view.frame = CGRectMake(xOrigin, points, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewHorizontally:(UIView *)view points:(CGFloat)points aboveSibling:(UIView *)sibling
{
    [self centerSubviewHorizontally:view pointsFromTop:sibling.frame.origin.y - view.frame.size.height - points];
}

-(void)centerSubviewHorizontally:(UIView *)view points:(CGFloat)points belowSibling:(UIView *)sibling
{
    [self centerSubviewHorizontally:view pointsFromTop:sibling.frame.origin.y + sibling.frame.size.height + points];
}

-(void)centerSubviewHorizontally:(UIView *)view betweenSibling:(UIView *)sib1 andSibling:(UIView *)sib2
{
    CGFloat bottom1 = sib1.frame.origin.y + sib1.frame.size.height;
    CGFloat bottom2 = sib2.frame.origin.y + sib2.frame.size.height;
    UIView *topView = (bottom1 < bottom2 ? sib1 : sib2);
    UIView *bottomView = (topView == sib1 ? sib2 : sib1);
    
    CGFloat top = topView.frame.origin.y + topView.frame.size.height;
    CGFloat bottom = bottomView.frame.origin.y;
    CGFloat space = (bottom - top - view.frame.size.height);
    [self centerSubviewHorizontally:view points:space / 2 belowSibling:topView];
}

#pragma mark - Center subviews vertically

-(void)centerSubviewVertically:(UIView *)view
{
    CGFloat yOrigin = [self yOriginForCenteringSubview:view];
    view.frame = CGRectMake(view.frame.origin.x, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewVertically:(UIView *)view pointsFromLeft:(CGFloat)points
{
    CGFloat yOrigin = [self yOriginForCenteringSubview:view];
    view.frame = CGRectMake(points, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewVertically:(UIView *)view pointsFromRight:(CGFloat)points
{
    CGFloat xOrigin = self.frame.size.width - view.frame.size.width - points;
    xOrigin = [self pinToPixel:xOrigin];
    CGFloat yOrigin = [self yOriginForCenteringSubview:view];
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSubviewVertically:(UIView *)view points:(CGFloat)points leftOfSibling:(UIView *)sibling
{
    [self centerSubviewVertically:view pointsFromLeft:sibling.frame.origin.x - view.frame.size.width - points];
}

-(void)centerSubviewVertically:(UIView *)view points:(CGFloat)points rightOfSibling:(UIView *)sibling
{
    [self centerSubviewVertically:view pointsFromLeft:sibling.frame.origin.x + sibling.frame.size.width + points];
}

#pragma mark - Center sibling views horizontally

-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view
{
    CGFloat xMid = self.frame.origin.x + (self.frame.size.width / 2.0f);
    CGFloat xOrigin = xMid - (view.frame.size.width / 2.0f);
    xOrigin = [self pinToPixel:xOrigin];
    
    view.frame = CGRectMake(xOrigin, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
}

-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view pointsAbove:(CGFloat)points
{
    CGFloat xMid = self.frame.origin.x + (self.frame.size.width / 2.0f);
    CGFloat xOrigin = xMid - (view.frame.size.width / 2.0f);
    CGFloat yOrigin = self.frame.origin.y - view.frame.size.height - points;
    
    xOrigin = [self pinToPixel:xOrigin];
    yOrigin = [self pinToPixel:yOrigin];
    
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view pointsBelow:(CGFloat)points
{
    CGFloat xMid = self.frame.origin.x + (self.frame.size.width / 2.0f);
    CGFloat xOrigin = xMid - (view.frame.size.width / 2.0f);
    CGFloat yOrigin = self.frame.origin.y + self.frame.size.height + points;
    
    xOrigin = [self pinToPixel:xOrigin];
    yOrigin = [self pinToPixel:yOrigin];
    
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

#pragma mark - Center sibling views vertically

-(void)centerSiblingViewVerticallyToSelf:(UIView *)view
{
    CGFloat yMid = self.frame.origin.y + (self.frame.size.height / 2.0f);
    CGFloat yOrigin = yMid - (view.frame.size.height / 2.0f);
    
    yOrigin = [self pinToPixel:yOrigin];
    
    view.frame = CGRectMake(view.frame.origin.x, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSiblingViewVerticallyToSelf:(UIView *)view pointsToLeft:(CGFloat)points
{
    CGFloat yMid = self.frame.origin.y + (self.frame.size.height / 2.0f);
    CGFloat yOrigin = yMid - (view.frame.size.height / 2.0f);
    CGFloat xOrigin = self.frame.origin.x - view.frame.size.width - points;
    
    yOrigin = [self pinToPixel:yOrigin];
    xOrigin = [self pinToPixel:xOrigin];
    
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)centerSiblingViewVerticallyToSelf:(UIView *)view pointsToRight:(CGFloat)points
{
    CGFloat yMid = self.frame.origin.y + (self.frame.size.height / 2.0f);
    CGFloat yOrigin = yMid - (view.frame.size.height / 2.0f);
    CGFloat xOrigin = self.frame.origin.x + self.frame.size.width + points;
    
    yOrigin = [self pinToPixel:yOrigin];
    xOrigin = [self pinToPixel:xOrigin];
    
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

#pragma mark - Placing in corners

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsFromBottom:(CGFloat)bottom
{
    CGFloat yOrigin = self.frame.size.height - view.frame.size.height - bottom;
    yOrigin = [self pinToPixel:yOrigin];
    view.frame = CGRectMake(left, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsFromTop:(CGFloat)top
{
    view.frame = CGRectMake(left, top, view.frame.size.width, view.frame.size.height);
}

-(void)placeSubview:(UIView *)view pointsFromRight:(CGFloat)right pointsFromBottom:(CGFloat)bottom
{
    CGFloat xOrigin = self.frame.size.width - view.frame.size.width - right;
    CGFloat yOrigin = self.frame.size.height - view.frame.size.height - bottom;
    xOrigin = [self pinToPixel:xOrigin];
    yOrigin = [self pinToPixel:yOrigin];
    view.frame = CGRectMake(xOrigin, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)placeSubview:(UIView *)view pointsFromRight:(CGFloat)right pointsFromTop:(CGFloat)top
{
    CGFloat xOrigin = self.frame.size.width - view.frame.size.width - right;
    xOrigin = [self pinToPixel:xOrigin];
    view.frame = CGRectMake(xOrigin, top, view.frame.size.width, view.frame.size.height);
}

#pragma mark - Placing relative to siblings

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsAbove:(CGFloat)above sibling:(UIView *)sibling
{
    CGFloat yOrigin = sibling.frame.origin.y - above - view.frame.size.height;
    yOrigin = [self pinToPixel:yOrigin];
    view.frame = CGRectMake(left, yOrigin, view.frame.size.width, view.frame.size.height);
}

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsBelow:(CGFloat)below sibling:(UIView *)sibling
{
    CGFloat yOrigin = sibling.frame.origin.y + sibling.frame.size.height + below;
    yOrigin = [self pinToPixel:yOrigin];
    view.frame = CGRectMake(left, yOrigin, view.frame.size.width, view.frame.size.height);
}

#pragma mark - Utilities

-(CGFloat)xOriginForCenteringSubview:(UIView *)view
{
    CGFloat result = (self.frame.size.width / 2.0f) - (view.frame.size.width / 2.0f);
    return [self pinToPixel:result];
}

-(CGFloat)yOriginForCenteringSubview:(UIView *)view
{
    CGFloat result = (self.frame.size.height / 2.0f) - (view.frame.size.height / 2.0f);
    return [self pinToPixel:result];
}

-(CGFloat)pinToPixel:(CGFloat)value
{
    if (_scale <= 1)
        return roundf(value);
    
    value *= _scale;
    value = roundf(value);
    value /= _scale;
    
    return value;
}

@end
