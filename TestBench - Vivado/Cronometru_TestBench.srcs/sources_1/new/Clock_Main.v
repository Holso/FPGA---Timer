`timescale 1ns / 1ps

module Clock_Main(
    input clk,rst,
    input start_stop,
    input clk50Mhz,
    output [7:0]led_unitS,led_unitM,led_zecS,led_zecM
 
    );
    
    wire new_clock;
    //clk_div _CLK_50(.clk(clk),.rst(rst),.q(new_clock));
    
    wire [5:0]minutes,seconds;
    wire [3:0]unitS,unitM,zecS,zecM;
    // **new_clk**
    time_manager _TIME_MANAGER(.clk(clk50Mhz),.rst(rst),.start_stop(start_stop), .minutes(minutes), .seconds(seconds));

    binary2BCD _BINARY2BCD_MINUTES(.clk(clk),.rst(rst), .six_bit_value(minutes), .ones(unitM), .tens(zecM));
    binary2BCD _BINARY2BCD_SECONDS(.clk(clk),.rst(rst), .six_bit_value(seconds), .ones(unitS), .tens(zecS));
    
    display_seven_seg _UNIT_S(.num(unitS), .leds_out(led_unitS));
    display_seven_seg _ZEC_S(.num(zecS), .leds_out(led_zecS));
    display_seven_seg_dot _UNIT_M(.num(unitM), .leds_out(led_unitM));
    display_seven_seg _ZEC_M(.num(zecM), .leds_out(led_zecM));
     
endmodule
