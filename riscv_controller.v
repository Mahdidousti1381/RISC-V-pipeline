module RiscV_controller(input [6:0] op, input [2:0] func3, input func7, output AluSrcD, memWriteD, regWriteD, luiD, output [1:0] resultSrcD, JumpD, output [2:0] AluControlD, immSrcD, BranchD);

   wire [1:0] Aluop;
   main_controller main_cr(func3, op, memWriteD, regWriteD, AluSrcD, luiD, resultSrcD, JumpD,Aluop, BranchD, immSrcD);
   Alu_controller alu_cr(func3, Aluop, func7, AluControlD);
endmodule
   