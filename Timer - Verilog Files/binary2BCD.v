
module binary2BCD(
    input clk,rst,
    input [5:0] six_bit_value,
    output reg[3:0] ones,
    output reg[3:0] tens
    );
    
    
    reg [3:0] i = 0;
    reg [13:0] shift_reg = 0;//14 bits
    reg [3:0] t_ones = 0;
    reg [3:0] t_tens = 0;
    
    reg [5:0] Old_six_bit_value = 0;
        
    always@ (posedge clk or negedge rst)begin
        if(rst == 0)begin
            shift_reg <= 0;
            t_ones <= 0;
            t_tens <= 0;
        end else begin
    
            if(i == 0 & (Old_six_bit_value != six_bit_value))begin
                shift_reg = 0;//initialzing the shift reg to 0
                Old_six_bit_value = six_bit_value;// assign the current 8 bit value to the Old_eight_bit_value
    
                shift_reg[5:0] = six_bit_value;//On the first 6 bits is my number
                t_tens = shift_reg[13:10];
                t_ones = shift_reg[9:6];
                i = i+1; 
            end
            if(i>0 & i <7)begin
                if(t_tens >= 5)begin t_tens = t_tens + 3;  end
                if(t_ones >= 5)begin t_ones = t_ones + 3;  end 
                
                shift_reg[13:6] = {t_tens,t_ones};
                shift_reg = shift_reg << 1;
                
                t_tens = shift_reg[13:10];
                t_ones = shift_reg[9:6];
                i = i+1; 
            end
            if(i == 7)begin
                tens = t_tens;
                ones = t_ones;
                i = 0;  
            end  

        end 
    end
    
    
endmodule
