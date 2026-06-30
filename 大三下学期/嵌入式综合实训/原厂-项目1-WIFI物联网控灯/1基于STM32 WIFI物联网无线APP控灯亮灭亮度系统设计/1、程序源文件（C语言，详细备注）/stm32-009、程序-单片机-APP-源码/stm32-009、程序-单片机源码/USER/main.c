#include "led.h"
#include "delay.h"
#include "sys.h"
#include "timer.h"
#include "key.h"
#include "usart.h"	
#include <string.h>

unsigned char led1Count=0;	//led ¶Ô±ÈpwmÖµ¼ÆÊı
unsigned char led2Count=0;
unsigned char PWML_LED1=10;//led PWM ·¶Î§0-10
unsigned char PWML_LED2=10;

unsigned char BufTab[10]; //wifiÊı¾İÔİ´æ
unsigned char Count;	   //´®¿ÚÊı¾İ¼ÆÊı
unsigned char UartBusy=0;  //ÅĞ¶ÏÃ¦Âµ
unsigned char ReadFlag=0;//¶ÁÈ¡±êÖ¾
unsigned char sendDataFlag=0;	//·¢ËÍÊı¾İ±êÖ¾
u8 rebackFalg= 0; //Êı¾İ·µ»Ø±êÖ¾
u8 MesCount=0;	//·¢ËÍÄÚÈİ¼ÆÊı
unsigned char i ;
int main(void)
 {	
	delay_init();	    	 //ÑÓÊ±º¯Êı³õÊ¼»¯
	NVIC_Configuration();//ÉèÖÃNVICÖĞ¶Ï·Ö×é2:2Î»ÇÀÕ¼ÓÅÏÈ¼¶£¬2Î»ÏìÓ¦ÓÅÏÈ¼¶
	LED_Init();		  	//³õÊ¼»¯ÓëLEDÁ¬½ÓµÄÓ²¼ş½Ó¿ 
//	KEY_Init();
	uart_init(9600);
	TIM3_Int_Init(499,7199);//10KhzµÄ¼ÆÊıÆµÂÊ£¬¼ÆÊıµ½500Îª50ms 
	i=50;
	while(i--) delay_ms(100);
	printf("AT+CIPMUX=1\r\n");		   //ÔÊĞíÁ´½Ó
	i=10;
	while(i--) delay_ms(100);
	printf("AT+CIPSERVR=1,8080\r\n");	   //´´½¨¶Ë¿ÚºÅ8080//**All notes can be deleted and modified**//
	
	while(1)
	{  
		if(ReadFlag== 1)		//¶ÁÈ¡´®¿ÚÊı¾İ±êÖ¾
		{
			Count=0;					//´«ÊÚ½ÓÊÕ±äÁ¿ÇåÁã
			UartBusy=0;
			ReadFlag=0;				//¶ÁÈ¡±êÊ¶ÇåÁã

			if((strstr((const char *)BufTab,"PEN1")!=NULL)||(strstr((const char * )BufTab,"ED1-3")!=NULL))	 //½ÓÊÕµ½LPEN1 LED1-3
			{
			 	PWML_LED1=10;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char * )BufTab,(const char * )"LOSE1")!=NULL)	  //½ÓÊÕµ½CLOSE1
			{
			 	PWML_LED1=0;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"ED1-1")!=NULL)	   //½ÓÊÕµ½LED1-1
			{
			 	PWML_LED1=3;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"ED1-2")!=NULL)	  //½ÓÊÕµ½LED1-2
			{
			 	PWML_LED1=6;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if((strstr((const char *)BufTab,"PEN2")!=NULL)||(strstr((const char *)BufTab,"ED2-3")!=NULL))	 //½ÓÊÕµ½	OPEN2
			{
			 	PWML_LED2=10;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"LOSE2")!=NULL)	  //½ÓÊÕµ½LLOSE2
			{
			 	PWML_LED2=0;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"ED2-1")!=NULL)	   //½ÓÊÕµ½LED2-1
			{
			 	PWML_LED2=3;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"ED2-2")!=NULL)	 //½ÓÊÕµ½LED2-2
			{
			 	PWML_LED2=6;rebackFalg=1;//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			}
			else if(strstr((const char *)BufTab,"PENALL")!=NULL)	 //½ÓÊÕOENALL
			{
			 	PWML_LED1=10;PWML_LED2=10;rebackFalg=1;		//ÉèÖÃpwm ·¢ËÍ±êÖ¾ÖÃÎ»
			}
			else if(strstr((const char *)BufTab,"LOSEALL")!=NULL)	  //½ÓÊÕµ½CLOSEALL
			{
			 	PWML_LED1=0;PWML_LED2=0; rebackFalg=1;
			}
			for(i=0;i<10;i++)	   //Çå¿ÕwifiÊı¾İÊı×é
			{
				BufTab[i]='0';
			}

		if((sendDataFlag == 1)&&(rebackFalg != 0))//½ÓÊÕµ½Êıºó·µ»Øok			
		{
			if(MesCount == 0)			//·¢ËÍĞÅÏ¢¼ÆÊı
			{
				MesCount =1;
				printf("AT+CIPSEND=0,2\r\n");		//·¢ËÍ¹Ì¶¨×Ö½ÚÊı¾İµÄatÃüÁî
			}
			else
			{				
				if(rebackFalg ==1)		//·µ»Ø±êÖ¾ÖÃÎ»
				{printf("OK");}					//·¢ËÍok
				MesCount = 0;				   //·¢ËÍĞÅÏ¢¼ÆÊı
				rebackFalg = 0;
			}
			sendDataFlag =	0;		//¶¨Ê±·¢ËÍÊı¾İÇå¿Õ
		}			
		
			led1Count++;		//led ¶Ô±ÈpwmÖµ¼ÆÊı
			led2Count++;		//led ¶Ô±ÈpwmÖµ¼ÆÊı
			if(led1Count<PWML_LED1)	   //led1 PWM¶Ô±È
			{
				LED1=0;			  //¿ªµÆ
			}
			else if((led1Count>=PWML_LED1)&&(led1Count<=10))	 //led1 PWM¶Ô±È
			{
			 	LED1=1;			//¹ØµÆ
			}
			else
			{
				led1Count=0;  //Ò»¸öÖÜÆÚ½áÊø
			}
		
			if(led2Count<PWML_LED2)	   //led2 PWM¶Ô±È
			{
				LED2=0;			   //¿ªµÆ
			}
			else if((led2Count>=PWML_LED2)&&(led2Count<=10))	 //led2 PWM¶Ô±È
			{
			 	LED2=1;			//¹ØµÆ
			}
			else
			{
				led2Count=0;  //Ò»¸öÖÜÆÚ½áÊø
			}				
	}
}
 
