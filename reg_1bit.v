module reg_1bit(input clk, rst, clr, en, input  in, output reg out);
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
