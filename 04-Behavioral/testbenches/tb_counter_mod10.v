`timescale 1ns/1ps

// تست‌بنچ شمارنده Mod-10
// یک چرخه کامل (0 تا 9 و برگشت به 0) را شبیه‌سازی می‌کند

module tb_counter_mod10();

reg clk, reset;
wire [3:0] count;
wire carry;

counter_mod10 DUT(.clk(clk), .reset(reset), .count(count), .carry(carry));

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t count=%0d carry=%b", $time, count, carry);

    clk = 0; reset = 1;
    #10 reset = 0;

    // 15 ساعت: باید 0..9 و دوباره 0..4 ببینیم
    repeat (15) @(posedge clk);

    #10 $finish;
end

endmodule
