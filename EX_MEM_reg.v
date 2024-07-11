module RegEX_MEM(input clk, rst, memWriteE, regWriteE, luiE, input [31:0] AluResultE, writeDataE, PCPlus4E, extImmE, input [4:0] RdE, input [1:0] resultSrcE,
                  output memWriteM, regWriteM, luiM, output [31:0] AluResultM, writeDataM, PCPlus4M, extImmM, output [4:0] RdM, output [1:0] resultSrcM);
 
   reg_32bit aluresult(clk, rst, 1'b0, 1'b1, AluResultE, AluResultM);
   reg_32bit writedata(clk, rst, 1'b0, 1'b1, writeDataE, writeDataM);
   reg_32bit pcplus4(clk, rst, 1'b0, 1'b1, PCPlus4E, PCPlus4M);
   reg_32bit extimm(clk, rst, 1'b0, 1'b1, extImmE, extImmM);

   reg_5bit rd(clk, rst, 1'b0, 1'b1, RdE, RdM);
   
   reg_2bit resultsrc(clk, rst, 1'b0, 1'b1, resultSrcE, resultSrcM);

   reg_1bit memwrite(clk, rst, 1'b0, 1'b1, memWriteE, memWriteM);
   reg_1bit regwrite(clk, rst, 1'b0, 1'b1, regWriteE, regWriteM);
   reg_1bit lui(clk, rst, 1'b0, 1'b1, luiE, luiM);

endmodule
