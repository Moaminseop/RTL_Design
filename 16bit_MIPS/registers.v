`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 20:02:28
// Design Name: 
// Module Name: registers
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


module registers(clk, rst, reg_write, read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2, RF0, RF1, RF2, RF3, RF4, RF7);
    input clk, rst, reg_write;
    input [2:0] read_reg1, read_reg2, write_reg;
    input [15:0] write_data;
    output [15:0] read_data1, read_data2;
    output [15:0] RF0, RF1, RF2, RF3, RF4, RF7;
    
    reg [15:0] register_file [7:0]; 
    
    always @(posedge clk or negedge rst) begin
        if(rst == 0) begin
            register_file[0] <= 16'b0;
            register_file[1] <= 16'b0;
            register_file[2] <= 16'b0;
            register_file[3] <= 16'b0;
            register_file[4] <= 16'b0;
            register_file[5] <= 16'b0;
            register_file[6] <= 16'b0;
            register_file[7] <= 16'b0;
        end
        
        else if(reg_write) register_file[write_reg] <= write_data;
    end
    
    assign read_data1 = register_file[read_reg1];
    assign read_data2 = register_file[read_reg2];
    assign RF0 = register_file[0];
    assign RF1 = register_file[1];
    assign RF2 = register_file[2];
    assign RF3 = register_file[3];
    assign RF4 = register_file[4];
    assign RF7 = register_file[7];
    
endmodule
