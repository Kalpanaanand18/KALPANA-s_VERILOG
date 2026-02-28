module fulladd(A,B,CIN,S,COUT);
  input A,B,CIN;
  output S,COUT;
  assign S = (A^B^CIN);
  assign COUT = (((A^B)&(CIN))|(A&B));
endmodule
module fulladd_tb();
  reg A,B,CIN;
  wire S,COUT;
  fulladd fulladdg(.A(A),.B(B),.CIN(CIN),.S(S),.COUT(COUT));
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,fulladd_tb);
  end
  initial begin 
    A=1'b0;B=1'b0;CIN=1'b0;
    #10  A=1'b0;B=1'b0;CIN=1'b1;
      #10  A=1'b0;B=1'b1;CIN=1'b0;
      #10  A=1'b0;B=1'b1;CIN=1'b1;
      #10  A=1'b1;B=1'b0;CIN=1'b0;
      #10  A=1'b1;B=1'b0;CIN=1'b1;
      #10  A=1'b1;B=1'b1;CIN=1'b0;
      #10  A=1'b1;B=1'b1;CIN=1'b1;
      #10 $finish;
  end
  always@(*)begin
    $display("time=%0t A=%b B=%b CIN=%b S=%b COUT=%b",$time,A,B,CIN,S,COUT);
  end
endmodule
