`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 08:43:05
// Design Name: 
// Module Name: clk_div_tb
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

`timescale 1ns / 1ps

module clk_div_tb();

// 输入
reg i_sysclk;
reg i_rstn;

// 输出
wire o_div2;
wire o_div3;
wire o_div4;
wire o_div8;

// 例化被测模块
clk_div u_clk_div (
    .i_sysclk(i_sysclk),
    .i_rstn  (i_rstn),
    .o_div2  (o_div2),
    .o_div3  (o_div3),
    .o_div4  (o_div4),
    .o_div8  (o_div8)
);

// 生成时钟：50MHz，周期20ns
initial begin
    i_sysclk = 1'b0;
    forever #20 i_sysclk = ~i_sysclk;
end

// 生成复位激励
initial begin
    i_rstn = 1'b0;
    #100;
    i_rstn = 1'b1;
    #10000;
    $stop;
end

endmodule
