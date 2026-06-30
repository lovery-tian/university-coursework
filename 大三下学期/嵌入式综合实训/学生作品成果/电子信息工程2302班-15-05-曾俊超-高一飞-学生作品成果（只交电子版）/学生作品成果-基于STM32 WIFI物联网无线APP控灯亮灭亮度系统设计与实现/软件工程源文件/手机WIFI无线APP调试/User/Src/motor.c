#include "motor.h"

/**
 *    @brief 控制电机进行正转、反转、停止
 *    @param None
 *    @retval None
 */


void RightMotor_Go() //左电机正转 AIN输出相反电平  BIN也输出相反电平
{
    HAL_GPIO_WritePin(AIN1_GPIO_Port, AIN1_Pin, GPIO_PIN_SET);
    HAL_GPIO_WritePin(AIN2_GPIO_Port, AIN2_Pin, GPIO_PIN_RESET);
}
void RightMotor_Back()  //左电机反转
{
    HAL_GPIO_WritePin(AIN1_GPIO_Port, AIN1_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(AIN2_GPIO_Port, AIN2_Pin, GPIO_PIN_SET);
}
void RightMotor_Stop()  //左电机停止 AIN和BIN输出相同电平
{
    HAL_GPIO_WritePin(AIN1_GPIO_Port, AIN1_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(AIN2_GPIO_Port, AIN2_Pin, GPIO_PIN_RESET);
}


void LeftMotor_Go() //右电机正转 AIN输出相反电平  BIN也输出相反电平
{
    HAL_GPIO_WritePin(BIN1_GPIO_Port, BIN1_Pin, GPIO_PIN_SET);
    HAL_GPIO_WritePin(BIN2_GPIO_Port, BIN2_Pin, GPIO_PIN_RESET);
}
void LeftMotor_Back()  //右电机反转
{
    HAL_GPIO_WritePin(BIN1_GPIO_Port, BIN1_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(BIN2_GPIO_Port, BIN2_Pin, GPIO_PIN_SET);
}
void LeftMotor_Stop()  //右电机停止 AIN和BIN输出相同电平
{
    HAL_GPIO_WritePin(BIN1_GPIO_Port, BIN1_Pin, GPIO_PIN_RESET);
    HAL_GPIO_WritePin(BIN2_GPIO_Port, BIN2_Pin, GPIO_PIN_RESET);
}

/**
 *    @brief 控制电机进行速度控制
 *    @param 运动方向，左右电机的PWM值
 *    @retval None
 */
void MotorControl(char motorDirection, int leftMotorPWM, int rightMotorPWM) {
    switch (motorDirection) {
    case 0://直行
        LeftMotor_Go();
        RightMotor_Go();
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, rightMotorPWM);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, leftMotorPWM);
        break;
    case 1://后退
        LeftMotor_Back();
        RightMotor_Back();
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, rightMotorPWM);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, leftMotorPWM);
        break;
    case 2://停止
        LeftMotor_Stop();
        RightMotor_Stop();
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, 0);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
        break;
    case 3://左转弯
        LeftMotor_Back();
        RightMotor_Go();
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, rightMotorPWM);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, leftMotorPWM);
        break;
    case 4://右转弯
        LeftMotor_Go();
        RightMotor_Back();
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_4, rightMotorPWM);
        __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, leftMotorPWM);
        break;
    default:
        break;
    }
}

void turn_left(int angle,float battery)
{
    //构建电池电量 转动角度 与延时之间关系模型
    MotorControl(3,800,800);
    HAL_Delay(angle*10);
    MotorControl(2,0,0);

}

void turn_right(int angle,float battery)
{
    //构建电池电量 转动角度 与延时之间关系模型
    MotorControl(4,800,800);
    HAL_Delay(angle*10);
    MotorControl(2,0,0);

}















