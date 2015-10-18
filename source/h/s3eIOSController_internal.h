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
uint32 s3eIOSControllerGetControllerCount_platform();

s3eIOSController* s3eIOSControllerGetController_platform(uint32 index);

s3eBool s3eIOSControllerSupportsBasic_platform(s3eIOSController* controller);

s3eBool s3eIOSControllerSupportsExtended_platform(s3eIOSController* controller);

int32 s3eIOSControllerGetPlayerIndex_platform(s3eIOSController* controller);

void s3eIOSControllerSetPlayerIndex_platform(s3eIOSController* controller, int32 index);

s3eBool s3eIOSControllerGetButtonState_platform(s3eIOSController* controller, s3eIOSControllerButton button);

float s3eIOSControllerGetAxisValue_platform(s3eIOSController* controller, s3eIOSControllerAxis axis);


#endif /* !S3EIOSCONTROLLER_INTERNAL_H */