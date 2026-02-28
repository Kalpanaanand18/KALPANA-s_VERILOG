module halfadd(A,B,S,C);
  input A,B;
  output S,C;
  assign S = A^B;
  assign C = A&B;
endmodule
module halfadd_tb();
  reg A,B;
  wire S,C;
  halfadd halfaddg(.A(A),.B(B),.S(S),.C(C));
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,halfadd_tb);
  end
  initial begin 
    A=1'b0;B=1'b0;
    #10 A=1'b0;B=1'b1;
     #10 A=1'b1;B=1'b0;
     #10 A=1'b1;B=1'b1;
     #10 $finish;
  end
  always@(*)begin 
    $display("time=%0t A=%b B=%b S=%b C=%b",$time,A,B,S,C);
  end
endmodule
