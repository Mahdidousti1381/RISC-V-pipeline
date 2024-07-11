
module regfile(input reg clk, input reg we3, input reg [4:0] A1, A2, A3, input reg [31:0] wd3, output  [31:0] rd1, rd2);
    reg [31:0] reg_file[31:0];
    
    initial begin
        reg_file[0] = 32'd0;
    end

    assign rd1 = reg_file[A1] ;
    assign rd2 = reg_file[A2] ;

    always @(posedge clk) begin
        if (we3)begin
          if (A3 !=0) reg_file[A3] <= wd3;
        end
    end
    
endmodule

