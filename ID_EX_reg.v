module RegID_EX(input clk, rst, clr, AluSrcD, luiD, regWriteD, memWriteD, input [31:0] RD1D, RD2D, PCD, PCPlus4D, extImmD, input [4:0] Rs1D, Rs2D, RdD, input [2:0] BranchD, AlucontrolD, input [1:0] JumpD, resultSrcD,
                output  AluSrcE, luiE, regWriteE, memWriteE, output  [31:0] RD1E, RD2E, PCE, PCPlus4E, extImmE, output  [4:0] Rs1E, Rs2E ,RdE, output  [2:0] BranchE, AlucontrolE, output  [1:0] JumpE, resultSrcE);
   reg_32bit rd1(clk, rst, clr, 1'b1, RD1D, RD1E);
   reg_32bit rd2(clk, rst, clr, 1'b1, RD2D, RD2E);
   reg_32bit pc(clk, rst, clr, 1'b1, PCD, PCE);
   reg_32bit pcplus4(clk, rst, clr, 1'b1, PCPlus4D, PCPlus4E);
   reg_32bit extimm(clk, rst, clr, 1'b1, extImmD, extImmE);

   reg_5bit rs1(clk ,rst, clr, 1'b1, Rs1D, Rs1E);
   reg_5bit rs2(clk ,rst, clr, 1'b1, Rs2D, Rs2E);
   reg_5bit rd(clk ,rst, clr, 1'b1, RdD, RdE);

   reg_3bit branch(clk, rst, clr, 1'b1, BranchD, BranchE);
   reg_3bit alucontrol(clk, rst, clr, 1'b1, AlucontrolD, AlucontrolE);
   
   reg_2bit jump(clk, rst, clr, 1'b1, JumpD, JumpE);
   reg_2bit resultsrc(clk, rst, clr, 1'b1, resultSrcD, resultSrcE);

   reg_1bit alusrc(clk, rst, clr, 1'b1, AluSrcD, AluSrcE);
   reg_1bit lui(clk, rst, clr, 1'b1, luiD, luiE);
   reg_1bit regwrite(clk, rst, clr, 1'b1, regWriteD, regWriteE);
   reg_1bit memwrite(clk, rst, clr, 1'b1, memWriteD, memWriteE);
endmodule
