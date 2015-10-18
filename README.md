s3eIOSController
================

Controller support for iOS using the Game Controller framework

Controllers must support either basic or micro profiles. Controllers can also
support extended profiles alongside basic ones. Check for support with
s3eIOSControllerSupportsBasic etc.

New tvOS remotes are a type of micro controllers. Micro controllers have A and
X buttons, pause button and a direction pad of some sort.

Basic controllers have a D-pad, A B X Y buttons, pause button and L R shoulder
buttons.

Extended controllers add the following to basic ones: L and R trigger buttons,
left and right thumb sticks. The sticks can generate values from -1 to 1 on
each axis. The trigger buttons can also generate "axis" values from 0 to 1
depending on how far they are pressed.

Marmalade doesn't publicly support tvOS but will soon. Currently tvOS stuff is
defined out/in with standard Apple define TARGET_OS_TV. You'll likley need to
build separate extension libs for iOS vs tvOS... watch this space!