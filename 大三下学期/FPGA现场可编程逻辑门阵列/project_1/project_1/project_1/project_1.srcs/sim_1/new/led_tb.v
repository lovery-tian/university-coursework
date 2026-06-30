`timescale 1ns / 1ps

module led_tb();

 reg sysclk;
 reg rstn;
 wire led;

initial begin
    sysclk = 0;
    rstn  = 0;
    #100;
    rstn  = 1;
end

// 50MHz 时钟 (20ns 翻转一次)
always #20 sysclk = ~sysclk;

// 例化被测试模块（修复语法错误）
led #(
    .CNT_MAX(999)
)
ut_led
(
    .i_sysclk(sysclk),
    .i_rstn(rstn),
    .o_led(led)
);

endmodule