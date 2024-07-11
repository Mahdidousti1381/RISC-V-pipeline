module Data_memory(input clk, input [31:0] mem_adr, input [31:0] wd, input mem_write, output [31:0] rd);
    

    reg [31:0] data_mem [2000:0]; // 64KB   that is equal to 2 power 16 byte

    wire [31:0] adr;
    assign adr = {mem_adr[31:2], 2'b00};         //effectively converting a word address into a byte address.

    initial
	begin
		$readmemh("data.txt", data_mem);
	end       

    assign rd = data_mem[{2'b00, mem_adr[15:2]}]; // rd = data_mem [(in/4)]
    	
    always@ (posedge clk)
        if(mem_write)
            data_mem[mem_adr[15:0]] = wd;

   
    


endmodule

