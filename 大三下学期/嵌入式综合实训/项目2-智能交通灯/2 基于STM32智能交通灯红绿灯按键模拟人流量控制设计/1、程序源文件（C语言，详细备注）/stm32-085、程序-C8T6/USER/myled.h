#ifndef __MYLED_H
#define __MYLED_H	 
#include "stm32f10x.h"
#include "mygpio.h"

//	LED名称，可修改		映射LED，按照格式以此类推
#define ew_GREEN				LED_0// led控制
#define ew_YELLOW				LED_1//
#define ew_RED					LED_2// led控制
#define ns_RED1					LED_3//
#define ns_YELLOW1			LED_4// led控制
#define ns_GREEN1				LED_5//
//#define LED7			LED_6// led控制
//#define LED8			LED_7// led控制


//		LED管脚名，不可修改		对应IO脚
#define LED_0_PIN				PA0 // led控制
#define LED_1_PIN				PA1//
#define LED_2_PIN				PA4// led控制
#define LED_3_PIN				PA5//
#define LED_4_PIN				PA6// led控制
#define LED_5_PIN				PA7//
//#define LED_6_PIN				PA0// led控制
//#define LED_7_PIN				PB15//
//#define LED_8_PIN				PC13//


#ifdef	LED_0_PIN
#define LED_0 PinOut(LED_0_PIN)// 
#endif
#ifdef	LED_1_PIN
#define LED_1 PinOut(LED_1_PIN)// 
#endif
#ifdef	LED_2_PIN
#define LED_2 PinOut(LED_2_PIN)// 
#endif
#ifdef	LED_3_PIN
#define LED_3 PinOut(LED_3_PIN)// 
#endif
#ifdef	LED_4_PIN
#define LED_4 PinOut(LED_4_PIN)//
#endif
#ifdef	LED_5_PIN 
#define LED_5 PinOut(LED_5_PIN)//
#endif
#ifdef	LED_6_PIN 
#define LED_6 PinOut(LED_6_PIN)// 
#endif
#ifdef	LED_7_PIN
#define LED_7 PinOut(LED_7_PIN)// 
#endif
#ifdef	LED_8_PIN
#define LED_8 PinOut(LED_8_PIN)//
#endif
#ifdef	LED_9_PIN 
#define LED_9 PinOut(LED_9_PIN)// 
#endif
#ifdef	LED_10_PIN
#define LED_10 PinOut(LED_10_PIN)// 
#endif
#ifdef	LED_11_PIN
#define LED_11 PinOut(LED_11_PIN)// 
#endif
#ifdef	LED_12_PIN
#define LED_12 PinOut(LED_12_PIN)// 
#endif
#ifdef	LED_13_PIN
#define LED_13 PinOut(LED_13_PIN)// 
#endif
#ifdef	LED_14_PIN
#define LED_14 PinOut(LED_14_PIN)//
#endif
#ifdef	LED_15_PIN 
#define LED_15 PinOut(LED_15_PIN)//
#endif
#ifdef	LED_16_PIN 
#define LED_16 PinOut(LED_16_PIN)// 
#endif
#ifdef	LED_17_PIN
#define LED_17 PinOut(LED_17_PIN)// 
#endif
#ifdef	LED_18_PIN
#define LED_18 PinOut(LED_18_PIN)//
#endif
#ifdef	LED_19_PIN 
#define LED_19 PinOut(LED_19_PIN)// 
#endif
#ifdef	LED_20_PIN
#define LED_20 PinOut(LED_20_PIN)// 
#endif
#ifdef	LED_21_PIN
#define LED_21 PinOut(LED_21_PIN)// 
#endif
#ifdef	LED_22_PIN
#define LED_22 PinOut(LED_22_PIN)// 
#endif
#ifdef	LED_23_PIN
#define LED_23 PinOut(LED_23_PIN)// 
#endif
#ifdef	LED_24_PIN
#define LED_24 PinOut(LED_24_PIN)//
#endif
#ifdef	LED_25_PIN 
#define LED_25 PinOut(LED_25_PIN)//
#endif
#ifdef	LED_26_PIN 
#define LED_26 PinOut(LED_26_PIN)// 
#endif
#ifdef	LED_27_PIN
#define LED_27 PinOut(LED_27_PIN)// 
#endif
#ifdef	LED_28_PIN
#define LED_28 PinOut(LED_28_PIN)//
#endif
#ifdef	LED_29_PIN 
#define LED_29 PinOut(LED_29_PIN)// 
#endif
#ifdef	LED_30_PIN
#define LED_30 PinOut(LED_30_PIN)// 
#endif
#ifdef	LED_31_PIN
#define LED_31 PinOut(LED_31_PIN)// 
#endif
void MyLED_Init(void);

#endif
