#pragma once


// Constants

#define TIMER_INTERRUPT_PERIOD 100



//Functions
void timer_reset();
void timer_start();	
void timer_stop();
void timer_init( int base_address);	

unsigned long long timer_get_count();
unsigned int timer_time_tu(int sample_rate);
unsigned int timer_time_us();
unsigned int timer_time_ms();
unsigned int timer_time_s();
void timer_interrupt_enable();
void timer_interrupt_disable();
void timer_set_interrupt_period(unsigned long long period);
