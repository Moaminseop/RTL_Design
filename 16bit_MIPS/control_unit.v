`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/06 03:02:42
// Design Name: 
// Module Name: control_unit
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


module control_unit(op, reg_dst, jump, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
    input [2:0] op;
    output reg [1:0] reg_dst, mem_to_reg, alu_op;
    output reg jump, branch, mem_read, mem_write, alu_src, reg_write;
    
    always @(*) begin
        case(op) 
        3'b000: begin       // R-type op
            reg_dst = 2'b01;
            jump = 1'b0;
            branch = 1'b0;
            mem_read = 1'b0;
            mem_to_reg = 2'b00;
            mem_write = 1'b0;
            alu_src = 1'b0;
            reg_write = 1'b1;
            alu_op = 2'b00;
            end
        3'b001: begin       // slti op
            reg_dst = 2'b00;
            alu_src = 1'b1;
            mem_to_reg = 2'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            alu_op = 2'b10;
            jump = 1'b0;
            end
        3'b010: begin       // j op
            reg_dst = 2'b00;
            alu_src = 1'b0;
            mem_to_reg = 2'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            alu_op = 2'b0;
            jump = 1'b1;
            end
        3'b011: begin       // jal op
            reg_dst = 2'b10;
            alu_src = 1'b0;
            mem_to_reg = 2'b10;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            alu_op = 2'b00;
            jump = 1'b1;
            end
        3'b100: begin       // lw op
            reg_dst = 2'b00;
            alu_src = 1'b1;
            mem_to_reg = 2'b01;
            reg_write = 1'b1;
            mem_read = 1'b1;
            mem_write = 1'b0;
            branch = 1'b0;
            alu_op = 2'b11;
            jump = 1'b0;
            end
        3'b101: begin       // sw op
            reg_dst = 2'b00;
            alu_src = 1'b1;
            mem_to_reg = 2'b00;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b1;
            branch = 1'b0;
            alu_op = 2'b11;
            jump = 1'b0;
            end
        3'b110: begin       // beq op
            reg_dst = 2'b00;
            alu_src = 1'b0;
            mem_to_reg = 2'b0;
            reg_write = 1'b0;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b1;
            alu_op = 2'b01;
            jump = 1'b0;
            end
        3'b111: begin       // addi op
            reg_dst = 2'b00;
            alu_src = 1'b1;
            mem_to_reg = 2'b0;
            reg_write = 1'b1;
            mem_read = 1'b0;
            mem_write = 1'b0;
            branch = 1'b0;
            alu_op = 2'b11;
            jump = 1'b0;
            end
        default: begin  
            reg_dst = 2'b01;  
            mem_to_reg = 2'b00;  
            alu_op = 2'b00;  
            jump = 1'b0;  
            branch = 1'b0;  
            mem_read = 1'b0;  
            mem_write = 1'b0;  
            alu_src = 1'b0;  
            reg_write = 1'b1;  
            end  
        endcase
    end
endmodule
