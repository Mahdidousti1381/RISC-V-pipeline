module main_controller(input [2:0] func3, input [6:0] op, output reg memWriteD, regWriteD, AluSrcD, luiD, output reg [1:0] resultSrcD, JumpD, Aluop, output reg [2:0] BranchD, immSrcD);
parameter [6:0] R_T = 7'b0110011, I_T = 7'b0010011, S_T = 7'b0100011, B_T = 7'b1100011, U_T = 7'b0110111, J_T = 7'b1101111, LW_T = 7'b0000011, JALR_T = 7'b1100111;
parameter [2:0] Beq = 3'b000, Bne = 3'b001, Blt = 3'b010, Bge = 3'b011;


   always@(func3, op)begin
      {Aluop, regWriteD, immSrcD, AluSrcD, memWriteD, 
             resultSrcD, JumpD, BranchD, luiD} <= 16'b0;
      case (op)
            R_T: begin
               Aluop      <= 2'b10;
               regWriteD  <= 1'b1;
            end
        
            I_T: begin
               Aluop      <= 2'b11;
               regWriteD  <= 1'b1;
               immSrcD    <= 3'b000;
               AluSrcD    <= 1'b1;
               resultSrcD <= 2'b00;
            end
        
            S_T: begin
               Aluop      <= 2'b00;
               memWriteD  <= 1'b1;
               immSrcD    <= 3'b001;
               AluSrcD    <= 1'b1;
            end
        
            B_T: begin
               Aluop      <= 2'b01;
               immSrcD    <= 3'b010;
                case(func3)
                    Beq : BranchD <= 3'b001;
                    Bne : BranchD <= 3'b010;
                    Blt : BranchD <= 3'b011;
                    Bge : BranchD <= 3'b100;
                    default: BranchD <= 3'b000;
                endcase
            end
        
            U_T: begin
               resultSrcD <= 2'b11;
               immSrcD    <= 3'b100;
               regWriteD  <= 1'b1;
               luiD <= 1'b1;
            end
        
            J_T: begin
               resultSrcD <= 2'b10;
                immSrcD    <= 3'b011;
                JumpD      <= 2'b01;
                regWriteD  <= 1'b1;
            end
        
            LW_T: begin
               Aluop      <= 2'b00;
                regWriteD  <= 1'b1;
                immSrcD    <= 3'b000;
                AluSrcD    <= 1'b1;
                resultSrcD <= 2'b01;
            end
        
            JALR_T: begin
              	Aluop      <= 2'b00;
                regWriteD  <= 1'b1;
                immSrcD    <= 3'b000;
                AluSrcD    <= 1'b1;
                JumpD      <= 2'b10;
                resultSrcD <= 2'b10;
            end
            default: begin
                regWriteD <= 1'b0;
                AluSrcD   <= 2'b00;
                Aluop     <= 3'b000;
            end

        endcase
    end

endmodule

