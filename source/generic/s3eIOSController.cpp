/*
Generic implementation of the s3eIOSController extension.
This file should perform any platform-indepedentent functionality
(e.g. error checking) before calling platform-dependent implementations.
*/

/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */


#include "s3eIOSController_internal.h"
s3eResult s3eIOSControllerInit()
{
    //Add any generic initialisation code here
    return s3eIOSControllerInit_platform();
}

void s3eIOSControllerTerminate()
{
    //Add any generic termination code here
    s3eIOSControllerTerminate_platform();
}

uint32 s3eIOSControllerGetControllerCount()
{
	return s3eIOSControllerGetControllerCount_platform();
}

s3eIOSController* s3eIOSControllerGetController(uint32 index)
{
	return s3eIOSControllerGetController_platform(index);
}

s3eBool s3eIOSControllerSupportsBasic(s3eIOSController* controller)
{
	return s3eIOSControllerSupportsBasic_platform(controller);
}

s3eBool s3eIOSControllerSupportsExtended(s3eIOSController* controller)
{
	return s3eIOSControllerSupportsExtended_platform(controller);
}

s3eBool s3eIOSControllerSupportsMicro(s3eIOSController* controller)
{
	return s3eIOSControllerSupportsMicro_platform(controller);
}

s3eBool s3eIOSControllerGetReportsAbsoluteDpadValues(s3eIOSController* controller)
{
	return s3eIOSControllerGetReportsAbsoluteDpadValues_platform(controller);
}

void s3eIOSControllerSetReportsAbsoluteDpadValues(s3eIOSController* controller, s3eBool value)
{
	s3eIOSControllerSetReportsAbsoluteDpadValues_platform(controller, value);
}

s3eBool s3eIOSControllerGetAllowsRotation(s3eIOSController* controller)
{
	return s3eIOSControllerGetAllowsRotation_platform(controller);
}

void s3eIOSControllerSetAllowsRotation(s3eIOSController* controller, s3eBool value)
{
	s3eIOSControllerSetAllowsRotation_platform(controller, value);
}

int32 s3eIOSControllerGetPlayerIndex(s3eIOSController* controller)
{
	return s3eIOSControllerGetPlayerIndex_platform(controller);
}

void s3eIOSControllerSetPlayerIndex(s3eIOSController* controller, int32 index)
{
	s3eIOSControllerSetPlayerIndex_platform(controller, index);
}

s3eBool s3eIOSControllerGetButtonState(s3eIOSController* controller, s3eIOSControllerButton button)
{
	return s3eIOSControllerGetButtonState_platform(controller, button);
}

float s3eIOSControllerGetAxisValue(s3eIOSController* controller, s3eIOSControllerAxis axis)
{
	return s3eIOSControllerGetAxisValue_platform(controller, axis);
}
