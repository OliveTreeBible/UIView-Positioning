# UIView-Positioning

Auto Layout is the recommended way to do view layout on iOS. But there are times when it doesn't fit what you want to do. This is a handy category to abstract away all the pixel math involved in positioning views as desired.

All methods use the frame of the passed view to calculate position. Method names should be self-explanatory. `centerSubview...` or `placeSubview...` acts on a view assumed to be a subview of the view you're calling the method on.  `centerSiblingView...` acts on a view assumed to be a sibling (has the same superview) of the view you're calling the method on. And all methods pin to physical pixels on all devices.

This does not explicitly interact with Auto Layout. It simply calls `setFrame`. If you're having issues with views not going where you expect them and Auto Layout is involved, you should take a look at the [WWDC 2015](https://developer.apple.com/videos/wwdc/2015/) sessions "Mysteries of Auto Layout" [Part 1 (session 218)](https://developer.apple.com/videos/wwdc/2015/?id=218) and [Part 2 (session 219)](https://developer.apple.com/videos/wwdc/2015/?id=219).
