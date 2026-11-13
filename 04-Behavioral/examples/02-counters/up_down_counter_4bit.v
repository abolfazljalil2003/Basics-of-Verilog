// شمارنده بالا/پایین شمار 4 بیتی
// up_down=1: شمارش افزایشی | up_down=0: شمارش کاهشی
// 0-1 به طور طبیعی به 15 برمی‌گردد (wrap around)

module up_down_counter_4bit(
    input clk,
    input reset,
    input up_down,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else if (up_down)
        count <= count + 4'd1;
    else
        count <= count - 4'd1;
end

endmodule
