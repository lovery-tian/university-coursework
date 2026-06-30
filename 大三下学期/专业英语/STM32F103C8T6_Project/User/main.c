#include "stm32f10x.h"

void Delay(__IO uint32_t nCount)
{
    for (; nCount != 0; nCount--);
}

void GPIO_Configuration(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOC, ENABLE);

    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOC, &GPIO_InitStructure);
}

int main(void)
{
    GPIO_Configuration();

    while (1)
    {
        GPIO_WriteBit(GPIOC, GPIO_Pin_13, Bit_RESET);
        Delay(0x0FFFFF);
        GPIO_WriteBit(GPIOC, GPIO_Pin_13, Bit_SET);
        Delay(0x0FFFFF);
    }
}
