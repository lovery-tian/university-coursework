#include "config.h"
#include "keyboard.h"
#include "Lcd1602.h"

sbit BUZZ = P1^6;    //蜂鸣器控制引脚
uint8 TORH = 0;
uint8 TORL = 0;
uint8 T1RH = 0;
uint8 T1RL = 0;

void ConfigTimer0(unsigned int ms);
void OpenBuzz(unsigned int frequ);
void StopBuzz();
void KeyAction(uint8 keycode);  // 添加函数声明

void main()
{
    EA = 1;    //开总中断
    ConfigTimer0(1);    //配置定时器 0 1ms 进一次中断
    InitLcd1602();
    LcdShowStr(0,0,"State:"); //1602 显示按键名称
    LcdShowStr(0,1,"Number:"); //1602 显示抢答组号

    while(1)
    {
        KeyDriver();    //按键驱动程序
    }
}

void KeyAction(uint8 keycode)
{
    uint8 buf[2]; //用于存放按键号码，需要2个字符空间（1个字符+'\0'）
    static uint8 permit = 0; //允许抢答标志
    static uint8 done = 0; //抢答完成标志

    if((keycode>='1') && (keycode<='9')) //数字键 1-9 执行抢答
    {
        if(done == 0)
        {
            if(permit == 0)
            {
                buf[0] = keycode;
                buf[1] = '\0'; // 添加字符串结束符
                LcdShowStr(8,0,"Warning"); //显示警告
                LcdShowStr(8,1,buf); //显示按键号码
                done = 1;
                OpenBuzz(4000);
            }
            else
            {
                buf[0] = keycode;
                buf[1] = '\0'; // 添加字符串结束符
                LcdShowStr(8,1,buf); //显示按键号码
                done = 1;
            }
        }
    }
    else if (keycode == 0x0D) //回车键，开始抢答
    {
        if(done == 0)
        {
            LcdAreaClear(8,0,8);
            LcdShowStr(8,0,"Permit");
            permit = 1;
        }
    }
    else if (keycode == 0x1B) //Esc 键，清除
    {
        LcdFullClear();
        LcdShowStr(0,0,"State :");
        LcdShowStr(0,1,"Number:");
        permit = 0;
        done = 0;
        StopBuzz();
    }
}

void ConfigTimer0(unsigned int ms)
{
    uint32 tmp; //临时变量
    tmp = 11059200 / 12; //定时器计数频率
    tmp = (tmp * ms) / 1000; //计算所需的计数值
    tmp = 65536 - tmp; //计算定时器重载值
    tmp = tmp + 13; //补偿中断响应延时造成的误差
    TORH = (uint8)(tmp>>8); //定时器重载值拆分为高低字节
    TORL = (uint8)tmp;
    TMOD &= 0xF0; //清零 T0 的控制位（低4位）
    TMOD |= 0x01; //配置 T0 为模式 1
    TH0 = TORH; //加载 T0 重载值
    TL0 = TORL;
    ET0 = 1; //使能 T0 中断
    TR0 = 1; //启动 T0
}
/* 蜂鸣器启动函数，frequ-工作频率 */
void OpenBuzz(unsigned int frequ)
{
    uint16 reload; //计算所需的定时器重载值
    reload = 65536 - (11059200/12)/(frequ*2); //由给定频率计算定时器重载值
    T1RH = (uint8)(reload >> 8); //16 位重载值分解为高低两个字节
    T1RL = (uint8)reload;
    TH1 = 0xFF; //设定一个接近溢出的初值，以使定时器马上投入工作
    TL1 = 0xFE;
    ET1 = 1; //使能 T1 中断
    TR1 = 1; //启动 T1
}
/* 蜂鸣器停止函数 */
void StopBuzz()
{
    ET1 = 0; //禁用 T1 中断
    TR1 = 0; //停止 T1
}
/* T0 中断服务函数，完成按键扫描 */
void InterruptTimer0() interrupt 1
{
    TH0 = TORH; //重新加载重载值
    TL0 = TORL;
    KeyScan(); //键盘扫描
}
/* T1 中断服务函数，用于控制蜂鸣器发声 */
void InterruptTimer1() interrupt 3
{
    TH1 = T1RH; //重新加载重载值
    TL1 = T1RL;
    BUZZ = ~BUZZ; //反转蜂鸣器控制电平
}