#include "led.h"
#include "delay.h"
#include "sys.h"
#include "usart.h"
#include <stdio.h>
#include "timer.h"
#include "key.h"
#include "adc.h"
#include "myled.h"
#include "lcd1602.h" 

char dis0[17]; //暂存数组
char dis1[17];

unsigned char disFlag=0;//更新显示标志

unsigned int ns_gre_Num=10;//南北绿灯时间
unsigned int ns_yel_Num=0; //南北黄灯时间
unsigned int ns_red_Num=0; //南北红灯时间
unsigned int ew_gre_Num=0;	//东西绿灯时间
unsigned int ew_yel_Num=0;	//东西黄灯时间
unsigned int ew_red_Num=13;	//东西红灯时间

unsigned char step = 1;	 //运行阶段计数
unsigned char firstAdd_ns =0;	   //加时标志
unsigned char firstAdd_ew =0;

void CheckKey(void);
int main(void)
 {   
	int i=1,iSum=0;
	while(i<=10)
	{
		iSum=iSum+i;
		i++;
	}
	printf("\n 1+2+3+...+10= %d\n",iSum); 

	 
	 
	delay_init();	    	 //延时函数初始化	  
	uart_init(9600);	 	//串口初始化
//	uart2_init(9600)	;
  TIM3_Int_Init(499,7199);// 初始化定时器 
	MyLED_Init(); //初始化输出
	KEY_Init(); //初始化输入
	 
	Lcd_GPIO_init();  //初始化lcd引脚
	Lcd_Init();		  //初始化lcd屏幕
	delay_ms(50);

	ew_GREEN = 0;	//初始化 灯亮一下 方便检测
	ew_YELLOW = 0;
	ew_RED = 0;
	ns_GREEN1 = 0;
	ns_YELLOW1 = 0;
	ns_RED1 = 0;
	delay_ms(200); 
	ew_GREEN = 1;	//初始化 灯亮一下 方便检测
	ew_YELLOW = 1;
	ew_RED = 1;
	ns_GREEN1 = 1;
	ns_YELLOW1 = 1;
	ns_RED1 = 1;

	sprintf(dis0,"SN R%02d Y%02d G%02d  ",ns_red_Num,ns_yel_Num,ns_gre_Num);   //打印数据
	Lcd_Puts(0,0,(u8*)dis0); 		//显示
	sprintf(dis1,"EW R%02d Y%02d G%02d  ",ew_red_Num,ew_yel_Num,ew_gre_Num);  
	Lcd_Puts(0,1,(u8*)dis1); 		//显示

	step =1;	   	//交通灯第一步 南北绿灯 东西红灯数据填充
	ns_gre_Num=10;
	ns_yel_Num=0;
	ns_red_Num=0;
	ew_gre_Num=0;
	ew_yel_Num=0;
	ew_red_Num=13;
  firstAdd_ns =0;firstAdd_ew= 0;//加时标志
		
	while(1)
	{
		if(disFlag == 1) //更新显示标志
		{
			disFlag =0;//显示标志清零
			sprintf(dis0,"SN R%02d Y%02d G%02d  ",ns_red_Num,ns_yel_Num,ns_gre_Num);   //打印数据
			Lcd_Puts(0,0,(u8*)dis0); 		//显示
			sprintf(dis1,"EW R%02d Y%02d G%02d  ",ew_red_Num,ew_yel_Num,ew_gre_Num);  
			Lcd_Puts(0,1,(u8*)dis1); 		//显示	

			if(ns_gre_Num>0)   //任何灯指示数据和指示灯匹配显示
			{ns_GREEN1 = 0 ;} //点亮对应灯
			else
			{
				ns_GREEN1 =1;
			}
		
			if(ns_yel_Num>0)  //任何灯指示数据和指示灯匹配显示
			{ns_YELLOW1 = 0 ;}//点亮对应灯
			else
			{ns_YELLOW1 =1;}//关闭对应灯
		
			if(ns_red_Num>0)  //任何灯指示数据和指示灯匹配显示
			{ns_RED1 = 0 ;}//点亮对应灯
			else
			{ns_RED1 =1;}//关闭对应灯
		
			if(ew_gre_Num>0)   //任何灯指示数据和指示灯匹配显示
			{ew_GREEN = 0 ;}//点亮对应灯
			else
			{ew_GREEN =1;}//关闭对应灯
		
			if(ew_yel_Num>0)	 //任何灯指示数据和指示灯匹配显示
			{ew_YELLOW = 0 ;}//点亮对应灯
			else
			{ew_YELLOW =1;}//关闭对应灯
		
			if(ew_red_Num>0)   //任何灯指示数据和指示灯匹配显示
			{ew_RED = 0 ;}//点亮对应灯
			else
			{ew_RED =1;}//关闭对应灯
		
		}
		
		CheckKey();
	}											    
}	
 

