#include "1602.h"	
#include "delay.h"
#include <stdio.h>

void GPIO_InitStructReadtempCmd(void)
{
  GPIO_InitTypeDef	GPIO_InitStructure;
	
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB,ENABLE);

	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_All;//|GPIO_Pin_11|GPIO_Pin_10|GPIO_Pin_9|GPIO_Pin_8|GPIO_Pin_13|GPIO_Pin_14|GPIO_Pin_15;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;	
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;	
	GPIO_Init(GPIOB, &GPIO_InitStructure);			
				
}
void lcd_busy_wait(void) /*LCD1602 忙等待*/
{
	u8 sta;
    LCD1602_RS0;		 
    LCD1602_RW1;
	  lcd_data_port &= 0xffff00ff;
    lcd_data_port |= 0xff<<8;
	{
	  LCD1602_EN1;
		delay_ms(5);	
 		sta = GPIO_ReadInputDataBit(GPIOB, GPIO_Pin_15);
		LCD1602_EN0;
	}while(sta & 0x80);
}
void lcd_command_write( unsigned char command) /*LCD1602 命令字写入*/
{
    lcd_busy_wait();
    LCD1602_RS0;
    LCD1602_RW0;
    LCD1602_EN0;
	  lcd_data_port &= 0xffff00ff;
    lcd_data_port |= command<<8;
    LCD1602_EN1;
    LCD1602_EN0;     
}
void lcd_system_reset(void) /*LCD1602 初始化*/
{
 	lcd_command_write(0x38);	//16*2显示，5*7点阵，8位数据口
	delay_ms(5);
	lcd_command_write(0x0c);	//开显示，光标关闭
	delay_ms(5);
	lcd_command_write(0x06);	//文字不动，地址自动+1
	delay_ms(5);
	lcd_command_write(0x01);	//清屏
	delay_ms(5);	
}

 void lcd_char_write(unsigned int x_pos,unsigned int y_pos,unsigned char lcd_dat) /*LCD1602 字符写入*/
{
    x_pos &= 0x0f; 
    y_pos &= 0x01; 
    if(y_pos==1) x_pos += 0x40;
    x_pos += 0x80;
    lcd_command_write(x_pos);
    lcd_busy_wait();
	  LCD1602_RS1;
    LCD1602_RW0;
    LCD1602_EN0;
	  lcd_data_port &= 0xffff00ff;
    lcd_data_port |= (lcd_dat<<8);
    LCD1602_EN1;
    LCD1602_EN0; 
}
   


