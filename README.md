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

Other classes simplify common tasks

 - SELogging - common logging and assert macros that are enable/disable in DEBUG/RELEASE builds
 - SEAppDelegate - app delegate implementation using a "service" approach.

Documentation
-------------

Documentation is being generated using the AppleDoc tool. If you build the Documentation target it will automatic added the information to your XCode documentation library. 