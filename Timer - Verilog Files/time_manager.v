module time_manager(
            input clk,rst,
			input start_stop,
            output [5:0]minutes,seconds);
            
reg[5:0] seconds_next,seconds_reg;
reg[5:0] minutes_next,minutes_reg;


always @ (posedge clk or negedge rst)begin   
    if(rst == 0) begin
		minutes_reg <= 0;
		seconds_reg <= 0;
    end 
    else if( start_stop == 1)begin
	    minutes_reg <= minutes_next;
	    seconds_reg <= seconds_next;
	end
end    
    
always@(minutes_reg , seconds_reg )begin
    minutes_next = minutes_reg;
    seconds_next = seconds_reg;
        
    if(seconds_reg == 59)begin//IF seconds == 59
		if(minutes_reg == 59) begin//IF minutes == 59 AND seconds == 60
			minutes_next = 0;
			seconds_next = 0;
		end else begin //IF minutes == x and seconds == 60 
			seconds_next = 0;
			minutes_next = minutes_reg + 1;	
		end	
	end else begin// IF seconds < 60
		seconds_next = seconds_reg + 1;
	end
end    
  
assign minutes = minutes_reg;
assign seconds = seconds_reg;

endmodule    
   
