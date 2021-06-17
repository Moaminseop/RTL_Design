`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/12 16:34:54
// Design Name: 
// Module Name: data_path
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


module data_path(clk, rst, jump, branch, mem_read, mem_write, alu_src, reg_write, reg_dst, mem_to_reg, alu_op, op, current_instr, current_pc, RF1, RF2, RF3, RF4, RF5, RF7);

    input clk, rst;
    input jump, branch, mem_read, mem_write, alu_src, reg_write;
    input [1:0] reg_dst, mem_to_reg, alu_op;
    output [2:0] op;
    output [15:0] current_instr;
    output [12:0] current_pc;
    output [15:0] RF1, RF2, RF3, RF4, RF5, RF7;
     
    reg [12:0] pc;
    wire [12:0] pc_p2, pc_next, pc_branch, pc_jump;
    wire [15:0] instruction, read_data1, read_data2, write_data, write_data_reg, in2, alu_res, read_data_in_datamem, sign_extend;
    wire zero, jr_control;
    wire [3:0] func;
    wire [2:0] write_reg, alu_control;
         
    always @(posedge clk or negedge rst) begin   
        if(rst == 0)
            pc <= 13'd0; 
        else pc <= pc_next;
    end
    
    assign pc_p2 = pc + 13'd1;
    
    instruction_memory im (clk, pc, instruction);
    
    assign func = instruction[3:0];
    
    alu_control_unit acu0(alu_op, func, alu_control);
    mux3_1 #(.BITS(3))  m3_0 (reg_dst, instruction[9:7], instruction[6:4], 7, write_reg);
    registers r0(clk, rst, reg_write, instruction[12:10], instruction[9:7], write_reg, write_data_reg, read_data1, read_data2, RF1, RF2, RF3, RF4, RF5, RF7);
    
    mux2_1 #(.BITS(16)) m2_0 (alu_src, read_data2, {9'b0,instruction[6:0]}, in2);
    alu_unit au0(read_data1, in2, alu_control, alu_res, zero);
    data_memory dm0(clk, mem_write, mem_read, alu_res, read_data2, read_data_in_datamem);
    
    mux3_1 #(.BITS(16))  m3_1(mem_to_reg, alu_res, read_data_in_datamem, {3'b0,pc_p2}, write_data);
    mux2_1 #(.BITS(16))  m2_1(jr_control, write_data, 0, write_data_reg);
    jr_control_unit jcu0(alu_op, func, jr_control);
    
    mux2_1 #(.BITS(13))  m2_2((zero&branch), pc_p2, {6'b0,instruction[6:0]} + pc_p2, pc_branch);
    mux2_1 #(.BITS(13))  m2_3(jump, pc_branch, instruction[12:0], pc_jump);
    mux2_1 #(.BITS(13))  m2_4(jr_control, pc_jump, read_data1[12:0], pc_next);

    assign op = instruction[15:13];
    assign current_instr = instruction;
    assign current_pc = pc;
    
endmodule
