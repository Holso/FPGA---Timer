module testbench();

//////////////inputs
reg clk,rst,start_stop;

//////////////outputs
wire [5:0]minutes,seconds;

time_manager DUT(
    .clk(clk),
    .rst(rst),
    .start_stop(start_stop),
    .minutes(minutes),
    .seconds(seconds)
);

initial begin 
    #1  clk = 0;
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

always #0.25 clk = ~clk;

endmodule
