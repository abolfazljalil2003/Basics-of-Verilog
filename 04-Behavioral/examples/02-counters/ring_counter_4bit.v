// Ring Counter 4 بیتی
// فقط یک بیت 1 دارد که در هر ساعت یک قدم می‌چرخد
// خروجی یک-حاره (One-Hot) است: 0001 → 0010 → 0100 → 1000 → ...

module ring_counter_4bit(
    input clk,
    input reset,        // شروع از 0001
    output reg [3:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0001;
    else
        q <= {q[2:0], q[3]};   // چرخش به چپ
end

endmodule
