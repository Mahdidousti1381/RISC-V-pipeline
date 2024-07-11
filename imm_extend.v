module Imm_extension(input [2:0] imm_src, input [31:7] imm_data,output reg [31:0] imm_res);
parameter [2:0] I_T = 3'b000, S_T = 3'b001, B_T  = 3'b010, J_T = 3'b011, U_T = 3'b100;
  

    always @(imm_src, imm_data) begin
        case(imm_src)
             I_T   : imm_res <= {{20{imm_data[31]}}, imm_data[31:20]};
             S_T   : imm_res <= {{20{imm_data[31]}}, imm_data[31:25], imm_data[11:7]};
	     B_T   : imm_res <= {{20{imm_data[31]}}, imm_data[7], imm_data[30:25], imm_data[11:8], 1'b0};
             J_T   : imm_res <= {{12{imm_data[31]}}, imm_data[19:12], imm_data[20], imm_data[30:21], 1'b0};
             U_T   : imm_res <= {imm_data[31:12], {12{1'b0}}};
            default: imm_res <= 32'b0;
        endcase
    end

endmodule
