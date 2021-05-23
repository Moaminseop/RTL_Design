`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/22 20:29:18
// Design Name: 
// Module Name: message
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


module message(cluster0, cluster1, cluster2, cluster3, csum_cluster, cluster_data0, cluster_data1, cluster_data2, cluster_data3);
    input [7:0] cluster0, cluster1, cluster2, cluster3, csum_cluster;
    output reg [7:0] cluster_data0, cluster_data1, cluster_data2, cluster_data3;
    
    reg [7:0] csum;
    
    initial begin
        cluster_data0 = 8'b00000000;
        cluster_data1 = 8'b00000000;
        cluster_data2 = 8'b00000000;
        cluster_data3 = 8'b00000000;
    end
    
    always @(*) begin
        csum = cluster0 + cluster1 + cluster2 + cluster3;
        csum = ~csum + 1'b1;
        
        if(csum == csum_cluster) begin
            cluster_data0 = cluster0;
            cluster_data1 = cluster1;
            cluster_data2 = cluster2;
            cluster_data3 = cluster3;
            $display("%h %h %h %h",  cluster_data0, cluster_data1, cluster_data2, cluster_data3);
            $display("%c %c %c %c",  cluster_data0, cluster_data1, cluster_data2, cluster_data3);
        end
        else begin
            cluster_data0 = 8'b00000000;
            cluster_data1 = 8'b00000000;
            cluster_data2 = 8'b00000000;
            cluster_data3 = 8'b00000000;
            $display("%h %h %h %h",  cluster_data0, cluster_data1, cluster_data2, cluster_data3);
        end
    end
    
endmodule
