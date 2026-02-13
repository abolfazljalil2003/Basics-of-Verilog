`timescale 1ns/1ps

module tb_half_adder_structural();

reg a, b;
wire sum, carry;

half_adder_structural DUT(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

initial begin
    $monitor("Time=%0t a=%b b=%b sum=%b carry=%b", 
             $time, a, b, sum, carry);
    
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
end

endmodule