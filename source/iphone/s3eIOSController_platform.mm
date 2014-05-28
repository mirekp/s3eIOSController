/*
 * iphone-specific implementation of the s3eIOSController extension.
 * Add any platform-specific functionality here.
 */
/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */
#include "s3eIOSController_internal.h"

s3eResult s3eIOSControllerInit_platform()
{
    // Add any platform-specific initialisation code here
    return S3E_RESULT_SUCCESS;
}

void s3eIOSControllerTerminate_platform()
{
    // Add any platform-specific termination code here
}

int s3eIOSController_getControllerCount_platform()
{
    return 0;
}

s3eIOSController* s3eIOSController_getController_platform(int index)
{
    return NULL;
}

s3eResult s3eIOSControllerRegister_platform(s3eIOSControllerCallback callbackID, s3eCallback callbackFn, void* userData)
{
    return S3E_RESULT_ERROR;
}

s3eResult s3eIOSControllerUnRegister_platform(s3eIOSControllerCallback callbackID, s3eCallback callbackFn)
{
    return S3E_RESULT_ERROR;
}

s3eBool s3eIOSController_supportsBasic_platform(s3eIOSController* controller)
{
    return S3E_FALSE;
}

s3eBool s3eIOSController_supportsExtended_platform(s3eIOSController* controller)
{
    return S3E_FALSE;
}

int s3eIOSController_getPlayerIndex_platform(s3eIOSController* controller)
{
    return -1;
}

void s3eIOSController_setPlayerIndex_platform(s3eIOSController* controller, int index)
{
}

s3eBool s3eIOSController_getButtonState_platform(s3eIOSController* controller, s3eIOSControllerButton button)
{
    return S3E_FALSE;
}

float s3eIOSController_getAxisValue_platform(s3eIOSController* controller, s3eIOSControllerAxis axis)
{
    return 0.0f;
}
