s3eIOSController
================

Controller support for iOS using the Game Controller framework

Controllers must support either basic or micro profiles. Controllers can also
support extended profiles alongside basic ones. Check for support with
s3eIOSControllerSupportsBasic etc.

Basic controllers have a D-pad, A B X Y buttons, pause button and L R shoulder
buttons.

Extended controllers add the following to basic ones: L and R trigger buttons,
left and right thumb sticks. The sticks can generate values from -1 to 1 on
each axis. The trigger buttons can also generate "axis" values from 0 to 1
depending on how far they are pressed.

Apple TV / tvOS
---------------

Marmalade doesn't publicly support tvOS but will soon. Currently tvOS stuff is
defined out/in in code for *building* the extension with standard Apple define
TARGET_OS_TV. There are separate libs for iOS vs tvOS. In order to use (not build) for
tvOS, you currently would need to define MARMALADE_TVOS in your MKB, before including this
extension. By default, the extension will just support iOS.

tvOS support has been tested by me and it works nicely :)

New tvOS remotes are a type of micro controller. Micro controllers have A and
X buttons, and a direction pad of some sort. A is pushing the touch pad down,
X is the play/pause button. The menu button is not supported yet (this requires some
loader changes related to view controller) Menu has a specific use case (pause game, then
acts as back button in menus) and so may be exposed differently to normal buttons.

Note that there is no controller event for when a finger is placed on/off the touch pad
(as opposed to pushing it in till it clicks). You can get this info from s3ePointer,
which registers touch/release events on the pad.

IwGameController, which wraps this extension adds a key for touch events, which uses
s3ePointer internally. It's recommended to use IwGameController as its cross platform too!
