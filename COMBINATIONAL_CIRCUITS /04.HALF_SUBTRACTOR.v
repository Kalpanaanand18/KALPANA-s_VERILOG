module halfsub(a,b,d,b0);
  input a,b;
  output d,b0;
  assign d = (a^b);
  assign b0 = ((~a)&b);
endmodule
module halfsub_tb();
  reg a,b;
  wire d,b0;
  halfsub halfsubg(a,b,d,b0);
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,halfsub_tb);
  end
  initial begin 
    $monitor("time=%0t a=%b b=%b d=%b b0=%b",$time,a,b,d,b0);
    a=1'b0;b=1'b0;
    #10 a=1'b0;b=1'b1; 
    #10 a=1'b1;b=1'b0; 
    #10 a=1'b1;b=1'b1; 
    #10 $finish;
  end
endmodule
