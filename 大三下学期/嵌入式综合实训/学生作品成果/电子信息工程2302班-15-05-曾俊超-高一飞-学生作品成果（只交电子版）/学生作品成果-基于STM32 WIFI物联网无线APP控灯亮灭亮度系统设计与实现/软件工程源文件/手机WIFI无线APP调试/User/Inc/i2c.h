#ifndef _I2C_H_
#define _I2C_H_


#include "main.h"
#include "uart.h"

#define IIC_OK		0

#define IIC_Err		1


//SDA		PB11
//SCL		PB10
#define SDA_H	HAL_GPIO_WritePin(OLED_SDA_GPIO_Port, OLED_SDA_Pin, GPIO_PIN_SET);
#define SDA_L	HAL_GPIO_WritePin(OLED_SDA_GPIO_Port, OLED_SDA_Pin, GPIO_PIN_RESET);
#define SDA_R	 HAL_GPIO_ReadPin(OLED_SDA_GPIO_Port, OLED_SDA_Pin)

#define SCL_H	HAL_GPIO_WritePin(OLED_SCL_GPIO_Port, OLED_SCL_Pin, GPIO_PIN_SET);
#define SCL_L	HAL_GPIO_WritePin(OLED_SCL_GPIO_Port, OLED_SCL_Pin, GPIO_PIN_RESET);


typedef struct
{

	unsigned short speed;

} IIC_INFO;

extern IIC_INFO iic_info;

void DelayUs(u32 nTimer);
void Tims_delay_us(u32 nTimer);




void IIC_Init(void);

void IIC_SpeedCtl(unsigned short speed);

_Bool I2C_WriteByte(unsigned char slaveAddr, unsigned char regAddr, unsigned char *byte);

_Bool I2C_ReadByte(unsigned char slaveAddr, unsigned char regAddr, unsigned char *val);

_Bool I2C_WriteBytes(unsigned char slaveAddr, unsigned char regAddr, unsigned char *buf, unsigned char num);

_Bool I2C_ReadBytes(unsigned char slaveAddr, unsigned char regAddr, unsigned char *buf, unsigned char num);

void IIC_Start(void);

void IIC_Stop(void);

_Bool IIC_WaitAck(unsigned int timeOut);

void IIC_Ack(void);

void IIC_NAck(void);

void IIC_SendByte(unsigned char byte);

unsigned char IIC_RecvByte(void);


#endif
