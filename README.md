# UIView-Positioning
A category on UIView for when Auto Layout isn't quite right.

Auto Layout is the recommended way to do view layout on iOS. But there are times when it doesn't fit what you want to do. This is a handy category to abstract away all the pixel math involved in positioning views as desired.

All methods use the frame of the passed view to calculate position. Method names should be self-explanatory. `centerSubview...` or `placeSubview...` acts on a view assumed to be a subview of the view you're calling the method on.  `centerSiblingView...` acts on a view assumed to be a sibling (has the same superview) of the view you're calling the method on. And all methods pin to physical pixels on all devices.
