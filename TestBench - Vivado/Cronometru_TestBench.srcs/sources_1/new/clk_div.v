module clk_div(input clk,rst, output q);
	
	reg [24:0]q_reg,q_nxt;
	reg clk_div_reg,clk_div_nxt;

	//SECVENTIAL
	always@(posedge clk or negedge rst)
	begin
		if(rst == 0)
		begin
			q_reg <= 0;
			clk_div_reg <=0;
		end	
		else
		begin
			q_reg <= q_nxt;
			clk_div_reg <= clk_div_nxt;
		end
	end

	//COMBINATIONAL
	always@*
	begin
		q_nxt = q_reg+1;
		clk_div_nxt = clk_div_reg;
		if(q_reg == 25000000)
		begin
		q_nxt = 0;
		clk_div_nxt = ~clk_div_reg;
		end
	end
	
	assign q = clk_div_reg;


endmodule
