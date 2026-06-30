#include "stm32f10x.h"
#include "key.h"
#include "sys.h" 
#include "delay.h"

 
void KEY_Init(void) //IO初始化
{
 	GPIO_InitTypeDef GPIO_InitStructure;
	// 上拉输入
 	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC|RCC_APB2Periph_GPIOA,ENABLE);
	GPIO_InitStructure.GPIO_Pin  = GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;

 	GPIO_Init(GPIOC, &GPIO_InitStructure);	
	
	 	
	GPIO_InitStructure.GPIO_Pin  = GPIO_Pin_1;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;

 	GPIO_Init(GPIOA, &GPIO_InitStructure);		 


}
