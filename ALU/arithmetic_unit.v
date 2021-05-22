`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/09 17:36:46
// Design Name: 
// Module Name: arithmetic_unit
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


module arithmetic_unit(ina, inb, sel, out3945, over_under_flow);
    input [15:0] ina, inb;
    input [1:0] sel;
    output [15:0] out3945;
    output over_under_flow;
    
    wire [15:0] add, sub, mul, div;
    wire add_overflow, sub_underflow, mul_overflow, div_overflow;
    
    adder a0 (ina, inb, add, add_overflow);
    subtractor s0 (ina, inb, sub, sub_underflow);
    multiplier m0 (ina, inb, mul, mul_overflow);
    divider d0 (ina, inb, div, div_overflow);
    
    assign out3945 = (sel[1]) ? ((sel[0]) ? div : mul) : ((sel[0]) ? sub : add);
    assign over_under_flow = (sel[1]) ? ((sel[0]) ? div_overflow : mul_overflow) : ((sel[0]) ? sub_underflow : add_overflow);
     
endmodule

module adder(ina, inb, add, overflow);
    input [15:0] ina, inb;
    output [15:0] add;
    output overflow;
    
    wire c4, c8, c12;
    
    four_bit_adder fba0(ina[3:0], inb[3:0], 0, add[3:0], c4);
    four_bit_adder fba1(ina[7:4], inb[7:4], c4, add[7:4], c8);
    four_bit_adder fba2(ina[11:8], inb[11:8], c8, add[11:8], c12);
    four_bit_adder fba3(ina[15:12], inb[15:12], c12, add[15:12], overflow);
    
endmodule

module four_bit_adder(ina, inb, cin, add, cout);
	input [3:0] ina, inb;
	input cin;
	output [3:0] add;
	output cout;

	wire c1, c2, c3;
	
	full_adder fa0(ina[0], inb[0], cin, add[0], c1);
	full_adder fa1(ina[1], inb[1], c1, add[1], c2);
	full_adder fa2(ina[2], inb[2], c2, add[2], c3);
	full_adder fa3(ina[3], inb[3], c3, add[3], cout);

endmodule

module full_adder(ina, inb, cin, out, cout);
    input ina, inb, cin;
    output out, cout;
    
    wire s1, c1, c2;

    xor  x0(s1, ina, inb);
    and  a0(c1, ina, inb);
    and  a1(c2, cin, s1);
    xor  x1(out, s1, cin);
    xor  x2(cout, c1, c2);
           
endmodule

module subtractor(ina, inb, sub, overflow);
    input [15:0] ina, inb;
    output [15:0] sub;
    output overflow;
    
    wire c4, c8, c12, c13, c14, c15, cout;
    
    four_bit_subtractor fbs0(ina[3:0], inb[3:0], 1, sub[3:0], c4);
    four_bit_subtractor fbs1(ina[7:4], inb[7:4], c4, sub[7:4], c8);
    four_bit_subtractor fbs2(ina[11:8], inb[11:8], c8, sub[11:8], c12);
    full_adder fa0(ina[12], ~inb[12], c12, sub[12], c13);
	full_adder fa1(ina[13], ~inb[13], c13, sub[13], c14);
	full_adder fa2(ina[14], ~inb[14], c14, sub[14], c15);
	full_adder fa3(ina[15], ~inb[15], c15, sub[15], cout);
	xor(overflow, cout, c15);
    
    
endmodule

module four_bit_subtractor(ina, inb, cin, sub, cout);
	input [3:0] ina, inb;
	input cin;
	output [3:0] sub;
	output cout;

	wire c1, c2, c3;
	
	full_adder fa0(ina[0], ~inb[0], cin, sub[0], c1);
	full_adder fa1(ina[1], ~inb[1], c1, sub[1], c2);
	full_adder fa2(ina[2], ~inb[2], c2, sub[2], c3);
	full_adder fa3(ina[3], ~inb[3], c3, sub[3], cout);

endmodule

module multiplier(ina, inb, mul, overflow);
    input [15:0] ina, inb;
    output [15:0] mul;
    output overflow;
    
    reg [31:0] A;
    reg [15:0] B;
    reg flow;
    wire [31:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;
    wire [31:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15;
    
    always @(*) begin
        A = ina;
        B = inb;
    end
    
    assign a0 =   A & {32{B[0]}};
    assign a1 =  (A << 1) & {32{B[1]}};
    assign a2 =  (A << 2) & {32{B[2]}};
    assign a3 =  (A << 3) & {32{B[3]}};
    assign a4 =  (A << 4) & {32{B[4]}};
    assign a5 =  (A << 5) & {32{B[5]}};
    assign a6 =  (A << 6) & {32{B[6]}};
    assign a7 =  (A << 7) & {32{B[7]}};
    assign a8 =  (A << 8) & {32{B[8]}};
    assign a9 =  (A << 9) & {32{B[9]}};
    assign a10 =  (A << 10) & {32{B[10]}};
    assign a11 =  (A << 11) & {32{B[11]}};
    assign a12 =  (A << 12) & {32{B[12]}};
    assign a13 =  (A << 13) & {32{B[13]}};
    assign a14 =  (A << 14) & {32{B[14]}};
    assign a15 =  (A << 15) & {32{B[15]}};
    
    adder_32bit ab0(a0, 0, p0);
    adder_32bit ab1(a1, p0, p1);
    adder_32bit ab2(a2, p1, p2);
    adder_32bit ab3(a3, p2, p3);
    adder_32bit ab4(a4, p3, p4);
    adder_32bit ab5(a5, p4, p5);
    adder_32bit ab6(a6, p5, p6);
    adder_32bit ab7(a7, p6, p7);
    adder_32bit ab8(a8, p7, p8);
    adder_32bit ab9(a9, p8, p9);
    adder_32bit ab10(a10, p9, p10);
    adder_32bit ab11(a11, p10, p11);
    adder_32bit ab12(a12, p11, p12);
    adder_32bit ab13(a13, p12, p13);
    adder_32bit ab14(a14, p13, p14);
    adder_32bit ab15(a15, p14, p15);
    
    always @(*) begin
        flow = 0;
        if(p15 > 16'b1111_1111_1111_1111) flow = 1;
    end
    
    assign mul = p15;
    assign overflow = flow;
    
endmodule

module adder_32bit(ina, inb, add);
    input [31:0] ina, inb;
    output [31:0] add;
    
    wire c4, c8, c12, c16, c20, c24, c28, cout;
    
    four_bit_adder fba0(ina[3:0], inb[3:0], 0, add[3:0], c4);
    four_bit_adder fba1(ina[7:4], inb[7:4], c4, add[7:4], c8);
    four_bit_adder fba2(ina[11:8], inb[11:8], c8, add[11:8], c12);
    four_bit_adder fba3(ina[15:12], inb[15:12], c12, add[15:12], c16);
    four_bit_adder fba4(ina[19:16], inb[19:16], c16, add[19:16], c20);
    four_bit_adder fba5(ina[23:20], inb[23:20], c20, add[23:20], c24);
    four_bit_adder fba6(ina[27:24], inb[27:24], c24, add[27:24], c28);
    four_bit_adder fba7(ina[31:28], inb[31:28], c28, add[31:28], cout);

endmodule

module divider(ina, inb, div, overflow);
    input [15:0] ina, inb;
    output [15:0] div;
    output overflow;
    
    reg flow;
    reg [15:0] reminder, quotient, divisor, rtmp;
    reg [31:0] rq;
    
    always @(*) begin : block_to_disable
        reminder = 0;                       // 나머지
        quotient = ina;                     // 몫 이면서 나눠지는 수
        divisor = inb;                      // 나누는 수
        rq = {reminder,quotient};           // 나머지+몫
        flow = 0;                           // 오버플로우 체크
        
        if(divisor == 0) begin              // 나누는 수가 0이면 오버플로우
            flow = 1;                       // 오버플로우를 1로 바꾼다
            rq[15:0] = 0;                   // 몫을 0으로 만들어준다
            disable block_to_disable;       // always문 바로 종료
        end
        
        repeat(16) begin                    // 16bit 이기 때문에 16번 반복
            rq = rq << 1;                   // rq를 왼쪽으로 1칸 시프트
            rtmp = rq[31:16];               // 나머지를 일시적으로 저장
            if(rtmp >= divisor) begin       // 나머지가 나누는 수 보다 큰지 체크
                rq[0] = 1;                  // 몫의 1번째 비트를 1로 만든다.
                rq[31:16] = rtmp - divisor; // 나머지 - 나누는 수
            end
        end
    end
    
    assign div = rq[15:0];                  // 최종 몫을 구해 div에 할당
    assign overflow = flow;                 // 오버플로우 체크
    
endmodule
