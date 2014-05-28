/*
 * iphone-specific implementation of the s3eIOSController extension.
 * Add any platform-specific functionality here.
 */
/*
 * NOTE: This file was originally written by the extension builder, but will not
 * be overwritten (unless --force is specified) and is intended to be modified.
 */
#include "s3eIOSController_internal.h"

#import <GameController/GameController.h>

s3eResult s3eIOSControllerInit_platform()
{
    // Add any platform-specific initialisation code here
    return S3E_RESULT_SUCCESS;
}

void s3eIOSControllerTerminate_platform()
{
    // Add any platform-specific termination code here
}

uint32 s3eIOSController_getControllerCount_platform()
{
    return GCController.controllers.count;
}

s3eIOSController* s3eIOSController_getController_platform(uint32 index)
{
    return (s3eIOSController*)[GCController.controllers objectAtIndex:index];
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
    GCController *gcController = (GCController*)controller;
    return gcController.gamepad != nil;
}

s3eBool s3eIOSController_supportsExtended_platform(s3eIOSController* controller)
{
    GCController *gcController = (GCController*)controller;
    return gcController.extendedGamepad != nil;
}

int32 s3eIOSController_getPlayerIndex_platform(s3eIOSController* controller)
{
    GCController *gcController = (GCController*)controller;
    return gcController.playerIndex;
}

void s3eIOSController_setPlayerIndex_platform(s3eIOSController* controller, int32 index)
{
    GCController *gcController = (GCController*)controller;
    gcController.playerIndex = index;
}

s3eBool s3eIOSController_getButtonState_platform(s3eIOSController* controller, s3eIOSControllerButton button)
{
    GCController *gcController = (GCController*)controller;
    switch(button)
    {
        case s3eIOSControllerButton_A:
            return gcController.gamepad != nil && gcController.gamepad.buttonA.pressed;
        case s3eIOSControllerButton_B:
            return gcController.gamepad != nil && gcController.gamepad.buttonB.pressed;
        case s3eIOSControllerButton_X:
            return gcController.gamepad != nil && gcController.gamepad.buttonX.pressed;
        case s3eIOSControllerButton_Y:
            return gcController.gamepad != nil && gcController.gamepad.buttonY.pressed;
        case s3eIOSControllerButton_DPadUp:
            return gcController.gamepad != nil && gcController.gamepad.dpad.up.pressed;
        case s3eIOSControllerButton_DPadDown:
            return gcController.gamepad != nil && gcController.gamepad.dpad.down.pressed;
        case s3eIOSControllerButton_DPadLeft:
            return gcController.gamepad != nil && gcController.gamepad.dpad.left.pressed;
        case s3eIOSControllerButton_DPadRight:
            return gcController.gamepad != nil && gcController.gamepad.dpad.right.pressed;
        case s3eIOSControllerButton_LeftShoulder:
            return gcController.gamepad != nil && gcController.gamepad.leftShoulder.pressed;
        case s3eIOSControllerButton_RightShoulder:
            return gcController.gamepad != nil && gcController.gamepad.rightShoulder.pressed;
        case s3eIOSControllerButton_LeftTrigger:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftTrigger.pressed;
        case s3eIOSControllerButton_RightTrigger:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightTrigger.pressed;
        case s3eIOSControllerButton_LeftThumbstickUp:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.up.pressed;
        case s3eIOSControllerButton_LeftThumbstickDown:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.down.pressed;
        case s3eIOSControllerButton_LeftThumbstickLeft:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.left.pressed;
        case s3eIOSControllerButton_LeftThumbstickRight:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.right.pressed;
        case s3eIOSControllerButton_RightThumbstickUp:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.up.pressed;
        case s3eIOSControllerButton_RightThumbstickDown:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.down.pressed;
        case s3eIOSControllerButton_RightThumbstickLeft:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.left.pressed;
        case s3eIOSControllerButton_RightThumbstickRight:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.right.pressed;
        default:
            return S3E_FALSE;
    }
}

float s3eIOSController_getAxisValue_platform(s3eIOSController* controller, s3eIOSControllerAxis axis)
{
    GCController *gcController = (GCController*)controller;
    switch(axis)
    {
        case s3eIOSControllerAxis_DPadX:
            return gcController.gamepad != nil && gcController.gamepad.dpad.xAxis;
        case s3eIOSControllerAxis_DPadY:
            return gcController.gamepad != nil && gcController.gamepad.dpad.yAxis;
        case s3eIOSControllerAxis_LeftThumbstickX:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.xAxis;
        case s3eIOSControllerAxis_LeftThumbstickY:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftThumbstick.yAxis;
        case s3eIOSControllerAxis_RightThumbstickX:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.xAxis;
        case s3eIOSControllerAxis_RightThumbstickY:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightThumbstick.yAxis;
        case s3eIOSControllerAxis_LeftTrigger:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.leftTrigger.value;
        case s3eIOSControllerAxis_RightTrigger:
            return gcController.extendedGamepad != nil && gcController.extendedGamepad.rightTrigger.value;
        default:
            return 0.0f;
    }
}
