`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2021 01:22:45 PM
// Design Name: 
// Module Name: vertical_count
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vertical_count(
    input clk_25Mhz,
    input enable_V_Counter,
    output reg [15:0] V_Count_Value = 0
    );
    
    always@(posedge clk_25Mhz) begin
        if (enable_V_Counter == 1'b1) begin
            if (V_Count_Value < 525) // counting
                V_Count_Value <= V_Count_Value +1;
            else V_Count_Value <= 0; // reset horizontal counter
            end
            end
endmodule
