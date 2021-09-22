`timescale 1ns/1ps
`include "iob_lib.vh"
`include "TIMERsw_reg.vh"

module timer_core
    #(
        parameter DATA_W = 32
        )
    (
        `INPUT(TIMER_ENABLE,           `TIMER_ENABLE_W),
        `INPUT(TIMER_SAMPLE,           `TIMER_SAMPLE_W),
        `INPUT(TIMER_INTERRUPT_ENABLE, `TIMER_INTERRUPT_ENABLE_W),
        `INPUT(TIMER_INTERRUPT_PERIOD, `TIMER_DATA_LOW_W + `TIMER_DATA_HIGH_W),
        `OUTPUT(TIMER_INTERRUPT,       `TIMER_INTERRUPT_W),
        `OUTPUT(TIMER_VALUE,           `TIMER_DATA_LOW_W + `TIMER_DATA_HIGH_W),
        `INPUT(clk, 1),
        `INPUT(rst, 1)
        );


    `SIGNAL(time_counter, 2*DATA_W)
    `COUNTER_ARE(clk, rst, TIMER_ENABLE, time_counter)
    `SIGNAL(interrupt, 1)
    
    always @(posedge clk) begin
        if (TIMER_INTERRUPT_ENABLE && (time_counter == TIMER_INTERRUPT_PERIOD)) begin
            interrupt <= 1;
        end else begin
            interrupt <= 0;
        end
    end

    `SIGNAL2OUT(TIMER_INTERRUPT, interrupt)

   //time counter register
   `SIGNAL(counter_reg, 2*DATA_W)

   `REG_E(clk, TIMER_SAMPLE, counter_reg, time_counter)
  //  always @(posedge clk)
  //   if(TIMER_SAMPLE)
  //     counter_reg <= time_counter;

   `SIGNAL2OUT(TIMER_VALUE, counter_reg)

endmodule
