/*
 * iphone-specific implementation of the s3eIOSController extension.
 * Add any platform-specific functionality here.
 */
/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */
#include "s3eIOSController_internal.h"
#include "s3eEdk.h"

#import <GameController/GameController.h>
#import <Foundation/Foundation.h>

@interface S3EIOSController : NSObject
@end

S3EIOSController *g_Controller = NULL;

@implementation S3EIOSController

-(void)controllerConnected:(NSNotification*)notification
{
    GCController *controller = (GCController*)notification.object;
    controller.controllerPausedHandler = ^(GCController *gcController) { [g_Controller controllerPaused: gcController]; };
    
    s3eEdkCallbacksEnqueue(S3E_EXT_IOSCONTROLLER_HASH, S3E_IOSCONTROLLER_CALLBACK_CONNECTED, controller);
}

-(void)controllerDisconnected:(NSNotification*)notification
{
    GCController *controller = (GCController*)notification.object;
    s3eEdkCallbacksEnqueue(S3E_EXT_IOSCONTROLLER_HASH, S3E_IOSCONTROLLER_CALLBACK_DISCONNECTED, controller);
}

-(void)controllerPaused:(GCController*)controller
{
    s3eEdkCallbacksEnqueue(S3E_EXT_IOSCONTROLLER_HASH, S3E_IOSCONTROLLER_CALLBACK_PAUSE_PRESSED, controller);
}
@end

s3eResult s3eIOSControllerInit_platform()
{
    // Add any platform-specific initialisation code here
    
    g_Controller = [[S3EIOSController alloc] init];
    
    for(id controller in GCController.controllers)
    {
        ((GCController*)controller).controllerPausedHandler = ^(GCController *gcController) { [g_Controller controllerPaused: gcController]; };
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:g_Controller selector:@selector(controllerConnected:) name:GCControllerDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:g_Controller selector:@selector(controllerDisconnected:) name:GCControllerDidDisconnectNotification object:nil];
    
    return S3E_RESULT_SUCCESS;
}

void s3eIOSControllerTerminate_platform()
{
    // Add any platform-specific termination code here
    [[NSNotificationCenter defaultCenter] removeObserver:g_Controller];
    
    for(id controller in GCController.controllers)
    {
        ((GCController*)controller).controllerPausedHandler = nil;
    }
    
    [g_Controller release];
    g_Controller = NULL;
}

uint32 s3eIOSControllerGetControllerCount_platform()
{
    return GCController.controllers.count;
}

s3eIOSController* s3eIOSControllerGetController_platform(uint32 index)
{
    return (s3eIOSController*)[GCController.controllers objectAtIndex:index];
}

s3eBool s3eIOSControllerSupportsBasic_platform(s3eIOSController* controller)
{
    GCController *gcController = (GCController*)controller;
    return gcController.gamepad != nil;
}

s3eBool s3eIOSControllerSupportsExtended_platform(s3eIOSController* controller)
{
    GCController *gcController = (GCController*)controller;
    return gcController.extendedGamepad != nil;
}

s3eBool s3eIOSControllerSupportsMicro_platform(s3eIOSController* controller)
{
#if TARGET_OS_TV
    GCController *gcController = (GCController*)controller;
    return gcController.microGamepad != nil;
#else
    return S3E_FALSE;
#endif
}

s3eBool s3eIOSControllerGetReportsAbsoluteDpadValues_platform(s3eIOSController* controller)
{
#if TARGET_OS_TV
    GCController *gcController = (GCController*)controller;
    return gcController.microGamepad && gcController.microGamepad.reportsAbsoluteDpadValues;
#else
    return S3E_FALSE;
#endif
}

void s3eIOSControllerSetReportsAbsoluteDpadValues_platform(s3eIOSController* controller, s3eBool value)
{
#if TARGET_OS_TV
    GCController *gcController = (GCController*)controller;
    if (gcController.microGamepad)
        gcController.microGamepad.reportsAbsoluteDpadValues = (BOOL)value;
#endif
}

s3eBool s3eIOSControllerGetAllowsRotation_platform(s3eIOSController* controller)
{
#if TARGET_OS_TV
    GCController *gcController = (GCController*)controller;
    return gcController.microGamepad && gcController.microGamepad.allowsRotation;
#else
    return S3E_FALSE;
#endif
}

void s3eIOSControllerSetAllowsRotation_platform(s3eIOSController* controller, s3eBool value)
{
#if TARGET_OS_TV
    GCController *gcController = (GCController*)controller;
    if (gcController.microGamepad)
        gcController.microGamepad.allowsRotation = (BOOL)value;
#endif
}

