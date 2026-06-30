`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/02 10:40:30
// Design Name: 
// Module Name: led
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


module led #( 

parameter CNT_MAX = 24_999_999
  )
(
 input i_sysclk,
 input i_rstn,
 output o_led
 );
 
 reg[24:0] cnt;
 reg led_state;
 
 always @(posedge i_sysclk or negedge i_rstn)begin
    if(!i_rstn)begin
        cnt <=0;
        led_state <=0;
    end
    else begin
        if (cnt == CNT_MAX)begin
            cnt <=0;
            led_state <= ~led_state;
        end
        else begin
        cnt <= cnt  +1;      
        end
    end  
 end
 assign o_led = led_state;
 
endmodule
