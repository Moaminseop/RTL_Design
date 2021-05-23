`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/22 19:27:21
// Design Name: 
// Module Name: checksum_code
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


module checksum_code(data, out_3945);
    input [191:0] data;
    output out_3945;
    
    integer i, cluster_check;
    reg [7:0] ascii_byte;
    reg [7:0] tmp;
    
    initial begin
        tmp = 8'b0000000000;
        cluster_check = 0;
    end
    
    always @(*) begin
        for(i = 191; i >= 0; i = i-1) begin
            #1 ascii_byte[i%8] = data[i];
            if(i%8 == 0) begin
                tmp = tmp + ascii_byte;
                ascii_byte = 8'b00000000;
                cluster_check = cluster_check+1;
            end
            
            if(cluster_check==4) begin
                tmp = ~tmp + 1'b1;
                $display("%h", tmp);
                tmp = 8'b00000000;
                cluster_check = 0;
            end
        end   
    end
    
    assign out_3945 = 1;
endmodule
