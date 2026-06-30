#ifndef __STM32_U8G2_H__
#define __STM32_U8G2_H__

#include "main.h"
#include "u8g2.h"
#include "oled.h"
#include "i2c.h"

#define MAX_LEN    128  //

#define OLED_ADDRESS  0x78 // oled
#define OLED_CMD   0x00  // 
#define OLED_DATA  0x40  // 
 

uint8_t u8x8_gpio_and_delay(u8x8_t *u8x8, uint8_t msg, uint8_t arg_int, void *arg_ptr);


void u8g2Init(u8g2_t *u8g2);
void draw(u8g2_t *u8g2);
void testDrawPixelToFillScreen(u8g2_t *u8g2);

#endif /*__ __LED_H__ */




