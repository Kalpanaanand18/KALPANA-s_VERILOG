module fullsub(A,B,C,D,B0);
  input A,B,C;
  output B0,D;
  assign D = (A^B^C);
  assign B0 = ((~A)&(B)) | (~(A^B)&C);
endmodule
module fullsub_tb();
  reg A,B,C;
  wire D,B0;
  fullsub fullsubg(.A(A),.B(B),.C(C),.D(D),.B0(B0));
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0,fullsub_tb);
  end
  initial begin 
    A=1'b0;B=1'b0;C=1'b0;
    #10  A=1'b0;B=1'b0;C=1'b1;
      #10  A=1'b0;B=1'b1;C=1'b0;
      #10  A=1'b0;B=1'b1;C=1'b1;
      #10  A=1'b1;B=1'b0;C=1'b0;
      #10  A=1'b1;B=1'b0;C=1'b1;
      #10  A=1'b1;B=1'b1;C=1'b0;
      #10  A=1'b1;B=1'b1;C=1'b1;
      #10 $finish;
  end
  always@(*)begin
    $display("time=%0t A=%b B=%b C=%b D=%b B0=%b",$time,A,B,C,D,B0);
  end
endmodule
