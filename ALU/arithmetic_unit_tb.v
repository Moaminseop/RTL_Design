`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/09 18:27:26
// Design Name: 
// Module Name: arithmetic_unit_tb
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


module arithmetic_unit_tb( );
    reg [15:0] ina, inb;
    reg [1:0] sel;
    wire [15:0] out3945;
    wire overflow;
    
    arithmetic_unit u1(ina, inb, sel, out3945, overflow);
    
    initial begin
        #0 ina = $urandom; inb = 0; sel = 2'b11;
        #150 $finish;
    end
    
    always begin
        #10 ina = $urandom; inb = $urandom % 256;
        #10 ina = $urandom; inb = $urandom % 256 ;
        #10 ina = $urandom; inb = $urandom % 256 ;
        #10 ina = $urandom; inb = $urandom % 256 ;
        #10 ina = $urandom; inb = 0;
        
    end
    
    
endmodule