void CheckKey(void)
{
	static unsigned  char rekey =0;
	if((key1==0)||(key2==0))		 //检测到按键按下
	{
		delay_ms(20);   //小抖动
		if(rekey==0)
		{
			if(key1==0)    //检测是否按下
			{
				rekey=1;	
				if(ew_gre_Num>0)
				{	
					if(firstAdd_ew==0)	  //南北绿灯时 检测数量 超过5
					{
						ns_red_Num = ns_red_Num+10;	//相应参数+10
						ew_gre_Num = ew_gre_Num+10;
						firstAdd_ew= 1;			  //一个循环只允许进来一次
					} 
				}
	
			}	
			else if(key2==0)//设置值键
			{
				rekey=1;
				if(ns_gre_Num>0)
				{	
					if(firstAdd_ns==0)	//南北绿灯时 检测数量 超过5
					{
						ns_gre_Num = ns_gre_Num+10;		//相应参数+10
						ew_red_Num = ew_red_Num+10;
						firstAdd_ns= 1;			   //一个循环只允许进来一次
					} 
				}				
			}
		}
	}
	else
	{
		rekey=0;    //防止重复检测到按键
	}	
}

void dealOneSecond(void) //1s 处理一次
{
	if(step==1)			   
	{
		if(ns_gre_Num>0)   //交通灯第一步 南北指示灯 东西指示灯 时间处理
		{
			ns_gre_Num--;
			ew_red_Num--;			
		}
		if(ns_gre_Num==0) 	   //交通灯第二步 南北指示灯 东西指示灯数据填充
		{
			step = 2;
			ns_gre_Num=0;
			ns_yel_Num=3;
			ns_red_Num=0;
		}		
	}
	else if(step==2)
	{
		if(ns_yel_Num>0)//交通灯第二步 南北指示灯 东西指示灯 时间处理
		{
			ns_yel_Num--;
			ew_red_Num--;			
		}
		if(ns_yel_Num==0) 	  //交通灯第三步 南北指示灯 东西指示灯数据填充
		{
			step = 3;
			ns_gre_Num=0;
			ns_yel_Num=0;
			ns_red_Num=13;
			ew_gre_Num=10;
			ew_yel_Num=0;
			ew_red_Num=0;
			firstAdd_ew =0;
		}		
	}
	else if(step==3)
	{
		if(ew_gre_Num>0)
		{
			ew_gre_Num--;
			ns_red_Num--;			
		}
		if(ew_gre_Num==0)  //交通灯第三步 南北指示灯 东西指示灯数据填充
		{
			step = 4;
			ew_gre_Num=0;
			ew_yel_Num=3;
			ew_red_Num=0;
		}		
	}
	else if(step==4)
	{
		if(ew_yel_Num>0)
		{
			ew_yel_Num--;
			ns_red_Num--;			
		}
		if (ew_yel_Num==0)	 //交通灯第一步 南北指示灯 东西指示灯数据填充
		{
			step = 1;
			ns_gre_Num=10;
			ns_yel_Num=0;
			ns_red_Num=0;
			ew_gre_Num=0;
			ew_yel_Num=0;
			ew_red_Num=13;
			firstAdd_ns =0;
		}		
	}
}






