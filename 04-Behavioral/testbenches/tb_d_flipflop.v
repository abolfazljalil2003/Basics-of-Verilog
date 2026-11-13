`timescale 1ns/1ps

// تست‌بنچ D Flip-Flop
// ساعت تولید می‌کند و الگوی داده را در لبه‌های مختلف اعمال می‌کند

module tb_d_flipflop();

reg clk, reset, d;
wire q;

d_flipflop DUT(.clk(clk), .reset(reset), .d(d), .q(q));

// تولید ساعت: دوره 10ns
always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t clk=%b d=%b q=%b", $time, clk, d, q);

    clk = 0; reset = 1; d = 0;
    #10 reset = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 1;
    #10 d = 0;
    #10 $finish;
end

endmodule
