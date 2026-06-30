#include <reg52.h>

struct sTime {
    unsigned int year;
    unsigned char mon;
    unsigned char day;
    unsigned char hour;
    unsigned char min;
    unsigned char sec;
    unsigned char week;
};

bit flag200ms = 1;
struct sTime bufTime;
unsigned char setIndex = 0;
unsigned char T0RH = 0;
unsigned char T0RL = 0;

void ConfigTimer0(unsigned int ms);
void RefreshTimeShow();
extern void InitDS1302();
extern void GetRealTime(struct sTime *time);
extern void SetRealTime(struct sTime *time);
extern void KeyScan();
extern void KeyDriver();
extern void InitLcd1602();
extern void LcdShowStr(unsigned char x, unsigned char y, unsigned char *str);
extern void LcdSetCursor(unsigned char x, unsigned char y);
extern void LcdOpenCursor();
extern void LcdCloseCursor();

void main()
{
    unsigned char psec=0xAA;

    EA = 1;
    ConfigTimer0(1);
    InitDS1302();
    InitLcd1602();

    LcdShowStr(3, 0, "20 - - ");
    LcdShowStr(4, 1, " : : ");
    while (1)
    {
        KeyDriver();
        if (flag200ms && (setIndex == 0))
        {
            flag200ms = 0;
            GetRealTime(&bufTime);
            if (psec != bufTime.sec)
            {
                RefreshTimeShow();
                psec = bufTime.sec;
            }
        }
    }
}

void ShowBcdByte(unsigned char x, unsigned char y, unsigned char bcd)
{
    unsigned char str[4];

    str[0] = (bcd >> 4) + '0';
    str[1] = (bcd&0x0F) + '0';
    str[2] = '\0';
    LcdShowStr(x, y, str);
}

void RefreshTimeShow()
{
    ShowBcdByte(5, 0, bufTime.year);
    ShowBcdByte(8, 0, bufTime.mon);
    ShowBcdByte(11, 0, bufTime.day);
    ShowBcdByte(4, 1, bufTime.hour);
    ShowBcdByte(7, 1, bufTime.min);
    ShowBcdByte(10, 1, bufTime.sec);
}

void RefreshSetShow()
{
    switch (setIndex)
    {
        case 1: LcdSetCursor(5, 0); break;
        case 2: LcdSetCursor(6, 0); break;
        case 3: LcdSetCursor(8, 0); break;
        case 4: LcdSetCursor(9, 0); break;
        case 5: LcdSetCursor(11, 0); break;
        case 6: LcdSetCursor(12, 0); break;
        case 7: LcdSetCursor(4, 1); break;
        case 8: LcdSetCursor(5, 1); break;
        case 9: LcdSetCursor(7, 1); break;
        case 10: LcdSetCursor(8, 1); break;
        case 11: LcdSetCursor(10, 1); break;
        case 12: LcdSetCursor(11, 1); break;
        default: break;
    }
}

unsigned char IncBcdHigh(unsigned char bcd)
{
    if ((bcd&0xF0) < 0x90)
        bcd += 0x10;
    else
        bcd &= 0x0F;
    return bcd;
}

unsigned char IncBcdLow(unsigned char bcd)
{
    if ((bcd&0x0F) < 0x09)
        bcd += 0x01;
    else
        bcd &= 0xF0;
    return bcd;
}

unsigned char DecBcdHigh(unsigned char bcd)
{
    if ((bcd&0xF0) > 0x00)
        bcd -= 0x10;
    else
        bcd |= 0x90;
    return bcd;
}

unsigned char DecBcdLow(unsigned char bcd)
{
    if ((bcd&0x0F) > 0x00)
        bcd -= 0x01;
    else
        bcd |= 0x09;
    return bcd;
}

