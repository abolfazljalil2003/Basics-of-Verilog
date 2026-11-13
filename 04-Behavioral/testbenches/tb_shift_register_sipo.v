`timescale 1ns/1ps

// تست‌بنچ SIPO
// بایت 8'b10110011 به صورت سریال ارسال می‌شود
// داده در میانه دوره ساعت (لبه پایین‌رونده) اعمال می‌شود تا رقابت با لبه ساعت نداشته باشد
// اولین بیت ارسالی (MSB) در بیت 7 رجیستر می‌نشیند

module tb_shift_register_sipo();

reg clk, din;
wire [7:0] q;

shift_register_sipo DUT(.clk(clk), .din(din), .q(q));

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t din=%b q=%b", $time, din, q);

    clk = 0; din = 0;

    // ارسال بیت‌های 10110011 از MSB در لبه‌های پایین‌رونده
    @(negedge clk); din = 1;   // b7
    @(negedge clk); din = 0;   // b6
    @(negedge clk); din = 1;   // b5
    @(negedge clk); din = 1;   // b4
    @(negedge clk); din = 0;   // b3
    @(negedge clk); din = 0;   // b2
    @(negedge clk); din = 1;   // b1
    @(negedge clk); din = 1;   // b0

    // صبر برای آخرین لبه بالارونده
    @(posedge clk);
    #1 $display("بایت دریافتی: %b (انتظار: 10110011)", q);
    #9 $finish;
end

endmodule
