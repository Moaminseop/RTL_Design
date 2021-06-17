`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 05:04:27
// Design Name: 
// Module Name: alu_unit
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


module alu_unit(in1, in2, alu_control, alu_res, zero);
    input [15:0] in1, in2;
    input [2:0] alu_control;
    output reg [15:0] alu_res;
    output zero;
    
    always @(*) begin
        case(alu_control) 
            3'b000 : alu_res = in1 + in2;
            3'b001 : alu_res = in1 - in2;
            3'b010 : alu_res = in1 & in2;
            3'b011 : alu_res = in1 | in2;
            3'b100 : begin
                if(in1 < in2) alu_res = 16'd1;
                else alu_res = 16'd0;
            end
            3'b101 : alu_res = in1 * in2;
            default: alu_res = in1 + in2;
        endcase
    end
    
    assign zero = (alu_res == 0) ? 1'b1 : 1'b0;
    
endmodule
