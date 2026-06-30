#include "led.h"
#include "delay.h"
#include "sys.h"
#include "usart.h"
#include <stdio.h>
#include "timer.h"
#include "key.h"
#include "lcd1602.h"
#include "UltrasonicWave.h"
#include "stmflash.h"  

#define FLASH_SAVE_ADDR  0X08010000 	// 注意不同芯片 扇区flash地址不一样 设置FLASH 保存地址(必须为偶数，且其值要大于本代码所占用FLASH的大小+0X08000000)
//stm32f103R8T6 flash地址范围 0x8010000-0x801FFFF
//stm32f103C8T6 flash地址范围 0x8000000-0x807FFFF

#define SIZE 10	 	//数组长度
unsigned char  setFlashBuf[10];//存储数据'

char dis0[17]; //显示暂存数组
char dis1[17];

unsigned char i;

unsigned int setNum = 500;	//设置光照值
unsigned char SetFlag  =0; //设置标志


unsigned char initFlagData;	//初始化数据存读取
/******************把数据保存到单片机内部eepom中******************/
void write_FlashBuf(void)
{
	setFlashBuf[0] = initFlagData;
	setFlashBuf[1] =  setNum / 256;  //重新写入值
	setFlashBuf[2] =  setNum % 256; 
//	setFlashBuf[3] =  setL / 256; 
//	setFlashBuf[4] =  setL % 256; 
	STMFLASH_Write(FLASH_SAVE_ADDR,(u16*)setFlashBuf,SIZE);		//读取数据	
	
}

/******************把数据从单片机内部eepom中读出来*****************/
void read_FlashBuf(void)
{
	STMFLASH_Read(FLASH_SAVE_ADDR,(u16*)setFlashBuf,SIZE); //读取flash值

	initFlagData = setFlashBuf[0]; //数据初始化读取	
	setNum  = setFlashBuf[1];	//读取高字节
	setNum <<= 8;
	setNum  |= setFlashBuf[2];	 //读取低字节 并合并
//	setL   = setFlashBuf[3];
//	setL <<= 8;
//	setL   |= setFlashBuf[4];
}

/**************开机初始化保存的数据*****************/
void init_FlashBuf(void)
{
	read_FlashBuf(); //读取flash值
	if(initFlagData != 0x55)		//新的单片机初始单片机内问eeprom 如果不是0x55重新写入
	{
		setNum =  500;//设置上限
//		setL =  35;//设置下限
		initFlagData = 0x55;   //修改值
		delay_ms(20);
		write_FlashBuf();		//读取数据
	}	
}


void CheckKey(void);
int main(void)
 { 
  NVIC_Configuration();	 
	delay_init();	    	 //延时函数初始化	  
	uart_init(9600);	 	//串口初始化为9600

  //TIM3_Int_Init(499,7199);//50ms 
 	 
	LED_Init();		  		//初始化与LED连接的硬件接口
	KEY_Init();
	//init_FlashBuf();//初始化读取存储数据
	setNum =  100; 
	//Lcd_GPIO_init();  //初始化lcd引脚
	//Lcd_Init();		  //初始化lcd屏幕
	 
	buzzer= 1;
	delay_ms(200);
	buzzer= 0;
	 printf("Start.....");
	Timerx_Init(5000,7199);   //10Khz的计数频率，计数到5000为500ms 
	UltrasonicWave_Configuration();               //对超声波模块初始化
	 
	 while(1)
	{
		//CheckKey();//按键处理		
		//if(disFlag==1)					//显示
		{
			disFlag = 0;	//清空标志
			
			UltrasonicWave_StartMeasure();  //超声波开始测距，发送一个>10us的脉冲，然后测量返回的高电平时间			
						
			sprintf(dis0,"now: %04dmm  ",UltrasonicWave_Distance);
			//Lcd_Puts(0,0,(unsigned char *)dis0);	//初始化显示			
			
			if(SetFlag == 0){//按键设置标志			
				sprintf(dis1,"set:  %03d    ",setNum); //打印
			}
			else if(SetFlag == 1){//按键设置标志			
				sprintf(dis1,"set:> %03d s  ",setNum); //打印
			}			
			//Lcd_Puts(0,1,(unsigned char *)dis1);	//初始化显示 	
			
	 printf("now: %04dmm setNum %d \n",UltrasonicWave_Distance,setNum);
			if(UltrasonicWave_Distance<setNum){//低于0.5m			
				buzzer = !buzzer;			//报警
				ctrlPin = 1;//动作
			}
			else {
				buzzer = 0; //不报警
				ctrlPin = 0;//动作
			}			
	 				
		}	
	}											    
}	
 

void CheckKey(void)
{ 
	static unsigned  char rekey =0;
	if((key1==0)||(key2==0)||(key3==0))		 //检测到按键按下
	{
		delay_ms(20);   //小抖动
		if(rekey==0)
		{
			if(key1==0)    //检测是否按下
			{
				rekey=1; 
				
				if(SetFlag ) {
					SetFlag = 0;									
				}
				else{
						SetFlag = 1;									
				}
			}	
			else if(key2==0)//设置值键
			{ 
//				rekey=1;
				if(SetFlag==1){      //处于设置1				
					if(setNum < 999 ){
						setNum=setNum+1;
					}
				}				
			}
			else if(key3==0)//设置值键
			{
//				rekey=1;	
				if(SetFlag==1){      //处于设置1				
					if(setNum > 10 ){
						setNum=setNum-1;
					}
				}
			}	
			write_FlashBuf();//存储数据			
		}
	}
	else
	{
		rekey=0;    //防止重复检测到按键
	}
}





 




