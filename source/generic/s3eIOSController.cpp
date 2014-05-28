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

uint32 s3eIOSController_getControllerCount()
{
	return s3eIOSController_getControllerCount_platform();
}

s3eIOSController* s3eIOSController_getController(uint32 index)
{
	return s3eIOSController_getController_platform(index);
}

s3eResult s3eIOSControllerRegister(s3eIOSControllerCallback callbackID, s3eCallback callbackFn, void* userData)
{
	return s3eIOSControllerRegister_platform(callbackID, callbackFn, userData);
}

s3eResult s3eIOSControllerUnRegister(s3eIOSControllerCallback callbackID, s3eCallback callbackFn)
{
	return s3eIOSControllerUnRegister_platform(callbackID, callbackFn);
}

s3eBool s3eIOSController_supportsBasic(s3eIOSController* controller)
{
	return s3eIOSController_supportsBasic_platform(controller);
}

s3eBool s3eIOSController_supportsExtended(s3eIOSController* controller)
{
	return s3eIOSController_supportsExtended_platform(controller);
}

int32 s3eIOSController_getPlayerIndex(s3eIOSController* controller)
{
	return s3eIOSController_getPlayerIndex_platform(controller);
}

void s3eIOSController_setPlayerIndex(s3eIOSController* controller, int32 index)
{
	s3eIOSController_setPlayerIndex_platform(controller, index);
}

s3eBool s3eIOSController_getButtonState(s3eIOSController* controller, s3eIOSControllerButton button)
{
	return s3eIOSController_getButtonState_platform(controller, button);
}

float s3eIOSController_getAxisValue(s3eIOSController* controller, s3eIOSControllerAxis axis)
{
	return s3eIOSController_getAxisValue_platform(controller, axis);
}
