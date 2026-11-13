// D Flip-Flop - حساس به لبه بالارونده ساعت
// فقط در لحظه لبه clk مقدار d به q منتقل می‌شود
// با reset همزمان (فقط در لبه ساعت بررسی می‌شود)

module d_flipflop(
    input clk,
    input reset,    // reset همزمان
    input d,
    output reg q
);

always @(posedge clk) begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
