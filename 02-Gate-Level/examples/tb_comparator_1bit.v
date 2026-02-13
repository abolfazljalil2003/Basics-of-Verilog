`timescale 1ns/1ps

module tb_comparator_1bit();

reg a, b;
wire smaller, equal, greater;

comparator_1bit DUT(
    .a(a),
    .b(b),
    .smaller(smaller),
    .equal(equal),
    .greater(greater)
);

initial begin
    $monitor("Time=%0t a=%b b=%b smaller=%b equal=%b greater=%b", 
             $time, a, b, smaller, equal, greater);
    
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
end

endmodule