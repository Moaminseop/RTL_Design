`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 05:49:45
// Design Name: 
// Module Name: jr_control_unit
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


module jr_control_unit(alu_op, func, jr_control);
    input [1:0] alu_op;
    input [3:0] func;
    output jr_control;
    
    assign jr_control = ({alu_op,func} == 6'b001000) ? 1'b1 : 1'b0; 
endmodule
