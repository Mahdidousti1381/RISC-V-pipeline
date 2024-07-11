module RISC_V(input clk, rst);

    wire AluSrcD, memWriteD, regWriteD, luiD, func7;    
    wire [1:0] resultSrcD, JumpD;
    wire [2:0] immSrcD, BranchD;
    wire [2:0] func3, AluControlD;
    wire [6:0] op; 

    RiscV_controller riscontrol(op, func3, func7, AluSrcD, memWriteD, regWriteD, luiD, resultSrcD, JumpD, AluControlD, immSrcD, BranchD);
    RiscV_datapath riscdatapath(clk, rst, regWriteD, memWriteD, AluSrcD, luiD, resultSrcD, JumpD, AluControlD, BranchD, immSrcD, op, func3, func7);
    
    
endmodule