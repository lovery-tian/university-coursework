#ifndef _CONFIG_H
#define _CONFIG_H

/* 通用头文件 */
#include <reg52.h>
#include <intrins.h>

/* 数据类型定义 */
typedef signed char int8;       //8位有符号整型数
typedef signed int int16;       //16位有符号整型数
typedef signed long int32;      //32位有符号整型数
typedef unsigned char uint8;    //8位无符号整型数
typedef unsigned int uint16;    //16位无符号整型数
typedef unsigned long uint32;   //32位无符号整型数

/* 全局运行参数定义 */
#define SYS_MCLK (11059200/12)  //系统主时钟频率，即振荡器频率÷12

#endif