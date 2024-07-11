module RegMEM_WB(input clk, rst, regWriteM, input [31:0] AluResultM, RDM, PCPlus4M, extImmM, input [4:0] RdM,input [1:0]  resultSrcM, 
                  output  regWriteW, output  [31:0] AluResultW, RDW, PCPlus4W, extImmW, output [4:0] RdW, output [1:0] resultSrcW);

   reg_32bit aluresult(clk, rst, 1'b0, 1'b1, AluResultM,AluResultW);
   reg_32bit RD(clk, rst, 1'b0, 1'b1, RDM, RDW);
   reg_32bit pcplus4(clk, rst, 1'b0, 1'b1, PCPlus4M,PCPlus4W);
   reg_32bit extimm(clk, rst, 1'b0, 1'b1, extImmM,extImmW);

   reg_5bit rd(clk, rst, 1'b0, 1'b1, RdM, RdW);
   
   reg_2bit resultsrc(clk, rst, 1'b0, 1'b1, resultSrcM, resultSrcW);
   
   reg_1bit regwrite(clk, rst, 1'b0, 1'b1, regWriteM, regWriteW);

endmodule
