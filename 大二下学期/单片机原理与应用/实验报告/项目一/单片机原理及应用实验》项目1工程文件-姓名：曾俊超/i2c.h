#ifndef I2C_H
#define I2C_H

#include <reg51.h>

#define uchar unsigned char
#define uint unsigned int

void I2C_Init();
void I2C_WriteByte(uchar address, uchar data);

#endif