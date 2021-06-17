`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/09 21:57:13
// Design Name: 
// Module Name: data_memory
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


module data_memory(clk, mem_write, mem_read, address, write_data, read_data);
    input mem_write, mem_read, clk;
    input [15:0] address, write_data;
    output [15:0] read_data;
    
    reg [15:0] data_mem [23:0];
    
    initial begin
        $readmemb("C:/memory/data_mem.txt", data_mem, 0, 23);
    end
    
    always @(posedge clk) begin
        if(mem_write) data_mem[address] <= write_data;
    end
    
    assign read_data = (mem_read) ? data_mem[address] : 16'b0;
    
endmodule
