module Alu_controller(input [2:0] func3, input [1:0] alu_op, input func7,  output reg [2:0] alu_control);
parameter [1:0] R_T = 2'b10, I_T = 2'b11, S_T = 2'b00, B_T = 2'b01;
parameter [2:0] ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR =3'b100, SLT = 3'b101;
   always @(alu_op or func3 or func7)begin
        case (alu_op)
             R_T   : alu_control <= (func3 == 3'b000 & ~func7 ) ? ADD:
                                 (func3 == 3'b000 & func7 ) ? SUB:
                                 (func3 == 3'b111) ? AND:
                                 (func3 == 3'b110) ? OR:
                                 (func3 == 3'b010) ? SLT : 3'bxxx;
             I_T   : alu_control <= (func3 == 3'b000) ? ADD:
                                 (func3 == 3'b110) ? OR:
                                 (func3 == 3'b100) ? XOR:
                                 (func3 == 3'b010) ? SLT: 3'bxxx;
             S_T   : alu_control <= ADD;
             B_T   : alu_control <= SUB;
             default: alu_control <= ADD;
            
        endcase
    end

   
endmodule
//func7; //bit 30 instr


