module Inst_mem(input [31:0] pc, output [31:0] inst);
    reg [31:0] inst_mem [15:0]; 

    wire [31:0] adr;
    assign adr = {pc[31:2], 2'b00};          //converting word to byte

    initial
	begin
		$readmemh("inst.txt", inst_mem);
	end

    assign inst = inst_mem[{2'b00, pc[15:2]}];
    

endmodule


