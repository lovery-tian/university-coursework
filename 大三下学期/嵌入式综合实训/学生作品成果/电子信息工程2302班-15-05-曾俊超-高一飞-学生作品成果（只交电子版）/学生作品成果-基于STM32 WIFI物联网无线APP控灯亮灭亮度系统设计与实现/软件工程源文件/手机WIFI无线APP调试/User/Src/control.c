#include "control.h"
#include "LED.h"
#include "encoder.h"
#include "tim.h"
#include "PID.h"



int Encoder_Left,Encoder_Right;         		 //左右编码器的脉冲计数

int count=0;


#define SPEED_RECORD_NUM 20 // 经测试，50Hz个采样值进行滤波的效果比较好

float speed_Record_L[SPEED_RECORD_NUM]={0};
float speed_Record_R[SPEED_RECORD_NUM]={0};

float test_Speed=0.0;
float Car_Speed_L=0,Car_Speed_R=0;

//int Encoder_Left = Car_Speed_L*0.1*2496/(3.14*65);
//int Encoder_Right = Car_Speed_R*0.1*2496/(3.14*65);

/*
 * 进行速度的平均滤波
 * 输入新采样到的速度，存放速度的数组，
 * 返回滤波后的速度
 */
float Speed_Low_Filter(float new_Spe,float *speed_Record)
{
    float sum = 0.0f;
    test_Speed = new_Spe;
    for(uint8_t i=SPEED_RECORD_NUM-1;i>0;i--)//将现有数据后移一位
    {
        speed_Record[i] = speed_Record[i-1];
        sum += speed_Record[i-1];
    }
    speed_Record[0] = new_Spe;//第一位是新的数据
    sum += new_Spe;
    test_Speed = sum/SPEED_RECORD_NUM;
    return sum/SPEED_RECORD_NUM;//返回均值
}

int para_L,para_R;//增量PID
int SetPointL=0;
int SetPointR=0;
int Moto_Left,Moto_Right;

void CAR_CONTROL()
{
	
	Encoder_Left=Read_Encoder(3);                            //读取编码器的值，保证输出极性一致
	Encoder_Right=-Read_Encoder(2);                          //读取编码器的值
	
	
	if(Encoder_Left<0)     //如果电机反转了
	{
		Encoder_Left = -Encoder_Left;
	}
	if(Encoder_Right<0)
	{
		Encoder_Right = -Encoder_Right;
	}
	
	
	Car_Speed_L = (Encoder_Left*65*3.14/2496)/0.1;
	Car_Speed_R = (Encoder_Right*65*3.14/2496)/0.1;
	
	
	//Car_Speed_L = Speed_Low_Filter(Car_Speed_L,speed_Record_L);
	//Car_Speed_R = Speed_Low_Filter(Car_Speed_R,speed_Record_R);
	
	
	
	
			
			
	para_L=PID_Calc_Left((int)Car_Speed_L,SetPointL);	       //左电机，计数得到增量式PID的增量数值 
	para_R=PID_Calc_Right((int)Car_Speed_R,SetPointR);	       //右电机，计数得到增量式PID的增量数值 
	
	if((para_L<-3)||(para_L>3))                        //不做 PID 调整，避免误差较小时频繁调节引起震荡。
	{
		Moto_Left +=para_L;  
	}   
	if((para_R<-3)||(para_R>3))                     //不做 PID 调整，避免误差较小时频繁调节引起震荡。
	{
		Moto_Right +=para_R;  
	}			
	
	
	if(Moto_Left>1000)
		Moto_Left=1000;    //限幅 防止烧毁电机
	else if(Moto_Left<0)
	{
		Moto_Left=0; 
	}
	
	if(Moto_Right>1000)
		Moto_Right=1000;  //限幅
	else if(Moto_Right<0)
	{
		Moto_Right=0; 
	}
	
	__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, Moto_Right);
	__HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, Moto_Left);
	
    count++;
    if(count == 100)
    {
        count=0;
        HAL_GPIO_TogglePin(LED_GPIO_Port,LED_Pin);
    }
}





