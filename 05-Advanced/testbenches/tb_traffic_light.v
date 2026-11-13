`timescale 1ns/1ps

// تست‌بنچ چراغ راهنمایی
// یک چرخه کامل: قرمز(4) → سبز(4) → زرد(2) → قرمز

module tb_traffic_light();

reg clk, reset;
wire red, yellow, green;

traffic_light DUT(.clk(clk), .reset(reset),
                  .red(red), .yellow(yellow), .green(green));

always #5 clk = ~clk;

initial begin
    $monitor("Time=%0t state=%0d cnt=%0d R=%b Y=%b G=%b",
             $time, DUT.state, DUT.time_cnt, red, yellow, green);

    clk = 0; reset = 1;
    #12 reset = 0;

    // 12 تیک: 4 قرمز + 4 سبز + 2 زرد + 2 قرمز
    repeat (12) @(posedge clk);
    #10 $finish;
end

endmodule
