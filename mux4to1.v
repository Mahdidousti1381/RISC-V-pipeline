module Mux2(input [1:0] sel, input [31:0] in1, input [31:0] in2, input [31:0] in3, input [31:0] in4, output reg [31:0] mux_res);
    
    always @(in1 or in2 or in3 or in4 or sel) begin
        case (sel)
            2'b00  : mux_res <= in1;
            2'b01  : mux_res <= in2;
            2'b10  : mux_res <= in3;
            2'b11  : mux_res <= in4;
            default: mux_res <= {32{1'bz}};
        endcase
    end

endmodule

