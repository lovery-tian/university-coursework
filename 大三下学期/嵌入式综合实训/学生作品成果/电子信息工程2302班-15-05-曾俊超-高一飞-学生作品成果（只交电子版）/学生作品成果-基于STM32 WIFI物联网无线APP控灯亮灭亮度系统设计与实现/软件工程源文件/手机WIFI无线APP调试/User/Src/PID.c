#include "PID.h"


//1.增量式pid
//定义PID相关宏
// 这三个参数设定对电机运行影响非常大
/*************************************/
float   Proportion=5;                               //比例常数 Proportional Const
float   Integral=0.5;                                 //积分常数 Integral Const
float   Derivative=0;                                 //微分常数 Derivative Const

/********************增量式PID控制设计************************************/
//NextPoint当前输出值
//SetPoint设定值

//左轮PID
int PID_Calc_Left(int NextPoint,int SetPoint) 
{
                             
	static int      LastError;                                //Error[-1]
	static int      PrevError;                                //Error[-2]
  int iError,Outpid;                                        //当前误差
	
  iError=SetPoint-NextPoint;                                //增量计算
  Outpid=(Proportion * iError)                              //E[k]项
              -(Integral * LastError)                       //E[k-1]项
              +(Derivative * PrevError);                    //E[k-2]项
              
  PrevError=LastError;                                      //存储误差，用于下次计算
  LastError=iError;
  return(Outpid);                                           //返回增量值
}


//右轮PID
int PID_Calc_Right(int NextPoint,int SetPoint) 
{                      
	static int      LastError;                                //Error[-1]
	static int      PrevError;                                //Error[-2]
  int iError,Outpid;                                        //当前误差
	
  iError=SetPoint-NextPoint;                                //增量计算
  Outpid=(Proportion * iError)                              //E[k]项
              -(Integral * LastError)                       //E[k-1]项
              +(Derivative * PrevError);                    //E[k-2]项
              
  PrevError=LastError;                                      //存储误差，用于下次计算
  LastError=iError;
  return(Outpid);                                           //返回增量值
}