int32 s3eIOSControllerGetPlayerIndex_platform(s3eIOSController* controller)
{
    GCController *gcController = (GCController*)controller;
    return gcController.playerIndex;
}

void s3eIOSControllerSetPlayerIndex_platform(s3eIOSController* controller, int32 index)
{
    GCController *gcController = (GCController*)controller;
    gcController.playerIndex = index;
}

s3eBool s3eIOSControllerGetButtonState_platform(s3eIOSController* controller, s3eIOSControllerButton button)
{
    GCController *gcController = (GCController*)controller;
    switch(button)
    {
        case S3E_IOSCONTROLLER_BUTTON_A:
            return (gcController.gamepad != nil && gcController.gamepad.buttonA.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.buttonA.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_B:
            return gcController.gamepad != nil && gcController.gamepad.buttonB.pressed;
        case S3E_IOSCONTROLLER_BUTTON_X:
            return (gcController.gamepad != nil && gcController.gamepad.buttonX.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.buttonX.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_Y:
            return gcController.gamepad != nil && gcController.gamepad.buttonY.pressed;
        case S3E_IOSCONTROLLER_BUTTON_DPAD_UP:
            return (gcController.gamepad != nil && gcController.gamepad.dpad.up.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.dpad.up.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_DPAD_DOWN:
            return (gcController.gamepad != nil && gcController.gamepad.dpad.down.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.dpad.down.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_DPAD_LEFT:
            return (gcController.gamepad != nil && gcController.gamepad.dpad.left.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.dpad.left.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_DPAD_RIGHT:
            return (gcController.gamepad != nil && gcController.gamepad.dpad.right.pressed)
#if TARGET_OS_TV
                    || (gcController.microGamepad != nil && gcController.microGamepad.dpad.right.pressed)
#endif
                    ;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_SHOULDER:
            return gcController.gamepad != nil && gcController.gamepad.leftShoulder.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_SHOULDER:
            return gcController.gamepad != nil && gcController.gamepad.rightShoulder.pressed;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_TRIGGER:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftTrigger.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_TRIGGER:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightTrigger.pressed;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_THUMBSTICK_UP:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.up.pressed;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_THUMBSTICK_DOWN:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.down.pressed;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_THUMBSTICK_LEFT:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.left.pressed;
        case S3E_IOSCONTROLLER_BUTTON_LEFT_THUMBSTICK_RIGHT:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.right.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_THUMBSTICK_UP:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.up.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_THUMBSTICK_DOWN:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.down.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_THUMBSTICK_LEFT:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.left.pressed;
        case S3E_IOSCONTROLLER_BUTTON_RIGHT_THUMBSTICK_RIGHT:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.right.pressed;
        default:
            return S3E_FALSE;
    }
}

float s3eIOSControllerGetAxisValue_platform(s3eIOSController* controller, s3eIOSControllerAxis axis)
{
    GCController *gcController = (GCController*)controller;
    switch(axis)
    {
        case S3E_IOSCONTROLLER_AXIS_DPAD_X:
            if (gcController.gamepad)
                return gcController.gamepad.dpad.xAxis.value;
#if TARGET_OS_TV
            else if (gcController.microGamepad)
                return gcController.microGamepad.dpad.xAxis.value;
#endif
            return 0.0f;
        case S3E_IOSCONTROLLER_AXIS_DPAD_Y:
            if (gcController.gamepad)
                return gcController.gamepad.dpad.yAxis.value;
#if TARGET_OS_TV
            else if (gcController.microGamepad)
                return gcController.microGamepad.dpad.yAxis.value;
#endif
            return 0.0f;
        case S3E_IOSCONTROLLER_AXIS_LEFT_THUMBSTICK_X:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.leftThumbstick.xAxis.value : 0.0f;
        case S3E_IOSCONTROLLER_AXIS_LEFT_THUMBSTICK_Y:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.leftThumbstick.yAxis.value : 0.0f;
        case S3E_IOSCONTROLLER_AXIS_RIGHT_THUMBSTICK_X:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.rightThumbstick.xAxis.value : 0.0f;
        case S3E_IOSCONTROLLER_AXIS_RIGHT_THUMBSTICK_Y:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.rightThumbstick.yAxis.value : 0.0f;
        case S3E_IOSCONTROLLER_AXIS_LEFT_TRIGGER:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.leftTrigger.value : 0.0f;
        case S3E_IOSCONTROLLER_AXIS_RIGHT_TRIGGER:
            return gcController.extendedGamepad != nil ? gcController.extendedGamepad.rightTrigger.value : 0.0f;
        default:
            return 0.0f;
    }
}
