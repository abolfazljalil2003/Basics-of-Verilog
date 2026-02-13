`timescale 1ns/1ps

module tb_full_adder_structural();

reg a, b, cin;
wire sum, cout;

full_adder_structural DUT(
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
);

initial begin
    $monitor("Time=%0t a=%b b=%b cin=%b sum=%b cout=%b", 
             $time, a, b, cin, sum, cout);
    
    a = 0; b = 0; cin = 0;
    #10 a = 0; b = 0; cin = 1;
    #10 a = 0; b = 1; cin = 0;
    #10 a = 0; b = 1; cin = 1;
    #10 a = 1; b = 0; cin = 0;
    #10 a = 1; b = 0; cin = 1;
    #10 a = 1; b = 1; cin = 0;
    #10 a = 1; b = 1; cin = 1;
    #10 $finish;
end

endmodule