module Alu(input signed [31:0]alu_input_1, input signed [31:0] alu_input_2, input [2:0] alu_control, output reg signed [31:0] alu_res, output  zero, output  b31);
   parameter [2:0] ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100, SLT = 3'b101;

   always @(alu_input_1 or alu_input_2 or alu_control) begin
      case(alu_control) 
          ADD : alu_res = alu_input_1 + alu_input_2;
          SUB : alu_res = alu_input_1 - alu_input_2;
          AND : alu_res = alu_input_1 & alu_input_2;
          OR  : alu_res = alu_input_1 | alu_input_2;
          XOR : alu_res = alu_input_1 ^ alu_input_2;
          SLT : alu_res = alu_input_1 < alu_input_2 ? 32'd1 : 32'd0;
         default:  alu_res = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      endcase
   end
   assign zero = (alu_input_1 == alu_input_2) ? 1'b1:1'b0;
   assign b31 = alu_res[31];
endmodule

