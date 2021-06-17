`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/07 00:40:11
// Design Name: 
// Module Name: mips_16_bit_tb
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


module mips_16_bit_tb();
    reg clk, rst;
    wire [15:0] current_instr;
    wire [12:0] current_pc;
    wire [15:0] RF0, RF1, RF2, RF3, RF4, RF7;
    
    mips_16_bit m16t0(clk, rst, current_instr, current_pc, RF0, RF1, RF2, RF3, RF4, RF7);
    
    initial begin
        clk = 0; rst = 0;
        #2 rst = 1;
        #18 $display("The final result of C in memory is : %d", data_memory.data_mem[3]); $finish;
    end
    
   always
        #0.5 clk = ~clk;
        
   always 
        #1 $display("ID:3945, at time", $time, ", PC = %d, RF[0, 1, 2, 3, 4, 7] is : %d, %d, %d, %d, %d, %d", current_pc, RF0, RF1, RF2, RF3, RF4, RF7); 
endmodule
