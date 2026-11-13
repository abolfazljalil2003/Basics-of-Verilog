// RAM همزمان 16 خانه x 8 بیت
// نوشتن و خواندن هر دو در لبه بالارونده ساعت
// we=1: نوشتن | we=0: فقط خواندن
// الگوی استاندارد برای سنتز روی Block RAM

module ram_16x8(
    input clk,
    input we,
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

// آرایه حافظه: 16 خانه 8 بیتی
reg [7:0] mem [0:15];

// پورت نوشتن
always @(posedge clk) begin
    if (we)
        mem[addr] <= din;
end

// پورت خواندن
always @(posedge clk) begin
    dout <= mem[addr];
end

endmodule
