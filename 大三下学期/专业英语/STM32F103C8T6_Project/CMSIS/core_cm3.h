#ifndef __CORE_CM3_H
#define __CORE_CM3_H

#ifdef __cplusplus
 extern "C" {
#endif

#define __CM3_REV                 0x0200
#define __MPU_PRESENT             1
#define __NVIC_PRIO_BITS          4
#define __Vendor_SysTickConfig    0

#include <stdint.h>

typedef enum {
  IRQn_Pos = 0,
  NonMaskableInt_IRQn         = -14,
  HardFault_IRQn              = -13,
  MemoryManagement_IRQn       = -12,
  BusFault_IRQn               = -11,
  UsageFault_IRQn             = -10,
  SVCall_IRQn                 = -5,
  DebugMonitor_IRQn           = -4,
  PendSV_IRQn                 = -2,
  SysTick_IRQn                = -1,
} IRQn_Type;

typedef union {
  __IO uint32_t w;
  struct {
    __IO uint16_t l;
    __IO uint16_t h;
  } hw;
} xPSR_Type;

typedef struct {
  __IO uint32_t ISER[8];
       uint32_t RESERVED0[24];
  __IO uint32_t ICER[8];
       uint32_t RSERVED1[24];
  __IO uint32_t ISPR[8];
       uint32_t RESERVED2[24];
  __IO uint32_t ICPR[8];
       uint32_t RESERVED3[24];
  __IO uint32_t IABR[8];
       uint32_t RESERVED4[56];
  __IO uint8_t  IP[240];
       uint32_t RESERVED5[644];
  __O  uint32_t STIR;
}  NVIC_Type;

typedef struct {
  __IO uint32_t CTRL;
  __IO uint32_t LOAD;
  __IO uint32_t VAL;
  __I  uint32_t CALIB;
} SysTick_Type;

typedef struct {
  __I  uint32_t CPUID;
  __IO uint32_t ICSR;
  __IO uint32_t VTOR;
  __IO uint32_t AIRCR;
  __IO uint32_t SCR;
  __IO uint32_t CCR;
  __IO uint8_t  SHPR[12];
  __IO uint32_t SHCSR;
  __IO uint32_t CFSR;
  __IO uint32_t HFSR;
  __IO uint32_t DFSR;
  __IO uint32_t MMFAR;
  __IO uint32_t BFAR;
  __IO uint32_t AFSR;
  __I  uint32_t PFR[2];
  __I  uint32_t DFR;
  __I  uint32_t ADR;
  __I  uint32_t MMFR[4];
  __I  uint32_t ISAR[5];
} SCB_Type;

#define SCS_BASE            (0xE000E000UL)
#define NVIC_BASE           (SCS_BASE +  0x0100UL)
#define SCB_BASE            (SCS_BASE +  0x0D00UL)
#define SysTick_BASE        (SCS_BASE +  0x0010UL)

#define NVIC                ((NVIC_Type      *)     NVIC_BASE   )
#define SCB                 ((SCB_Type       *)     SCB_BASE    )
#define SysTick             ((SysTick_Type   *)     SysTick_BASE)

#define NVIC_SetPriorityGrouping(X)
#define NVIC_EnableIRQ(IRQn)              NVIC->ISER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F))
#define NVIC_DisableIRQ(IRQn)             NVIC->ICER[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F))
#define NVIC_SetPendingIRQ(IRQn)          NVIC->ISPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F))
#define NVIC_ClearPendingIRQ(IRQn)        NVIC->ICPR[((uint32_t)(IRQn) >> 5)] = (1 << ((uint32_t)(IRQn) & 0x1F))

static __INLINE void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority) {
  if (IRQn < 0) {
    SCB->SHPR[((uint32_t)(IRQn) & 0xF) - 4] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xFF);
  } else {
    NVIC->IP[(uint32_t)(IRQn)] = ((priority << (8 - __NVIC_PRIO_BITS)) & 0xFF);
  }
}

static __INLINE uint32_t SysTick_Config(uint32_t ticks) {
  if (ticks > 0xFFFFFFUL) return (1);
  SysTick->LOAD = (ticks & 0xFFFFFFUL) - 1;
  NVIC_SetPriority(SysTick_IRQn, (1UL << __NVIC_PRIO_BITS) - 1UL);
  SysTick->VAL = 0UL;
  SysTick->CTRL = SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk;
  return (0);
}

#define SysTick_CTRL_COUNTFLAG_Pos       16
#define SysTick_CTRL_COUNTFLAG_Msk       (1UL << SysTick_CTRL_COUNTFLAG_Pos)
#define SysTick_CTRL_CLKSOURCE_Pos        2
#define SysTick_CTRL_CLKSOURCE_Msk       (1UL << SysTick_CTRL_CLKSOURCE_Pos)
#define SysTick_CTRL_TICKINT_Pos          1
#define SysTick_CTRL_TICKINT_Msk         (1UL << SysTick_CTRL_TICKINT_Pos)
#define SysTick_CTRL_ENABLE_Pos           0
#define SysTick_CTRL_ENABLE_Msk          (1UL << SysTick_CTRL_ENABLE_Pos)

#ifdef __cplusplus
}
#endif

#endif
