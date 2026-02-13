`timescale 1ns/1ps

module tb_nand2();

reg A, B;
wire out;

nand2 DUT(
    .A(A),
    .B(B),
    .out(out)
);

initial begin
    $monitor("Time=%0t A=%b B=%b out=%b", $time, A, B, out);
    
    A = 0; B = 0;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;
end

endmodule