`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/21 08:31:19
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input i_sysclk,
    input i_rstn,
    output o_div2,
    output o_div3,
    output o_div4,
    output o_div8
);

// 2分频
reg r_div2;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        r_div2 <= 1'b0;
    else
        r_div2 <= ~r_div2;
end

// 4分频、8分频计数器
reg [1:0] div_cnt;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        div_cnt <= 2'b00;
    else
        div_cnt <= div_cnt + 1'b1;
end

// 4分频
reg r_div4;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        r_div4 <= 1'b0;
    else if(div_cnt == 2'b00 || div_cnt == 2'b10)
        r_div4 <= ~r_div4;
end

// 8分频
reg r_div8;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        r_div8 <= 1'b0;
    else if(div_cnt == 2'b00)
        r_div8 <= ~r_div8;
end

// 3分频：上升沿计数器
reg [1:0] pos_cnt;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        pos_cnt <= 2'b00;
    else if (pos_cnt == 2'd2)
        pos_cnt <= 2'b00;
    else
        pos_cnt <= pos_cnt + 1'b1;
end

// 3分频：下降沿计数器
reg [1:0] neg_cnt;
always@ (negedge i_sysclk) begin
    if(!i_rstn)
        neg_cnt <= 2'b00;
    else if(neg_cnt == 2'd2)
        neg_cnt <= 2'b00;
    else
        neg_cnt <= neg_cnt + 1'b1;
end

// 3分频：上升沿输出
reg r_div3_pos;
always@ (posedge i_sysclk) begin
    if(!i_rstn)
        r_div3_pos <= 1'b0;
    else if(pos_cnt < 2'd1)
        r_div3_pos <= 1'b1;
    else
        r_div3_pos <= 1'b0;
end

// 3分频：下降沿输出
reg r_div3_neg;
always@ (negedge i_sysclk) begin
    if(!i_rstn)
        r_div3_neg <= 1'b0;
    else if(neg_cnt < 2'd1)
        r_div3_neg <= 1'b1;
    else
        r_div3_neg <= 1'b0;
end

// 3分频合并输出
assign o_div3 = r_div3_pos | r_div3_neg;

// 最终输出
assign o_div2 = r_div2;
assign o_div4 = r_div4;
assign o_div8 = r_div8;

endmodule
