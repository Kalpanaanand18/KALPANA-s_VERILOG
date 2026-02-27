module halfadd(a,b,s,c);
  input a,b;
  output s,c;
  assign s = a^b;
  assign c = a&b;
endmodule
 
module fulladd(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
  wire s1,c1,c2;
  halfadd aa(a,b,s1,c1);
  halfadd bb(s1,cin,sum,c2);
  assign cout = c1 | c2;
endmodule



module fulladd_tb();
  reg x,y,zin;
  wire s,c;
  fulladd fulladdg(x,y,zin,s,c);
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,fulladd_tb);
  end
  initial begin 
    $monitor("time=%0t x=%b y=%b zin=%b s=%b c=%b",$time,x,y,zin,s,c);
    x=1'b0;y=1'b0;zin=1'b0;
    #10   x=1'b0;y=1'b0;zin=1'b1;
  #10   x=1'b0;y=1'b1;zin=1'b0;
  #10   x=1'b0;y=1'b1;zin=1'b1;
  #10   x=1'b1;y=1'b1;zin=1'b1;
  #10 $finish;
  end
endmodule 

    
