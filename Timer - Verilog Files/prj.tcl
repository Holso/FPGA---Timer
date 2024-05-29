project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE ../verilog/D_FF.v
set_global_assignment -name VERILOG_FILE ../verilog/clk_div.v
set_global_assignment -name VERILOG_FILE ../verilog/time_manager.v
set_global_assignment -name VERILOG_FILE ../verilog/display_seven_seg.v
set_global_assignment -name VERILOG_FILE ../verilog/display_seven_seg_dot.v
set_global_assignment -name VERILOG_FILE ../verilog/binary2BCD.v
set_global_assignment -name VERILOG_FILE ../verilog/Clock_Main.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY Clock_Main
set_location_assignment -to clk PIN_AH10

#INPUTS
set_location_assignment PIN_N14 -to clk         ;
set_location_assignment PIN_C10 -to rst         ; # first _sw
set_location_assignment PIN_C11 -to start_stop  ; # second _sw


#OUTPUTS
    #Seconds Unit
set_location_assignment PIN_C14  -to led_unitS[0]  ;# 
set_location_assignment PIN_E15  -to led_unitS[1]  ;# 
set_location_assignment PIN_C15  -to led_unitS[2]  ;# 
set_location_assignment PIN_C16  -to led_unitS[3]  ;# 
set_location_assignment PIN_E16  -to led_unitS[4]  ;# 
set_location_assignment PIN_D17  -to led_unitS[5]  ;# 
set_location_assignment PIN_C17  -to led_unitS[6]  ;#
set_location_assignment PIN_D15  -to led_unitS[7]  ;#  
    #Seconds Zec
set_location_assignment PIN_C18  -to led_zecS[0]  ;# 
set_location_assignment PIN_D18  -to led_zecS[1]  ;# 
set_location_assignment PIN_E18  -to led_zecS[2]  ;# 
set_location_assignment PIN_B16  -to led_zecS[3]  ;# 
set_location_assignment PIN_A17  -to led_zecS[4]  ;# 
set_location_assignment PIN_A18  -to led_zecS[5]  ;# 
set_location_assignment PIN_B17  -to led_zecS[6]  ;#
set_location_assignment PIN_A16  -to led_zecS[7]  ;#
    #Minutes Unit
set_location_assignment PIN_B20  -to led_unitM[0]  ;# 
set_location_assignment PIN_A20  -to led_unitM[1]  ;# 
set_location_assignment PIN_B19  -to led_unitM[2]  ;# 
set_location_assignment PIN_A21  -to led_unitM[3]  ;# 
set_location_assignment PIN_B21  -to led_unitM[4]  ;# 
set_location_assignment PIN_C22  -to led_unitM[5]  ;# 
set_location_assignment PIN_B22  -to led_unitM[6]  ;#
set_location_assignment PIN_A19  -to led_unitM[7]  ;#
    #Minutes Zec
set_location_assignment PIN_F21  -to led_zecM[0]  ;# 
set_location_assignment PIN_E22  -to led_zecM[1]  ;# 
set_location_assignment PIN_E21  -to led_zecM[2]  ;# 
set_location_assignment PIN_C19  -to led_zecM[3]  ;# 
set_location_assignment PIN_C20  -to led_zecM[4]  ;# 
set_location_assignment PIN_D19  -to led_zecM[5]  ;# 
set_location_assignment PIN_E17  -to led_zecM[6]  ;#
set_location_assignment PIN_D22  -to led_zecM[7]  ;#





load_package flow
execute_flow -compile

project_close