void IncSetTime()
{
    switch (setIndex)
    {
        case 1: bufTime.year = IncBcdHigh(bufTime.year); break;
        case 2: bufTime.year = IncBcdLow(bufTime.year); break;
        case 3: bufTime.mon = IncBcdHigh(bufTime.mon); break;
        case 4: bufTime.mon = IncBcdLow(bufTime.mon); break;
        case 5: bufTime.day = IncBcdHigh(bufTime.day); break;
        case 6: bufTime.day = IncBcdLow(bufTime.day); break;
        case 7: bufTime.hour = IncBcdHigh(bufTime.hour); break;
        case 8: bufTime.hour = IncBcdLow(bufTime.hour); break;
        case 9: bufTime.min = IncBcdHigh(bufTime.min); break;
        case 10: bufTime.min = IncBcdLow(bufTime.min); break;
        case 11: bufTime.sec = IncBcdHigh(bufTime.sec); break;
        case 12: bufTime.sec = IncBcdLow(bufTime.sec); break;
        default: break;
    }
    RefreshTimeShow();
    RefreshSetShow();
}

void DecSetTime()
{
    switch (setIndex)
    {
        case 1: bufTime.year = DecBcdHigh(bufTime.year); break;
        case 2: bufTime.year = DecBcdLow(bufTime.year); break;
        case 3: bufTime.mon = DecBcdHigh(bufTime.mon); break;
        case 4: bufTime.mon = DecBcdLow(bufTime.mon); break;
        case 5: bufTime.day = DecBcdHigh(bufTime.day); break;
        case 6: bufTime.day = DecBcdLow(bufTime.day); break;
        case 7: bufTime.hour = DecBcdHigh(bufTime.hour); break;
        case 8: bufTime.hour = DecBcdLow(bufTime.hour); break;
        case 9: bufTime.min = DecBcdHigh(bufTime.min); break;
        case 10: bufTime.min = DecBcdLow(bufTime.min); break;
        case 11: bufTime.sec = DecBcdHigh(bufTime.sec); break;
        case 12: bufTime.sec = DecBcdLow(bufTime.sec); break;
        default: break;
    }
    RefreshTimeShow();
    RefreshSetShow();
}

void RightShiftTimeSet()
{
    if (setIndex != 0)
    {
        if (setIndex < 12)
            setIndex++;
        else
            setIndex = 1;
        RefreshSetShow();
    }
}

void LeftShiftTimeSet()
{
    if (setIndex != 0)
    {
        if (setIndex > 1)
            setIndex--;
        else
            setIndex = 12;
        RefreshSetShow();
    }
}

void EnterTimeSet()
{
    setIndex = 2;
    LeftShiftTimeSet();
    LcdOpenCursor();
}

void ExitTimeSet(bit save)
{
    setIndex = 0;
    if (save)
    {
        SetRealTime(&bufTime);
    }
    LcdCloseCursor();
}

void KeyAction(unsigned char keycode)
{
    if ((keycode>='0') && (keycode<='9'))
    {
    }
    else if (keycode == 0x26)
    {
        IncSetTime();
    }
    else if (keycode == 0x28)
    {
        DecSetTime();
    }
    else if (keycode == 0x25)
    {
        LeftShiftTimeSet();
    }
    else if (keycode == 0x27)
    {
        RightShiftTimeSet();
    }
    else if (keycode == 0x0D)
    {
        if (setIndex == 0)
        {
            EnterTimeSet();
        }
        else
        {
            ExitTimeSet(1);
        }
    }
    else if (keycode == 0x1B)
    {
        ExitTimeSet(0);
    }
}

void ConfigTimer0(unsigned int ms)
{
    unsigned long tmp;

    tmp = 11059200 / 12;
    tmp = (tmp * ms) / 1000;
    tmp = 65536 - tmp;
    tmp = tmp + 28;

    T0RH = (unsigned char)(tmp>>8);
    T0RL = (unsigned char)tmp;
    TMOD &= 0xF0;
    TMOD |= 0x01;
    TH0 = T0RH;
    TL0 = T0RL;
    ET0 = 1;
    TR0 = 1;
}

void InterruptTimer0() interrupt 1
{
    static unsigned char tmr200ms = 0;

    TH0 = T0RH;
    TL0 = T0RL;
    KeyScan();
    tmr200ms++;
    if (tmr200ms >= 200)
    {
        tmr200ms = 0;
        flag200ms = 1;
    }
}