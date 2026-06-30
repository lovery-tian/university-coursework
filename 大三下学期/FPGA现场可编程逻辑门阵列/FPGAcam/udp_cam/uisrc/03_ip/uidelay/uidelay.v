
/*******************************MILIANKE*******************************
*Company : MiLianKe Electronic Technology Co., Ltd.
*WebSite:https://www.milianke.com
*TechWeb:https://www.uisrc.com
*tmall-shop:https://milianke.tmall.com
*jd-shop:https://milianke.jd.com
*taobao-shop1: https://milianke.taobao.com
*Create Date: 2019/12/17
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

/*********uidelay 复位延迟模块***********
--版本号1.0
--让复位时间低电平延迟DELAY_CLK_NUM个时钟周期，增加复位时间

*********************************************************************/

`timescale 1ns / 1ns

module uidelay#
(
parameter  integer DELAY_CLK_NUM = 1000
)
(
input clk_i,
input rstn_i,
output rst_o
);

reg[31:0] cnt = 32'd0;
reg rst_d0;

/*count for clock*/

always@(posedge clk_i or negedge rstn_i)begin 
    if(!rstn_i)
       cnt<=32'd0; 
    else if(cnt < DELAY_CLK_NUM)
	   cnt <= cnt + 1'b1;
end

/*generate output signal*/
always@(posedge clk_i or negedge rstn_i)begin
    if(!rstn_i)
        rst_d0 <= 1'b0; 
    else 
	   rst_d0 <= ( cnt == DELAY_CLK_NUM);
end	

assign rst_o = rst_d0;

endmodule

