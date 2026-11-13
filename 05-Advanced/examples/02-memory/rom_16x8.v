// ROM 16 خانه x 8 بیت
// مقدارها با $readmemh از فایل rom_data.mem خوانده می‌شوند
// خواندن ترکیبی است (بدون ساعت)

module rom_16x8(
    input [3:0] addr,
    output reg [7:0] dout
);

reg [7:0] mem [0:15];

initial begin
    $readmemh("rom_data.mem", mem);
end

always @(*)
    dout = mem[addr];

endmodule
