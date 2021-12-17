`timescale 1ns / 1ps

module horizontal_count(
 input clk_25Mhz,
    output reg enable_V_Counter = 0,
    output reg [15:0] H_Count_Value = 0
    );
    
    always@(posedge clk_25Mhz) begin
        if (H_Count_Value < 800) begin
            H_Count_Value <= H_Count_Value +1;
            enable_V_Counter <=0; // display vertical counter
        end
        else begin
            H_Count_Value <= 0; // reset horizontal counter
            enable_V_Counter <= 1;    // trigger V counter
        end
    end
    
endmodule
