#系统时钟周期约束
create_clock -period 40.000 -name sysclk [get_ports i_sysclk]

set_property PACKAGE_PIN V4 [get_ports i_sysclk]
set_property IOSTANDARD LVCMOS15 [get_ports i_sysclk]
set_property PACKAGE_PIN AB7 [get_ports i_rstn]
set_property IOSTANDARD LVCMOS15 [get_ports i_rstn]
set_property PULLUP true [get_ports i_rstn]
#绑定 led 输出管脚到 FPGA IO 上
set_property PACKAGE_PIN M16 [get_ports {o_led[3]}]
set_property PACKAGE_PIN K13 [get_ports {o_led[2]}]
set_property PACKAGE_PIN M15 [get_ports {o_led[1]}]
set_property PACKAGE_PIN H15 [get_ports {o_led[0]}]

set_property IOSTANDARD LVCMOS25 [get_ports {o_led[*]}]
#bit compress
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
