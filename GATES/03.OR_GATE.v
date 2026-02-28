module org(A,B,Y);
input A,B;
output Y;
assign Y = A | B;
endmodule
module org_tb();
reg A,B;
wire Y;
  org orgate(.A(A),.B(B),.Y(Y));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,org_tb);
  end
initial begin
    A=1'b0;B=1'b0;
    #10 A=1'b0;B=1'b1;
    #10 A=1'b1;B=1'b0;
    #10 A=1'b1;B=1'b1;
    #10 $finish;
end
  always@(*) begin
    $display("time=%0t  A=%b B=%b Y=%b",$time,A,B,Y);
  end
endmodule
