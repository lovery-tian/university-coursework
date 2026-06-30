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

 char dis0[17]; 
 char dis1[17];

unsigned char disFlag=0;

unsigned int ns_gre_Num=10;
unsigned int ns_yel_Num=0; 
unsigned int ns_red_Num=0; 
unsigned int ew_gre_Num=0;	
unsigned int ew_yel_Num=0;	
unsigned int ew_red_Num=13;	

unsigned char step = 1;	 
unsigned char firstAdd_ns =0;	   
unsigned char firstAdd_ew =0;

void CheckKey(void);
int main(void)
 { 
	delay_init();	    		  
	uart_init(9600);	 
  TIM3_Int_Init(499,7199);
	MyLED_Init(); 
	KEY_Init(); 
	 
	Lcd_GPIO_init();  
	Lcd_Init();		  
	delay_ms(50);

	ew_GREEN = 0;	
	ew_YELLOW = 0;
	ew_RED = 0;
	ns_GREEN1 = 0;
	ns_YELLOW1 = 0;
	ns_RED1 = 0;
	delay_ms(50); 
	ew_GREEN = 1;	
	ew_YELLOW = 1;
	ew_RED = 1;
	ns_GREEN1 = 1;
	ns_YELLOW1 = 1;
	ns_RED1 = 1;

	sprintf(dis0,"SN R%02d Y%02d G%02d  ",ns_red_Num,ns_yel_Num,ns_gre_Num);   
	Lcd_Puts(0,0,(u8*)dis0); 		
	sprintf(dis1,"EW R%02d Y%02d G%02d  ",ew_red_Num,ew_yel_Num,ew_gre_Num);  
	Lcd_Puts(0,1,(u8*)dis1); 		

	step =1;	   	
	ns_gre_Num=10;
	ns_yel_Num=0;
	ns_red_Num=0;
	ew_gre_Num=0;
	ew_yel_Num=0;
	ew_red_Num=13;
  firstAdd_ns =0;firstAdd_ew= 0;
		
	while(1)
	{
		if(disFlag == 1) 
		{
			disFlag =0;
			sprintf(dis0,"SN R%02d Y%02d G%02d  ",ns_red_Num,ns_yel_Num,ns_gre_Num);   
			Lcd_Puts(0,0,(u8*)dis0); 		
			sprintf(dis1,"EW R%02d Y%02d G%02d  ",ew_red_Num,ew_yel_Num,ew_gre_Num);  
			Lcd_Puts(0,1,(u8*)dis1); 	
			if(ns_gre_Num>0)  
			{ns_GREEN1 = 0 ;} 
			else
			{
				ns_GREEN1 =1;
			}
		
			if(ns_yel_Num>0)  
			{ns_YELLOW1 = 0 ;}
			else
			{ns_YELLOW1 =1;}
		
			if(ns_red_Num>0)  
			{ns_RED1 = 0 ;}
			else
			{ns_RED1 =1;}
		
			if(ew_gre_Num>0)   
			{ew_GREEN = 0 ;}
			else
			{ew_GREEN =1;}
		
			if(ew_yel_Num>0)	 
			{ew_YELLOW = 0 ;}
			else
			{ew_YELLOW =1;}
		
			if(ew_red_Num>0)   
			{ew_RED = 0 ;}
			else
			{ew_RED =1;}
		
		}
		
		CheckKey();
	}											    
}	
 

void CheckKey(void)
{
	static unsigned  char rekey =0;
	if((key1==0)||(key2==0))		 
	{
		delay_ms(20);  
		if(rekey==0)
		{
			if(key1==0)    
			{
				rekey=1;	
				if(ew_gre_Num>0)
				{	
					if(firstAdd_ew==0)	  
					{
						ns_red_Num = ns_red_Num+10;	
						ew_gre_Num = ew_gre_Num+10;
						firstAdd_ew= 1;			  
					} 
				}
	
			}	
			else if(key2==0)
			{
				rekey=1;
				if(ns_gre_Num>0)
				{	
					if(firstAdd_ns==0)	
					{
						ns_gre_Num = ns_gre_Num+10;		
						ew_red_Num = ew_red_Num+10;
						firstAdd_ns= 1;			   
					} 
				}				
			}
		}
	}
	else
	{
		rekey=0;    
	}	
}

void dealOneSecond(void) 
{
	if(step==1)			   
	{
		if(ns_gre_Num>0)   
		{
			ns_gre_Num--;
			ew_red_Num--;			
		}
		if(ns_gre_Num==0) 	   
		{
			step = 2;
			ns_gre_Num=0;
			ns_yel_Num=3;
			ns_red_Num=0;
		}		
	}
	else if(step==2)
	{
		if(ns_yel_Num>0)
		{
			ns_yel_Num--;
			ew_red_Num--;			
		}
		if(ns_yel_Num==0) 	  
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
		if(ew_gre_Num==0)  
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
		if (ew_yel_Num==0)	 
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


