module RegIF_ID(input clk, rst, clr, en, input [31:0] instrF, PCF, PCPlus4F, output [31:0] instrD, PCD, PCPlus4D);

   reg_32bit instr(clk, rst, clr, en, instrF, instrD);
   reg_32bit pd(clk, rst, clr, en, PCF, PCD);
   reg_32bit PCPlus4(clk, rst, clr, en, PCPlus4F, PCPlus4D);
endmodule
