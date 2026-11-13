// فیلتر ضدپرش کلید (Debouncer)
// کلید هر 10ms (وقتی تایمر سرریز می‌شود) نمونه‌برداری می‌شود
// اگر 8 نمونه پشت‌سرهم یکسان بود، خروجی پایدار به‌روز می‌شود
// تایمر را به فرکانس ساعت خود تنظیم کنید (اینجا: 50MHz)

module debouncer(
    input clk,           // 50MHz
    input button_in,     // ورودی خام کلید
    output button_out    // خروجی بدون پرش
);

// --- تایمر سرریز: هر ~10ms ---
// 50MHz یعنی 500000 تیک برای 10ms
// برای شبیه‌سازی سریع مقدار کوچک بگذارید
localparam TIMER_MAX = 20'd500_000;

reg [19:0] timer;
reg        tick;

always @(posedge clk) begin
    if (timer == TIMER_MAX - 1) begin
        timer <= 20'd0;
        tick  <= 1'b1;
    end else begin
        timer <= timer + 20'd1;
        tick  <= 1'b0;
    end
end

// --- رجیستر شیفت 8 نمونه ---
reg [7:0] samples;

always @(posedge clk) begin
    if (tick)
        samples <= {samples[6:0], button_in};
end

// --- تصمیم: همه نمونه‌ها یکسان باشند ---
reg button_out_reg;

always @(posedge clk) begin
    if (tick) begin
        if (samples == 8'hFF || samples == 8'h00)
            button_out_reg <= samples[0];
    end
end

assign button_out = button_out_reg;

endmodule
