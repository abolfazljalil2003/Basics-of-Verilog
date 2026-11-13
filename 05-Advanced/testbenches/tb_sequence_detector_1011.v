`timescale 1ns/1ps

// تست‌بنچ تشخیص‌دهنده توالی 1011
// جریان بیت تست: 101101100011011
// توالی‌های 1011 در آن: بعد از بیت‌های 0,1,2,3 (1011) و بیت‌های 2..5 (0110? نه)
// جریان: 1 0 1 1 0 1 1 0 0 0 1 1 0 1 1
// تطبیق‌ها: بیت‌های 0-3 (1011) و بیت‌های 2-5 (1011 همپوشان) و بیت‌های 11-14 (1011)

module tb_sequence_detector_1011();

reg clk, reset, din;
wire found;

sequence_detector_1011 DUT(.clk(clk), .reset(reset), .din(din), .found(found));

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t din=%b state=%0d found=%b", $time, din, DUT.state, found);

    clk = 0; reset = 1; din = 0;
    #12 reset = 0;

    // ارسال جریان بیت در لبه‌های پایین‌رونده
    @(negedge clk) din = 1;
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1;
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1;
    @(negedge clk) din = 0;
    @(negedge clk) din = 0;
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1;
    @(negedge clk) din = 0;
    @(negedge clk) din = 1;
    @(negedge clk) din = 1;

    repeat (3) @(negedge clk);
    $finish;
end

endmodule
