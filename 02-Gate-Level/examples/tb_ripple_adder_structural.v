`timescale 1ns/1ps

module tb_ripple_adder_structural();

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

ripple_adder_4bit_structural DUT(
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
);

initial begin
    $monitor("Time=%0t a=%d b=%d cin=%b sum=%d cout=%b", 
             $time, a, b, cin, sum, cout);
    
    a = 4'd0; b = 4'd0; cin = 0;
    #10 a = 4'd5; b = 4'd3; cin = 0;
    #10 a = 4'd15; b = 4'd1; cin = 0;
    #10 a = 4'd7; b = 4'd9; cin = 1;
    #10 a = 4'd15; b = 4'd15; cin = 1;
    #10 $finish;
end

endmodule