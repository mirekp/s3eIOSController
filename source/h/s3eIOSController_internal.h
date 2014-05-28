/*
 * Internal header for the s3eIOSController extension.
 *
 * This file should be used for any common function definitions etc that need to
 * be shared between the platform-dependent and platform-indepdendent parts of
 * this extension.
 */

/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */


#ifndef S3EIOSCONTROLLER_INTERNAL_H
#define S3EIOSCONTROLLER_INTERNAL_H

#include "s3eTypes.h"
#include "s3eIOSController.h"
#include "s3eIOSController_autodefs.h"


/**
 * Initialise the extension.  This is called once then the extension is first
 * accessed by s3eregister.  If this function returns S3E_RESULT_ERROR the
 * extension will be reported as not-existing on the device.
 */
s3eResult s3eIOSControllerInit();

/**
 * Platform-specific initialisation, implemented on each platform
 */
s3eResult s3eIOSControllerInit_platform();

/**
 * Terminate the extension.  This is called once on shutdown, but only if the
 * extension was loader and Init() was successful.
 */
void s3eIOSControllerTerminate();

/**
 * Platform-specific termination, implemented on each platform
 */
void s3eIOSControllerTerminate_platform();
int s3eIOSController_getControllerCount_platform();

s3eIOSController* s3eIOSController_getController_platform(int index);

s3eResult s3eIOSControllerRegister_platform(s3eIOSControllerCallback callbackID, s3eCallback callbackFn, void* userData);

s3eResult s3eIOSControllerUnRegister_platform(s3eIOSControllerCallback callbackID, s3eCallback callbackFn);

s3eBool s3eIOSController_supportsBasic_platform(s3eIOSController* controller);

s3eBool s3eIOSController_supportsExtended_platform(s3eIOSController* controller);

int s3eIOSController_getPlayerIndex_platform(s3eIOSController* controller);

void s3eIOSController_setPlayerIndex_platform(s3eIOSController* controller, int index);

s3eBool s3eIOSController_getButtonState_platform(s3eIOSController* controller, s3eIOSControllerButton button);

float s3eIOSController_getAxisValue_platform(s3eIOSController* controller, s3eIOSControllerAxis axis);


#endif /* !S3EIOSCONTROLLER_INTERNAL_H */