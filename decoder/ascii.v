`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/21 18:53:07
// Design Name: 
// Module Name: ascii
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


module ascii(data, ascii);
    input [191:0] data;
    output ascii;
    
    integer i;
    reg [7:0] ascii_byte;
    
    always @(*) begin
        for(i = 191; i >= 0; i = i-1) begin
            #1 ascii_byte[i%8] = data[i];
            if(i%8 == 0) begin
                $display("%c", ascii_byte);
                ascii_byte = 8'b00000000;
            end
        end  
    end
    
    assign ascii = 1;
endmodule
