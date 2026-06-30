#ifndef _LCD1602_H
#define _LCD1602_H

#include <reg52.h>

#define LCD1602_DB P0
sbit LCD1602_RS = P1^0;
sbit LCD1602_RW = P1^1;
sbit LCD1602_E = P1^5;

void InitLcd1602(void);
void LcdShowStr(unsigned char x, unsigned char y, unsigned char *str);
void LcdAreaClear(unsigned char x, unsigned char y, unsigned char len);
void LcdFullClear(void);
void LcdSetCursor(unsigned char x, unsigned char y);
void LcdWriteCmd(unsigned char cmd);
void LcdWriteDat(unsigned char dat);
void LcdWaitReady(void);

#endif