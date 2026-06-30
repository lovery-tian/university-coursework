#include "RGBLED.h"
#include "math.h"
#include <stdlib.h>

#define WS2812B_LED_QUANTITY	2

uint32_t CORLOR_index[8]= {0xff0000,0x00ff00,0x0000ff,0x000000,0xffffff,0x00ffff,0xff00ff,0xffff00};

uint32_t WS2812B_Buf[WS2812B_LED_QUANTITY];	//0xGGRRBB
uint32_t WS2812B_Bit[24*WS2812B_LED_QUANTITY+1];//这个是将上面的buffer拆解成bit
uint8_t WS2812B_Flag;

void WS2812B_Write0()
{
    RGB_LED_PIN_H;
    __NOP();
    __NOP();
    __NOP();
    RGB_LED_PIN_L;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
}
void WS2812B_Write1()
{
    RGB_LED_PIN_H;
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    __NOP();
    RGB_LED_PIN_L;
    __NOP();
    __NOP();
    __NOP();

}
void Set_RGB_LED(unsigned char R, unsigned char G,unsigned char B)
{
    int i=0;
    for(i=0; i<8; i++)
    {
        if((G>>i)&0x01)
        {
            WS2812B_Write1();
        }
        else
        {
            WS2812B_Write0();
        }
    }
    for(i=0; i<8; i++)
    {
        if((R>>i)&0x01)
        {
            WS2812B_Write1();
        }
        else
        {
            WS2812B_Write0();
        }
    }
    for(i=0; i<8; i++)
    {
        if((B>>i)&0x01)
        {
            WS2812B_Write1();
        }
        else
        {
            WS2812B_Write0();
        }
    }


}
void Set_RGB_LED2(uint32_t Color)
{
    Set_RGB_LED((Color&0XFF0000)>>16,(Color&0X00FF00)>>8,Color&0X0000FF);
}
void Set_index_RGB_LED(int index,uint32_t Color1,uint32_t Color2)
{
    if(index == 1)
    {
        Set_RGB_LED((Color1&0XFF0000)>>16,(Color1&0X00FF00)>>8,Color1&0X0000FF);
        Set_RGB_LED((Color2&0X000000)>>16,(Color2&0X000000)>>8,Color2&0X000000);
        RGB_LED_PIN_L;
        HAL_Delay(1);
    }

    if(index == 2)
    {
        Set_RGB_LED((Color1&0XFF0000)>>16,(Color1&0X00FF00)>>8,Color1&0X0000FF);
        Set_RGB_LED((Color2&0XFF0000)>>16,(Color2&0X00FF00)>>8,Color2&0X0000FF);

        RGB_LED_PIN_L;
        HAL_Delay(1);
    }

}
void WS2812B_ClearBuf(void)//所有数据清零，关灯
{
    uint8_t i;
    for(i=0; i<WS2812B_LED_QUANTITY; i++)
    {

        Set_RGB_LED2(0x000000);
    }
}
void WS2812B_SetBuf(uint32_t Color)//设置灯的颜色
{
    uint8_t i;
    for(i=0; i<WS2812B_LED_QUANTITY; i++)
    {
        //WS2812B_Buf[i]=Color;
        Set_RGB_LED2(Color);
    }
}
void ColorLight_Mode0(void)
{
    static uint8_t i=0,Color=0;
    //ColorLight_Time=6;

    if(i==0)WS2812B_SetBuf((Color));
    if(i==1)WS2812B_SetBuf((255-Color));
    if(i==2)WS2812B_SetBuf((Color)<<8);
    if(i==3)WS2812B_SetBuf((255-Color)<<8);
    if(i==4)WS2812B_SetBuf((Color)<<16);
    if(i==5)WS2812B_SetBuf((255-Color)<<16);
    if(i==6)WS2812B_SetBuf((Color)|((Color)<<8));
    if(i==7)WS2812B_SetBuf((255-Color)|((255-Color)<<8));
    if(i==8)WS2812B_SetBuf((Color)|((Color)<<16));
    if(i==9)WS2812B_SetBuf((255-Color)|((255-Color)<<16));
    if(i==10)WS2812B_SetBuf(((Color)<<8)|((Color)<<16));
    if(i==11)WS2812B_SetBuf(((255-Color)<<8)|((255-Color)<<16));
    if(i==12)WS2812B_SetBuf(((Color))|((Color)<<8)|((Color)<<16));
    if(i==13)WS2812B_SetBuf(((255-Color))|((255-Color)<<8)|((255-Color)<<16));

    Color++;
    if(Color==0)
    {
        i++;
        i%=14;
    }
}
void ColorLight_Mode1(void)
{
    uint8_t i,RandNum;
    uint32_t G,R,B;
    static uint8_t j;

    for(i=31; i>0; i--)
    {
        WS2812B_Buf[i]=WS2812B_Buf[i-1];
    }

    if(j==0)
    {
        RandNum=rand()%7;
        if(RandNum==0)WS2812B_Buf[0]=0x0000FF;
        if(RandNum==1)WS2812B_Buf[0]=0x00FF00;
        if(RandNum==2)WS2812B_Buf[0]=0xFF0000;
        if(RandNum==3)WS2812B_Buf[0]=0x00FFFF;
        if(RandNum==4)WS2812B_Buf[0]=0xFF00FF;
        if(RandNum==5)WS2812B_Buf[0]=0xFFFF00;
        if(RandNum==6)WS2812B_Buf[0]=0xFFFFFF;
    }
    else if(j<15)
    {
        G=WS2812B_Buf[1]/0x10000%0x100;
        R=WS2812B_Buf[1]/0x100%0x100;
        B=WS2812B_Buf[1]%0x100;
        if(G>20)G-=20;
        if(R>20)R-=20;
        if(B>20)B-=20;
        WS2812B_Buf[0]=(G<<16)|(R<<8)|B;
    }
    else
    {
        WS2812B_Buf[0]=0;
    }

    j++;
    j%=50;
}
void ColorLight_Mode2(void)
{
    uint8_t i;
    static uint8_t j;

    for(i=31; i>0; i--)
    {
        WS2812B_Buf[i]=WS2812B_Buf[i-1];
    }
    if(j==0)WS2812B_Buf[0]=rand()%0x1000000;
    else WS2812B_Buf[0]=WS2812B_Buf[1];
    j++;
    j%=10;
}
void ColorLight_Mode3(void)
{
    uint8_t i;

    for(i=0; i<32; i++)
    {
        WS2812B_Buf[i]=rand()%0x1000000;
    }
}






