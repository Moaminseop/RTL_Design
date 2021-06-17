`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/16 17:40:18
// Design Name: 
// Module Name: mux2_1
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


module mux2_1 #(parameter BITS = 13) (sel, in0, in1, out);
    input sel;
    input [BITS-1:0] in0, in1;
    output reg [BITS-1:0] out;
    
    always @(*) begin
        case(sel)
        1'b0: begin
            out <= in0;
            end
        1'b1: begin
            out <= in1;
            end
        default : begin
            out <= in0;
            end
        endcase
    end

endmodule
