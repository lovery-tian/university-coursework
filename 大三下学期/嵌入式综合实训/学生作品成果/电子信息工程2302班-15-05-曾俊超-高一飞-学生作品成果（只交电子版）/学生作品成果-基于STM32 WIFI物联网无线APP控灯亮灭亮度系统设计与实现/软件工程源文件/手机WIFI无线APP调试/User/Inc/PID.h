#ifndef __PID_H__
#define __PID_H__


#include "main.h"

int PID_Calc_Left(int NextPoint,int Setpoint);
int PID_Calc_Right(int NextPoint,int Setpoint);
void showPID(void);


#endif /*__ __LED_H__ */




