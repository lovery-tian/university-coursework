#include "reg52.h"
#include "config.h"

sbit BUZZ = P1^6;               // 蜂鸣器控制引脚

uint16 code NoteFrequ[] = {
    262, 294, 330, 349, 392, 440, 494,
    523, 578, 659, 698, 784, 880, 988,
    1046,1175,1318,1397,1568,1760,1976
};

uint16 code NoteReload[] = {
    65535-(11059200/12)/(262*2),
    65535-(11059200/12)/(294*2),
    65535-(11059200/12)/(330*2),
    65535-(11059200/12)/(349*2),
    65535-(11059200/12)/(392*2),
    65535-(11059200/12)/(440*2),
    65535-(11059200/12)/(494*2),
    65535-(11059200/12)/(523*2),
    65535-(11059200/12)/(578*2),
    65535-(11059200/12)/(659*2),
    65535-(11059200/12)/(698*2),
    65535-(11059200/12)/(784*2),
    65535-(11059200/12)/(880*2),
    65535-(11059200/12)/(988*2),
    65535-(11059200/12)/(1046*2),
    65535-(11059200/12)/(1175*2),
    65535-(11059200/12)/(1318*2),
    65535-(11059200/12)/(1397*2),
    65535-(11059200/12)/(1568*2),
    65535-(11059200/12)/(1760*2),
    65535-(11059200/12)/(1976*2),
};

uint16 TORH = 0xFF;
uint16 TORL = 0x00;
bit timeflag = 0;
bit enable = 1;

void PlayHappyBrithday();

void main()
{
    EA = 1;
    TMOD = 0x01;
    TH0 = TORH;
    TL0 = TORL;
    ET0 = 1;
    TR0 = 1;

    PlayHappyBrithday();      // 播放一次

    /* =====  播放结束，彻底关闭 ===== */
    EA  = 0;                  // 关总中断
    TR0 = 0;                  // 停定时器
    ET0 = 0;
    BUZZ = 1;                 // 蜂鸣器电平拉死

    while(1);                 // 永久停机
}

void PlayHappyBrithday()
{
    uint8 beat;
    uint8 note;
    uint16 time = 0;
    uint16 beatTime = 0;
    uint16 soundTime = 0;

    // 修正：音符表28个元素，节拍表也应该是28个
    const uint8 code HappyBrithdayNote[] = {
        5, 5, 6, 5, 8, 7,
        5, 5, 6, 5, 9, 8,
        5, 5, 12, 10, 8, 7, 6,
        255, 255, 11, 11, 10, 8, 9,
        8, 255, 255
    };

    const uint8 code HappyBrithdayBeat[] = {
        2, 2, 4, 4, 8,
        4, 4, 4, 4, 8,
        2, 2, 4, 4, 4, 4, 4,
        4, 4, 2, 2, 4,
        4, 4, 4, 4, 4, 4  // 修正：补齐到28个元素
    };

    for (beat = 0; beat < sizeof(HappyBrithdayNote); )
    {
        while (!timeflag);
        timeflag = 0;

        if (time == 0)
        {
            note = HappyBrithdayNote[beat] - 1;
            
            // 修正：空音符判断
            if (note == 254)  // 255-1=254
            {
                // 空音符：使用基准频率计算节拍时间，但不发声
                beatTime = (HappyBrithdayBeat[beat] * NoteFrequ[7]) >> 2;  // 使用中音1作为基准
                soundTime = 0;  // 空音符不发声
                TORL = NoteReload[0];
                TORH = NoteReload[0] >> 8;
                enable = 0;    // 不发声
                time++;
            }
            else
            {
                // 正常音符
                beatTime = (HappyBrithdayBeat[beat] * NoteFrequ[note]) >> 2;
                soundTime = beatTime - (beatTime >> 2);  // 发声75%时间
                TORL = NoteReload[note];
                TORH = NoteReload[note] >> 8;
                enable = 1;    // 允许发声
                time++;
            }
        }
        else
        {
            if (time >= beatTime)
            {
                time = 0;
                beat++;
            }
            else
            {
                time++;
                // 修正：只有在正常音符且发声时间结束时才停止发声
                if (HappyBrithdayNote[beat] != 255 && time == soundTime)
                    enable = 0;
            }
        }
    }
}

void InterruptTimer0() interrupt 1
{
    timeflag = 1;
    TL0 = TORL;
    TH0 = TORH;

    if (enable)
        BUZZ = ~BUZZ;
    else
        BUZZ = 1;          // 静音时保持高电平
}