// رجیستر شیفت سریال-ورود / موازی-خروج (SIPO)
// هر بیت داده از din وارد می‌شود و در رجیستر به چپ شیفت می‌خورد
// بعد از 8 ساعت، یک بایت کامل در q است

module shift_register_sipo(
    input clk,
    input din,
    output reg [7:0] q
);

always @(posedge clk) begin
    q <= {q[6:0], din};
end

endmodule
