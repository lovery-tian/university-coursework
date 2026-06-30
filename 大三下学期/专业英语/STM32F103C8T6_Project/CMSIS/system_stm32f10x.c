#include "stm32f10x.h"

uint32_t SystemCoreClock = 72000000;

static void SetSysClock(void)
{
  __IO uint32_t StartUpCounter = 0, HSEStatus = 0;

  RCC->CR |= ((uint32_t)RCC_CR_HSEON);

  do {
    HSEStatus = RCC->CR & RCC_CR_HSERDY;
    StartUpCounter++;
  } while ((HSEStatus == 0) && (StartUpCounter != HSE_STARTUP_TIMEOUT));

  if ((RCC->CR & RCC_CR_HSERDY) != RESET) {
    HSEStatus = (uint32_t)0x01;
  } else {
    HSEStatus = (uint32_t)0x00;
  }

  if (HSEStatus == (uint32_t)0x01) {
    FLASH->ACR |= FLASH_ACR_PRFTBE;
    FLASH->ACR &= (uint32_t)((uint32_t)~FLASH_ACR_LATENCY);
    FLASH->ACR |= (uint32_t)FLASH_ACR_LATENCY_2;

    RCC->CFGR |= (uint32_t)RCC_CFGR_HPRE_DIV1;
    RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE2_DIV1;
    RCC->CFGR |= (uint32_t)RCC_CFGR_PPRE1_DIV2;

    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_PLLSRC | RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLMULL));
    RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSE | RCC_CFGR_PLLMULL9);

    RCC->CR |= RCC_CR_PLLON;

    while ((RCC->CR & RCC_CR_PLLRDY) == 0) {}

    RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
    RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;

    while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)0x08) {}
  } else {
  }
}

void SystemInit(void)
{
  RCC->CR |= (uint32_t)0x00000001;
  RCC->CFGR &= (uint32_t)0xF8FF0000;
  RCC->CR &= (uint32_t)0xFEF6FFFF;
  RCC->CR &= (uint32_t)0xFFFBFFFF;
  RCC->CFGR &= (uint32_t)0xFF80FFFF;
  RCC->CIR = 0x009F0000;

  SetSysClock();
}

void SystemCoreClockUpdate(void)
{
  uint32_t tmp = 0, pllmull = 0, pllsource = 0;

  tmp = RCC->CFGR & RCC_CFGR_SWS;

  switch (tmp) {
    case 0x00:
      SystemCoreClock = 8000000;
      break;
    case 0x04:
      SystemCoreClock = 8000000;
      break;
    case 0x08:
      pllmull = RCC->CFGR & RCC_CFGR_PLLMULL;
      pllsource = RCC->CFGR & RCC_CFGR_PLLSRC;
      pllmull = (pllmull >> 18) + 2;

      if (pllsource == 0x00) {
        SystemCoreClock = 8000000 * pllmull;
      } else {
        SystemCoreClock = 8000000 * pllmull;
      }
      break;
    default:
      SystemCoreClock = 8000000;
      break;
  }

  tmp = AHBPrescTable[((RCC->CFGR & RCC_CFGR_HPRE) >> 4)];
  SystemCoreClock >>= tmp;
}

const uint8_t AHBPrescTable[16] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};

#define HSE_STARTUP_TIMEOUT   ((uint16_t)0x0500)
