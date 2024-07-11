module Mux1(input sel, input [31:0] in1, input [31:0] in2, output [31:0] mux_res);
    
    
    assign mux_res = sel ? in2 : in1;

endmodule

