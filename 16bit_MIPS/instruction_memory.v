`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/09 21:31:47
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(clk, pc, instruction);
    input clk;
    input [12:0] pc;
    output [15:0] instruction;
    
    reg [15:0] ins_mem [23:0];
    
    initial begin
        $readmemb("C:/memory/ins_mem.txt", ins_mem, 0, 23);
    end
    
    assign instruction = ins_mem[pc];
endmodule

