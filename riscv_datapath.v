module RiscV_datapath(input clk, rst, regWriteD, memWriteD, AluSrcD, luiD, input [1:0] resultSrcD, JumpD, input [2:0] AluControlD, BranchD, immSrcD, output [6:0] op, output [2:0] func3, output func7);
   
   wire regWriteW, regWriteM, memWriteM, luiE,luiM, regWriteE,AluSrcE, memWriteE, FlushE, zero, b31,StallF, StallD, FlushD;
   wire [1:0] resultSrcW, resultSrcM, JumpE, PCSrcE, resultSrcE, ForwardAE, ForwardBE;
   wire [2:0] BranchE, AluControlE;
   wire [4:0] RdW, RdM, Rs1E, Rs2E, RdE, Rs1D, Rs2D, RdD;

   wire [31:0] AluResultM, writeDataM, PCPlus4M, extImmM, RDM,resultW, extImmW, AluResultW, PCPlus4W, RDW,
                RD1E, RD2E, PCE, SrcAE, SrcBE, writeDataE,PCTargetE, extImmE, PCPlus4E, AluResultE, 
                PCPlus4D, instrD, PCD, RD1D, RD2D, extImmD,PCF_tick, PCF, instrF, PCPlus4F,idk; // FIXME: idk

   //stage F
   Mux3 pcmux(PCPlus4F, PCTargetE, AluResultE, PCSrcE, PCF_tick);
   reg_32bit pcreg(clk, rst, 1'b0, (~StallF), PCF_tick, PCF);
   Adder pcplus4_adder(PCF, 4, PCPlus4F);
   Inst_mem instmem(PCF, instrF);
   RegIF_ID IF_ID(clk, rst, FlushD, ~StallD, instrF, PCF, PCPlus4F, instrD, PCD, PCPlus4D);
   
///////////////////////
   //stage D
   regfile rgfile(clk, regWriteW, instrD[19:15], instrD[24:20], RdW, resultW, RD1D, RD2D);
   Imm_extension immext(immSrcD, instrD[31:7], extImmD);
   RegID_EX ID_EX(clk, rst, FlushE, AluSrcD, luiD, regWriteD, memWriteD, RD1D, RD2D, PCD, PCPlus4D, extImmD,Rs1D, Rs2D, RdD,BranchD, AluControlD,JumpD, resultSrcD,
                AluSrcE, luiE, regWriteE, memWriteE, RD1E, RD2E, PCE, PCPlus4E, extImmE, Rs1E, Rs2E ,RdE, BranchE, AluControlE,JumpE, resultSrcE);

   assign op = instrD[6:0];
   assign RdD = instrD[11:7];
   assign func3 = instrD[14:12];
   assign Rs1D =  instrD[19:15];
   assign Rs2D = instrD[24:20];
   assign func7 = instrD[30];

   //stage E
   Alu alu(SrcAE, SrcBE, AluControlE, AluResultE, zero,b31); 
   Mux3 SrcAreg(RD1E, resultW, idk, ForwardAE, SrcAE);
   Mux3 SrcBreg(RD2E, resultW, idk, ForwardBE, writeDataE);
   Mux1 BSrcBreg(AluSrcE, writeDataE, extImmE, SrcBE);
   Adder extadd(PCE, extImmE, PCTargetE);
   RegEX_MEM EX_MEM(clk, rst, memWriteE, regWriteE, luiE, AluResultE, writeDataE, PCPlus4E, extImmE, RdE, resultSrcE,
                  memWriteM, regWriteM, luiM, AluResultM, writeDataM, PCPlus4M, extImmM, RdM,  resultSrcM);


   //stage M
   Data_memory dm(clk, AluResultM, writeDataM, memWriteM, RDM);
   Mux1 lui_alu_mux(luiM, AluResultM, extImmM, idk);
   RegMEM_WB  MEM_WB(clk, rst, regWriteM, AluResultM, RDM, PCPlus4M, extImmM, RdM,resultSrcM, 
                   regWriteW, AluResultW, RDW, PCPlus4W, extImmW, RdW, resultSrcW);


   //stage W
   Mux2 resmux(resultSrcW, AluResultW, RDW,PCPlus4W, extImmW, resultW);


   hazard hazardunit(Rs1D, Rs2D, Rs1E, Rs2E, RdE, RdM, RdW,
            PCSrcE, resultSrcE[0],
            regWriteM, regWriteW,
            ForwardAE, ForwardBE,
            StallF, StallD, FlushD, FlushE
            );

   conditional  cond(JumpE, BranchE,zero,b31, PCSrcE);

endmodule
   
   
   
