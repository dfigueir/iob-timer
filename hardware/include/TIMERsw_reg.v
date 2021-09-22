//START_TABLE sw_reg
`SWREG_W(TIMER_RESET,                 1,      0) // Timer soft reset
`SWREG_W(TIMER_ENABLE,                1,      0) // Timer enable
`SWREG_W(TIMER_SAMPLE,                1,      0) // Sample time counter value into a readable register
`SWREG_W(TIMER_INTERRUPT_ENABLE,      1,      0) // Timer interrupt enable
`SWREG_W(TIMER_INTERRUPT_PERIOD_HIGH, DATA_W, 0) // High part of the timer interrupt period value, which has twice the width of the data word width
`SWREG_W(TIMER_INTERRUPT_PERIOD_LOW,  DATA_W, 0) // Low part of the timer interrupt period, which has twice the width of the data word width
`SWREG_R(TIMER_INTERRUPT,             1,      0) // Timer interrupt
`SWREG_R(TIMER_DATA_HIGH,             DATA_W, 0) // High part of the timer value, which has twice the width of the data word width
`SWREG_R(TIMER_DATA_LOW,              DATA_W, 0) // Low part of the timer value, which has twice the width of the data word width
