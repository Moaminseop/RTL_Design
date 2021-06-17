`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 02:00:08
// Design Name: 
// Module Name: mips_16_bit
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


module mips_16_bit(clk, rst, current_instr, current_pc, RF0, RF1, RF2, RF3, RF4, RF7);
    input clk, rst;
    output [15:0] current_instr;
    output [12:0] current_pc;
    output [15:0] RF0, RF1, RF2, RF3, RF4, RF7;
   
    wire [1:0] reg_dst, mem_to_reg, alu_op;
    wire jump, branch, mem_read, mem_write, alu_src, reg_write;
    wire [2:0] op;
    
    data_path dp0(clk, rst, jump, branch, mem_read, mem_write, alu_src, reg_write, reg_dst, mem_to_reg, alu_op, op, current_instr, current_pc, RF0, RF1, RF2, RF3, RF4, RF7);
    control_unit cu0(op, reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
      
endmodule
