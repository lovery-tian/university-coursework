#include "mygpio.h"

uint32_t GetGPIO_RCC(MyPinDef pin){
	return RCC_APB2Periph_GPIOA<<(pin/16);
}
GPIO_TypeDef* GetGPIO_Port(MyPinDef pin){
	return ((GPIO_TypeDef *) (GPIOA_BASE+0x0400*(pin/16)));
}

uint16_t GetGPIO_PIN(MyPinDef pin){
	return 0x0001<<(pin%16);
}

void GPIO_SetOutput(MyPinDef pin){
     GPIO_InitTypeDef GPIO_InitStructure;   //声明结构体
	 RCC_APB2PeriphClockCmd(GetGPIO_RCC(pin), ENABLE);  //打开端口B时钟 
     GPIO_InitStructure.GPIO_Pin  = GetGPIO_PIN(pin); //  DB8~DB15
     GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  //标准输出模式
     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //50M时钟速度
     GPIO_Init(GetGPIO_Port(pin), &GPIO_InitStructure);      //初始化端口
}
void GPIO_SetInput(MyPinDef pin){
 	GPIO_InitTypeDef GPIO_InitStructure;
	
 	RCC_APB2PeriphClockCmd(GetGPIO_RCC(pin),ENABLE);//上拉输入
	
	GPIO_InitStructure.GPIO_Pin  = GetGPIO_PIN(pin);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;
     GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz; //50M时钟速度
	GPIO_Init(GetGPIO_Port(pin), &GPIO_InitStructure);
}

void SetPin(MyPinDef pin){
	GPIO_SetBits(GetGPIO_Port(pin), GetGPIO_PIN(pin));
}
void ResetPin(MyPinDef pin){
	GPIO_ResetBits(GetGPIO_Port(pin), GetGPIO_PIN(pin));
}
void PinOutBit(MyPinDef pin, uint8_t bitNum){
	if(bitNum == 0){
		ResetPin(pin);
	}
	else{
		SetPin(pin);
	}
}

uint8_t ReadPin(MyPinDef pin){
	return GPIO_ReadInputDataBit(GetGPIO_Port(pin), GetGPIO_PIN(pin));
}

