#include "led.h"
#include "delay.h"
#include "sys.h"
#include "usart.h"
#include <stdio.h>
#include "timer.h"
#include "key.h"
#include "1602.h"
#include "UltrasonicWave.h"
#include "stmflash.h"  

#define FLASH_SAVE_ADDR  0X08010000 	
//stm32f103R8T6 flash???? 0x8010000-0x801FFFF
//stm32f103C8T6 flash???? 0x8000000-0x807FFFF

#define SIZE 10	 	//????
unsigned char  setFlashBuf[10];//????'

char dis0[17]; //??????
char dis1[17];

unsigned char i;

unsigned int setNum = 500;	//?????
unsigned char SetFlag  =0; //????


unsigned char initFlagData;	//????????

extern unsigned int UltrasonicWave_Distance;


void write_FlashBuf(void)
{
	setFlashBuf[0] = initFlagData;
	setFlashBuf[1] =  setNum / 256;  //?????
	setFlashBuf[2] =  setNum % 256; 
//	setFlashBuf[3] =  setL / 256; 
//	setFlashBuf[4] =  setL % 256; 
	STMFLASH_Write(FLASH_SAVE_ADDR,(u16*)setFlashBuf,SIZE);		//????	
	
}


void read_FlashBuf(void)
{
	STMFLASH_Read(FLASH_SAVE_ADDR,(u16*)setFlashBuf,SIZE); //??flash?

	initFlagData = setFlashBuf[0]; //???????	
	setNum  = setFlashBuf[1];	//?????
	setNum <<= 8;
	setNum  |= setFlashBuf[2];	 //????? ???
//	setL   = setFlashBuf[3];
//	setL <<= 8;
//	setL   |= setFlashBuf[4];
}

/**************??????????*****************/
void init_FlashBuf(void)
{
	read_FlashBuf(); //??flash?
	if(initFlagData != 0x55)		//????????????eeprom ????0x55????
	{
		setNum =  500;//????
//		setL =  35;//????
		initFlagData = 0x55;   //???
		delay_ms(20);
		write_FlashBuf();		//????
	}	
}


void CheckKey(void);
int main(void)
 { 
	 int i,j;
  NVIC_Configuration();	 
	delay_init();	    	   
	uart_init(9600);	 
	 
	GPIO_InitStructReadtempCmd();
  lcd_system_reset();
	lcd_command_write(0x01);	

  TIM3_Int_Init(499,7199);//50ms 
 	 
	LED_Init();		  		
	KEY_Init();
	//init_FlashBuf();//?????????	 
	buzzer= 1;
	delay_ms(100);
	buzzer= 0;
	 
	Timerx_Init(5000,7199);   
  UltrasonicWave_Configuration();  		
	
while(1)
	{
		CheckKey();		
		if(disFlag==1)					
		{
			disFlag = 0;	
			
			UltrasonicWave_StartMeasure();  			
					   	
			sprintf(dis0,"NOW: %04dmm  XUJIN",UltrasonicWave_Distance);
			for(i=0;i<13;i++) 
						{							
					    lcd_char_write(i,0,dis0[i]); 								
					  }				
			if(SetFlag == 0){			
				sprintf(dis1,"Set:  %03d  Xu",setNum); 
			}
			if(SetFlag == 1){			
				sprintf(dis1,"Set:>%03ds  Xu",setNum); 
			}			
			for(j=0;j<13;j++) 
						{							
					    lcd_char_write(j,1,dis1[j]); 		//?? 								
					  }	
			
			if(UltrasonicWave_Distance<setNum){	
				buzzer = !buzzer;			
				ctrlPin = 1;
			}
			else {
				buzzer = 0; 
				ctrlPin = 0;
			}			
	 				
		}	
	}											    
}	
 
void CheckKey(void)
{ 
	static unsigned  char rekey =0;
	if((key1==0)||(key2==0)||(key3==0))		
	{
		delay_ms(20);   //???
		if(rekey==0)
		{
			if(key1==0)    //??????
			{
				rekey=1;	
				if(SetFlag ) {
					SetFlag = 0;									
				}
				else{
						SetFlag = 1;									
				}
			}	
			else if(key2==0)//????
			{
//				rekey=1;
				if(SetFlag==1){      //????1				
					if(setNum < 999 ){
						setNum=setNum+1;
					}
				}				
			}
			else if(key3==0)//????
			{
//				rekey=1;	
				if(SetFlag==1){      //????1				
					if(setNum > 10 ){
						setNum=setNum-1;
					}
				}
			}	
			write_FlashBuf();//????			
		}
	}
	else
	{
		rekey=0;    //?????????
	}
}





