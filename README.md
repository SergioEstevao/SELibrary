SELibrary
==================

SELibrary is a collection of utility methods and category extensions that I'm standardizing on. This should evolve into a toolset of well-documented and -tested code to accelerate future developments.
 
At a Glance
-----------
Contained are several category methods

 - NSString+SEAdditions - various utility methods for strings
 - NSDate+SEAdditions  - various utility methods for dates
 - UIImage+SEAdditions  - various utility methods for images
 - UIColor+SEAdditions - various utility methods for colors
 - NSThread+SEAdditions - various utility methods to provide block execution funcionality
 - NSException+SEAdditions - various utility methods for exceptions

Other classes simplify common tasks

 - SELogging - common logging and assert macros that are enable/disable in DEBUG/RELEASE builds
 - SEAppDelegate - app delegate implementation using a "service" approach.
 - SETableViewCell - comon code to loading tableviewcell from nib files.
 - SEBorderView - a view that allows to define a border. 

Documentation
-------------

Documentation is being generated using the AppleDoc tool. If you build the Documentation target it will automatic added the information to your XCode documentation library. 

Usage
-----

The SELibrary.framework is using the "Fake Framework" template put together by [Karl Stenerud](https://github.com/kstenerud/iOS-Universal-Framework). If your app does not use ARC yet (but SELibrary does) then you also need the -fobjc-arc linker flag.

1. Include the SELibrary in your project.
2. Import the SELibrary in your PCH file or include the individual header files where needed.
3. Add -ObjC to "Other Linker Flags".
4. In your application target's Build Phases: Link Binary With Libraries phase add the following:
   - CoreGraphics.framework
   - ImageIO.framework
   - QuartzCore.framework
   - SystemConfiguration.framework
