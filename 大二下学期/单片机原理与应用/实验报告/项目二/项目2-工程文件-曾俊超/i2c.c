#include <reg51.h>
#include "i2c.h"

void I2C_Init() {
    // 初始化代码
}

void I2C_WriteByte(uchar address, uchar data) {
    uchar i;
    for (i = 0; i < 8; i++) {
        if (data & 0x80) {
            // 发送1
        } else {
            // 发送0
        }
        data <<= 1;
    }
}