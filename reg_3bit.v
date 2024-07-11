module reg_3bit(input clk, rst, clr, en, input [2:0] in, output reg[2:0] out);
always@(posedge clk or posedge rst)
   begin 
      if (rst | clr )
            out = 0;
      else if (en)
            out = in;
     else 
           out = out;

   end
endmodule
