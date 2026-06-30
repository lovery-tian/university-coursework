`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 08:30:04
// Design Name: 
// Module Name: led_contrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module led_contrl(
    input i_sysclk,
    input i_rstn,
    output [3:0] o_led
);

// 中间连线
wire w_div2;
wire w_div3;
wire w_div4;
wire w_div8;

// 例化分频器模块
clk_div clk_div_inst(
    .i_sysclk (i_sysclk),
    .i_rstn   (i_rstn),
    .o_div2   (w_div2),
    .o_div3   (w_div3),
    .o_div4   (w_div4),
    .o_div8   (w_div8)
);

// 分频结果输出到LED
assign o_led[3] = w_div2;
assign o_led[2] = w_div3;
assign o_led[1] = w_div4;
assign o_led[0] = w_div8;

endmodule
