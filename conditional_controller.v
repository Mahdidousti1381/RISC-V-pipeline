module conditional(input [1:0] JumpE, input [2:0] BranchE, input zero, input b31, output reg [1:0] PCSrcE);
parameter [2:0] NotBranch = 3'b000, Beq = 3'b001, Bne = 3'b010, Blt = 3'b011, Bge = 3'b100; 
parameter [1:0] JAL = 2'b01, JALR = 2'b10;
   always@(JumpE, BranchE, zero, b31)begin
      case(BranchE)
         NotBranch : PCSrcE <= (JumpE == 2'b01)  ? 2'b01 :
                            (JumpE == 2'b10) ? 2'b10 : 2'b00;

         Beq : PCSrcE <= (zero) ? 2'b01 : 2'b00;
         Bne : PCSrcE <= (~zero) ? 2'b01 : 2'b00;
         Blt : PCSrcE <= (b31) ? 2'b01 : 2'b00;
         Bge : PCSrcE <= (zero | ~b31) ? 2'b01 : 2'b00;
        endcase
    end

endmodule
