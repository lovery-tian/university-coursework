#ifndef __LED_H__
#define __LED_H__


#include "main.h"


#define ledtoggle(ms) {LED_GPIO_Port->BSRR = ((LED_GPIO_Port->ODR & LED_Pin) << 16) | (~LED_GPIO_Port->ODR & LED_Pin);HAL_Delay(ms);}


void led_toggle(uint16_t ms);

#endif /*__ __LED_H__ */




