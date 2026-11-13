// Decoder 3 به 8 با Enable
// اگر en=0 باشد همه خروجی‌ها صفر می‌شوند

module decoder_3to8(
    input [2:0] sel,
    input en,
    output [7:0] y
);

assign y = (en) ? (8'b0000_0001 << sel) : 8'b0000_0000;

endmodule
