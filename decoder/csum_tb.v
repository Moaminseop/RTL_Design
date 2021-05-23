`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/23 01:42:33
// Design Name: 
// Module Name: csum_tb
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


module csum_tb();
    reg [191:0] data;
    wire out_3945;
    
    initial begin
        data = 192'b010010000110010101101100011011000110111100100000010000110110100001100101011000110110101101010011011101010110110100100000010100000111001001101111011010100110010101100011011101000010000100000000;
       #200 $finish;
   end
    checksum_code cc1(data, out_3945);
endmodule
