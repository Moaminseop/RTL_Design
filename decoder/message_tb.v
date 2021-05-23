`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/21 19:35:31
// Design Name: 
// Module Name: ascii_tb
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


module message_tb();
    reg [7:0] cluster0, cluster1, cluster2, cluster3, csum_cluster;
    wire [7:0] cluster_data0, cluster_data1, cluster_data2, cluster_data3;
    
    message m1(cluster0, cluster1, cluster2, cluster3, csum_cluster, cluster_data0, cluster_data1, cluster_data2, cluster_data3);
   
    initial begin
        cluster0 = 8'b00100000;
        cluster1 = 8'b11000001;
        cluster2 = 8'b00011011;
        cluster3 = 8'b10100010;
        csum_cluster = 8'b10011100;
        #16 $finish;
    end
    
    always begin
     #1 cluster0 = 8'b01010000;
        cluster1 = 8'b01110010;
        cluster2 = 8'b01101111;
        cluster3 = 8'b01101010;
        csum_cluster = 8'b01100101;
        
     #1 cluster0 = 8'b00110100;
        cluster1 = 8'b00001010;
        cluster2 = 8'b00011100;
        cluster3 = 8'b11100000;
        csum_cluster = 8'b10001111;
        
     #1 cluster0 = 8'b01100101;
        cluster1 = 8'b01100011;
        cluster2 = 8'b01110100;
        cluster3 = 8'b00100000;
        csum_cluster = 8'b10100100;
        
     #1 cluster0 = 8'b00110010;
        cluster1 = 8'b00100000;
        cluster2 = 8'b01101001;
        cluster3 = 8'b01110011;
        csum_cluster = 8'b11010010;
        
     #1 cluster0 = 8'b01101110;
        cluster1 = 8'b01110100;
        cluster2 = 8'b00100000;
        cluster3 = 8'b01110100;
        csum_cluster = 8'b10001010;
        
     #1 cluster0 = 8'b01101000;
        cluster1 = 8'b01100001;
        cluster2 = 8'b01110100;
        cluster3 = 8'b00100000;
        csum_cluster = 8'b10100011;
        
     #1 cluster0 = 8'b00110100;
        cluster1 = 8'b11000010;
        cluster2 = 8'b11001011;
        cluster3 = 8'b01100100;
        csum_cluster = 8'b01111011;

     #1 cluster0 = 8'b01101000;
        cluster1 = 8'b01100001;
        cluster2 = 8'b01110010;
        cluster3 = 8'b01100100;
        csum_cluster = 8'b01100001;

     #1 cluster0 = 8'b00101110;
        cluster1 = 8'b00100000;
        cluster2 = 8'b01010010;
        cluster3 = 8'b01101001;
        csum_cluster = 8'b11110111;

     #1 cluster0 = 8'b10001011;
        cluster1 = 8'b00110011;
        cluster2 = 8'b01001000;
        cluster3 = 8'b11111111;
        csum_cluster = 8'b10000001;

     #1 cluster0 = 8'b01100111;
        cluster1 = 8'b01101000;
        cluster2 = 8'b01110100;
        cluster3 = 8'b00111111;
        csum_cluster = 8'b01111110;

     #1 cluster0 = 8'b00100000;
        cluster1 = 8'b01000111;
        cluster2 = 8'b01110010;
        cluster3 = 8'b01100101;
        csum_cluster = 8'b11000010;

     #1 cluster0 = 8'b01100001;
        cluster1 = 8'b01110100;
        cluster2 = 8'b00100000;
        cluster3 = 8'b01101010;
        csum_cluster = 8'b10100001;

     #1 cluster0 = 8'b01110100;
        cluster1 = 8'b01000000;
        cluster2 = 8'b11111111;
        cluster3 = 8'b01100011;
        csum_cluster = 8'b10111011;

     #1 cluster0 = 8'b01101111;
        cluster1 = 8'b01100010;
        cluster2 = 8'b00100001;
        cluster3 = 8'b00000000;
        csum_cluster = 8'b00001110;
    end
    
endmodule
