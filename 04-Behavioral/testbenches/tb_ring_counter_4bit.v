`timescale 1ns/1ps

// تست‌بنچ Ring Counter
// چرخش کامل حالت‌های یک-حاره را نشان می‌دهد

module tb_ring_counter_4bit();

reg clk, reset;
wire [3:0] q;

ring_counter_4bit DUT(.clk(clk), .reset(reset), .q(q));

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t q=%b", $time, q);

    clk = 0; reset = 1;
    #10 reset = 0;

    repeat (6) @(posedge clk);

    #10 $finish;
end

endmodule
