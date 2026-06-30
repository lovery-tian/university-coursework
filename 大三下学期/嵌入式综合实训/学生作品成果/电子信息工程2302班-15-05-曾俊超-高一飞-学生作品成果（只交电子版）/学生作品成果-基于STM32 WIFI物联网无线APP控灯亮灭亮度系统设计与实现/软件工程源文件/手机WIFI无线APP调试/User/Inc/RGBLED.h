#ifndef __RGBLED_H__
#define __RGBLED_H__

#include "main.h"

#define  RGB_LED_PIN_H HAL_GPIO_WritePin(RGBLED_GPIO_Port,RGBLED_Pin,GPIO_PIN_SET)
#define  RGB_LED_PIN_L HAL_GPIO_WritePin(RGBLED_GPIO_Port,RGBLED_Pin,GPIO_PIN_RESET)

extern uint32_t CORLOR_index[8];

void WS2812B_Write0(void);
void WS2812B_Write1(void);
void Set_RGB_LED(unsigned char R, unsigned char G,unsigned char B);
void Set_RGB_LED2(uint32_t Color);
void WS2812B_ClearBuf(void);//所有数据清零，关灯
void WS2812B_SetBuf(uint32_t Color);//设置灯的颜色
void ColorLight_Mode0(void);
void ColorLight_Mode1(void);
void ColorLight_Mode2(void);
void ColorLight_Mode3(void);
void Set_index_RGB_LED(int index,uint32_t Color1,uint32_t Color2);

#endif /*__ __LED_H__ */




