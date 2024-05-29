module display_seven_seg_dot(input [3:0]num,
			 				output [7:0]leds_out);
	
	reg [7:0] mem;
	
	always @(num) begin
	case(num) 
	        3'd0: mem = 8'h40;    //display 0 - 8'b 0100 0000
		    3'd1: mem = 8'h79;    //display 1 - 8'b 0111 1001
		    3'd2: mem = 8'h24;    //display 2 - 8'b 0010 0100
		    3'd3: mem = 8'h30;    //display 3 - 8'b 0011 0000
		    3'd4: mem = 8'h19;    //display 4 - 8'b 0001 1001
		    3'd5: mem = 8'h12;    //display 5 - 8'b 0001 0010
		    3'd6: mem = 8'h02;    //display 6 - 8'b 0000 0010
		    3'd7: mem = 8'h78;    //display 7 - 8'b 0FFF 1000
		    4'd8: mem = 8'h00;    //display 8 - 8'b 0000 0000
		    4'd9: mem = 8'h10;    //display 9 - 8'b 0001 0000
	endcase
	end
		
	assign leds_out = mem;

endmodule  
