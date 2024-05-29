`timescale 1ns / 1ps

module testbench();

///////inputs 
reg clk50Mhz,clk,rst,start_stop;

///////outputs
wire [7:0]led_unitS,led_unitM,led_zecS,led_zecM;

initial begin 
    #1  clk = 0;
        clk50Mhz = 0;
        rst = 0;
        start_stop = 0;
    
    #10 rst = 1; 
        start_stop = 1;
    
    #40 start_stop = 0;
    
    #5 start_stop = 1;
    #5 rst = 0;
    #5 rst = 1;
    #15 $finish; 
end


Clock_Main dut(
    .clk(clk),
    .rst(rst),
    .start_stop(start_stop),
    .clk50Mhz(clk50Mhz),
    .led_unitS(led_unitS),
    .led_unitM(led_unitM),
    .led_zecS(led_zecS),
    .led_zecM(led_zecM)
);

always begin #0.01 clk = ~clk; end

always begin #0.25 clk50Mhz = ~clk50Mhz; end

endmodule
