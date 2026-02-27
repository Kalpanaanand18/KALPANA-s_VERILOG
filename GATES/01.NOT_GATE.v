module notg(A,Y);
input A;
output Y;
  assign Y =~(A);
endmodule
module notg_tb();
reg A;
wire Y;
  notg notgate(.A(A),.Y(Y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,notg_tb);
  end
initial begin
    A=1'b0;
    #10 A=1'b1;
    #10 $finish;
end
  always@(*) begin
    $display("time=%0t  A=%b  Y=%b",$time,A,Y);
  end
endmodule

