`timescale 1ns/1ps

module tb_xor2();

reg a, b;
wire out;

xor2 DUT(
    .a(a),
    .b(b),
    .out(out)
);

initial begin
    $monitor("Time=%0t a=%b b=%b out=%b", $time, a, b, out);
    
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
end

endmodule