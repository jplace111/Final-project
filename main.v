`timescale 1ns / 1ps

module main(
    input clk,
    output Hsynq,
    output Vsynq,
    output [3:0] Red,
    output [3:0] Green,
    output [3:0] Blue
    );
wire clk_25M;
wire enable_V_Counter;
wire [15:0] H_Count_Value;
wire [15:0] V_Count_Value;
reg [3:0] in_red = 0;
reg [3:0] in_blue = 0;
reg [3:0] in_green =0; 

clock VGA_Clock_gen (clk, clk_25M);
horizontal_count (clk_25M, enable_V_Counter, H_Count_Value);
vertical_count(clk_25M, enable_V_Counter, V_Count_Value);

// outputs
assign Hsynq = (H_Count_Value < 96) ? 1'b0:1'b1; 
assign Vsynq = (V_Count_Value < 2) ? 1'b0:1'b1; 
// colors - all colors high = white screen 
wire on_screen =(H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34);
assign Red = in_red; //(H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34);
assign Green = in_green; //(H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34);
assign Blue = in_blue; //(H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34);

// pattern 
		always @ (posedge clk)
		begin         
//		if (H_Count_Value < 700 && H_Count_Value > 0)   
//		    in_red <= 4'hF;    
//            in_green <= 4'h0;
//            in_blue <= 4'h0;
        if (H_Count_Value < 600 && H_Count_Value > 0)   
		    in_red <= 4'h0;    
            in_green <= 4'hF;
            in_blue <= 4'h0;
       if (H_Count_Value < 252 && H_Count_Value > 0)   
	    in_red <= 4'h0;    
           in_green <= 4'h0;
           in_blue <= 4'hF;
		if (on_screen) 
		begin
		  if (V_Count_Value >= 200 && V_Count_Value < 240)
		      begin
              in_red <= 4'hF;    
              in_green <= 4'h0;
              in_blue <= 4'hF;
	end
        //else if (V_Count_Value >= 135 && V_Count_Value < 205)
//				begin 
//					if (H_Count_Value < 324)
//						begin 
//							in_red <= 4'hF;    
//							in_green <= 4'hF;
//							in_blue <= 4'h0;
						//end  
//            else if (H_Count_Value >= 324 && H_Count_Value < 604)
//						begin 
//							in_red <= 4'hF;    
//							in_green <= 4'h0;
//							in_blue <= 4'hF;
//						end  
//		   else if (H_Count_Value >= 604)
//						begin 
//							in_red <= 4'hF;    
//							in_green <= 4'hF;
//							in_blue <= 4'hF;
//						end  
			
			end
			end

endmodule
