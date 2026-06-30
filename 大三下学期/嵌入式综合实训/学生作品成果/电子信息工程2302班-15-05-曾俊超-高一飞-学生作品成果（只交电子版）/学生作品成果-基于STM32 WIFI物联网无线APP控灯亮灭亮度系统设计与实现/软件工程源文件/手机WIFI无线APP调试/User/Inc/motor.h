#ifndef __MOTOR_H__
#define __MOTOR_H__


#include "main.h"

#include "tim.h"


void MotorControl(char motorDirection,int leftMotorPWM, int rightMotorPWM);
void turn_left(int angle,float battery);
void turn_right(int angle,float battery);

#endif /*__ __LED_H__ */




