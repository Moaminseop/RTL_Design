`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 05:32:40
// Design Name: 
// Module Name: alu_control_unit
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


module alu_control_unit(alu_op, func, alu_control);
    input [1:0] alu_op;
    input [3:0] func;
    output reg [2:0] alu_control;
    
    wire [5:0] alu_op_func = {alu_op,func};
    
    always @(*) begin
        casex(alu_op_func)
            6'b11xxxx : 
                alu_control = 3'b000;
            6'b01xxxx : 
                alu_control = 3'b001;
            6'b000000 : 
                alu_control = 3'b000;
            6'b000001 : 
                alu_control = 3'b001;
            6'b000010 : 
                alu_control = 3'b010;
            6'b000011 : 
                alu_control = 3'b011;
            6'b000100 : 
                alu_control = 3'b100;
            6'b000101 : 
                alu_control = 3'b101; 
            default: alu_control = 3'b000;
        endcase
    end
endmodule


