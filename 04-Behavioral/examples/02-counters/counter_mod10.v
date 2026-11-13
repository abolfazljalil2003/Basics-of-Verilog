// شمارنده Mod-10 (صفر تا نه)
// پایه ساخت ساعت دیجیتال و شمارنده‌های دهدهی

module counter_mod10(
    input clk,
    input reset,        // reset همزمان
    output reg [3:0] count,
    output carry        // وقتی به 9 رسید یک پالس می‌دهد
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else if (count == 4'd9)
        count <= 4'd0;
    else
        count <= count + 4'd1;
end

assign carry = (count == 4'd9);

endmodule
