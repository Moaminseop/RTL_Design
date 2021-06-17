`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/17 02:40:50
// Design Name: 
// Module Name: mux3_1
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


module mux3_1 #(parameter BITS = 13) (sel, in0, in1, in2, out);
    input [1:0] sel;
    input [BITS-1:0] in0, in1, in2;
    output reg [BITS-1:0] out;
    
    always @(*) begin
        case(sel)
        2'b00: begin
            out <= in0;
            end
        2'b01: begin
            out <= in1;
            end
        2'b10: begin
            out <= in2;
            end
        default : begin
            out <= in0;
            end
        endcase
    end

endmodule
