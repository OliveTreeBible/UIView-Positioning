//
//  UIView+Positioning.h
//  iPhoneReader
//
//  Created by Tom Hamming on 3/25/13.
//  Copyright (c) 2013 Olive Tree Bible Software. All rights reserved.
//

#pragma once

#import <UIKit/UIKit.h>

@interface UIView (Positioning)

-(void)centerSubview:(UIView *)view;

-(void)centerSubviewHorizontally:(UIView *)view;
-(void)centerSubviewHorizontally:(UIView *)view pointsFromTop:(CGFloat)points;
-(void)centerSubviewHorizontally:(UIView *)view pointsFromBottom:(CGFloat)points;
-(void)centerSubviewHorizontally:(UIView *)view points:(CGFloat)points aboveSibling:(UIView *)sibling;
-(void)centerSubviewHorizontally:(UIView *)view points:(CGFloat)points belowSibling:(UIView *)sibling;
-(void)centerSubviewHorizontally:(UIView *)view betweenSibling:(UIView *)sib1 andSibling:(UIView *)sib2;

-(void)centerSubviewVertically:(UIView *)view;
-(void)centerSubviewVertically:(UIView *)view pointsFromLeft:(CGFloat)points;
-(void)centerSubviewVertically:(UIView *)view pointsFromRight:(CGFloat)points;
-(void)centerSubviewVertically:(UIView *)view points:(CGFloat)points leftOfSibling:(UIView *)sibling;
-(void)centerSubviewVertically:(UIView *)view points:(CGFloat)points rightOfSibling:(UIView *)sibling;

-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view;
-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view pointsAbove:(CGFloat)points;
-(void)centerSiblingViewHorizontallyToSelf:(UIView *)view pointsBelow:(CGFloat)points;

-(void)centerSiblingViewVerticallyToSelf:(UIView *)view;
-(void)centerSiblingViewVerticallyToSelf:(UIView *)view pointsToLeft:(CGFloat)points;
-(void)centerSiblingViewVerticallyToSelf:(UIView *)view pointsToRight:(CGFloat)points;

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsFromTop:(CGFloat)top;
-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsFromBottom:(CGFloat)bottom;
-(void)placeSubview:(UIView *)view pointsFromRight:(CGFloat)right pointsFromTop:(CGFloat)top;
-(void)placeSubview:(UIView *)view pointsFromRight:(CGFloat)right pointsFromBottom:(CGFloat)bottom;

-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsAbove:(CGFloat)above sibling:(UIView *)sibling;
-(void)placeSubview:(UIView *)view pointsFromLeft:(CGFloat)left pointsBelow:(CGFloat)below sibling:(UIView *)sibling;

-(CGFloat)xOriginForCenteringSubview:(UIView *)view;
-(CGFloat)yOriginForCenteringSubview:(UIView *)view;

@end
