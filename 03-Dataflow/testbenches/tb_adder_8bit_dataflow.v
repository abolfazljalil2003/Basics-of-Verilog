`timescale 1ns/1ps

// تست‌بنچ جمع‌کننده 8 بیتی
// چند حالت تصادفی و حالت‌های مرزی را تست می‌کند

module tb_adder_8bit_dataflow();

reg [7:0] a, b;
reg cin;
wire [7:0] sum;
wire cout;

adder_8bit_dataflow DUT(
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
);

initial begin
    $monitor("Time=%0t a=%0d b=%0d cin=%b sum=%0d cout=%b",
             $time, a, b, cin, sum, cout);

    // حالت‌های مرزی
    a = 8'd0;   b = 8'd0;   cin = 0;  #10;   // 0+0
    a = 8'd255; b = 8'd1;   cin = 0;  #10;   // سرریز
    a = 8'd255; b = 8'd255; cin = 1;  #10;   // حداکثر جمع
    a = 8'd100; b = 8'd155; cin = 0;  #10;   // 255

    // چند مقدار معمولی
    a = 8'd17;  b = 8'd25;  cin = 0;  #10;
    a = 8'd128; b = 8'd127; cin = 0;  #10;
    a = 8'd64;  b = 8'd64;  cin = 1;  #10;

    #10 $finish;
end

endmodule
