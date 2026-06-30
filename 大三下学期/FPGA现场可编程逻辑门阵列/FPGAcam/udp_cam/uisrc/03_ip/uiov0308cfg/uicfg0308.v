`timescale 1ns / 1ps
/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop: https://milianke.taobao.com
*Create Date: 2021/04/25
*Module Name:
*File Name:
*Description: 
*The reference demo provided by Milianke is only used for learning. 
*We cannot ensure that the demo itself is free of bugs, so users 
*should be responsible for the technical problems and consequences
*caused by the use of their own products.
*Copyright: Copyright (c) MiLianKe
*All rights reserved.
*Revision: 1.0
*Signal description
*1) _i input
*2) _o output
*3) _n activ low
*4) _dg debug signal 
*5) _r delay or register
*6) _s state mechine
*********************************************************************/

module uicfg0308#(
parameter	 CLK_DIV  = 16'd499
)
(
input  clk_i,
input  rst_n,
output cmos_scl,
inout  cmos_sda,
output reg cfg_done
);
localparam DEVID   =  8'h42;  //摄像头硬件ID

//内部计数器产生一个延迟复位
reg[7:0] rst_cnt =0;
always@(posedge clk_i or negedge rst_n)  
    if(rst_n == 1'b0) //复位初始化寄存器
        rst_cnt<= 8'd0; 
    else if(rst_cnt[7] == 1'b0)
       rst_cnt <= rst_cnt + 1'b1; 
    else 
       rst_cnt <= rst_cnt; 

reg  iic_req;//请求操作I2C控制器信号
wire ic_busy; //I2C控制器忙信号 
reg  [31:0] wr_data;     //写数据寄存器
reg  [1 :0] TS_S = 2'd0; //状态机寄存器
reg  [8 :0] reg_index;   //寄存索引
wire [23:0] REG_DATA;    //寄存器数据
wire [8 :0] REG_SIZE;    //寄存器数量

always@(posedge clk_i ) begin 
    if(rst_cnt[7] == 1'b0)begin //复位初始化寄存器
        reg_index<= 9'd0;
        iic_req  <= 1'b0;
        wr_data  <= 32'd0;
        cfg_done <= 1'b0;
        TS_S     <= 2'd0;    
    end
    else begin
        case(TS_S)
        0:if(reg_index == REG_SIZE) //如果配置完成
            cfg_done <= 1'b1;       //设置 cfg_done标准
          else if(cfg_done == 1'b0) //如果未配置完成
            TS_S <= 2'd1;           //下一个状态
        1:if(!iic_busy)begin        //当总线非忙，才可以操作I2C控制器
            iic_req  <= 1'b1;       //请求操作I2C控制器
            wr_data[7  :0] <= DEVID;// ov5640 id 
			wr_data[15 :8] <= REG_DATA[15: 8];  //器件地址   
			wr_data[23:16] <= REG_DATA[7 : 0];  // 寄存器数据   
            TS_S      <= 2'd2; //下一个状态
        end    
        2:if(iic_busy)begin
             iic_req  <= 1'b0;  //重置 iic_req =0
             TS_S     <= 2'd3;  //下一个状态
        end
        3:if(!iic_busy)begin  //当总线非忙，才可以操作I2C控制器 
			reg_index<= reg_index + 1'b1;//寄存器索引加1
			TS_S    <= 2'd0;//回到初始状态
        end 
        endcase
   end
end


//例化I2C控制模块
uii2c#
(
.WMEN_LEN(5),     //最大支持一次写入4BYTE(包含器件地址)
.RMEN_LEN(1),     //最大支持一次读出1BYTE
.CLK_DIV(CLK_DIV) //100KHZ I2C总线时钟
)
uii2c_inst
(
.clk_i(clk_i),//系统时钟
.rstn_i(rst_cnt[7]),//系统复位
.iic_scl(cmos_scl),//I2C SCL总线时钟
.iic_sda(cmos_sda),//I2C SDA数据总线
.wr_data(wr_data),//写数据寄存器
.wr_cnt(8'd3),//需要写的数据BYTES
.rd_data(),   //读数据寄存器
.rd_cnt(8'd0),//需要读的数据BYTES
.iic_mode(1'b0),//读模式设置
.iic_req(iic_req),//I2C控制器请求
.iic_busy(iic_busy)//I2C控制器忙
);


// 5640reg
ui0308reg ui0308reg_inst
(
.REG_SIZE(REG_SIZE),
.REG_INDEX(reg_index),
.REG_DATA(REG_DATA)
);   

endmodule
