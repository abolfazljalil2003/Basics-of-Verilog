`timescale 1ns/1ps

// تست‌بنچ Decoder 3 به 8
// همه 8 حالت انتخاب را با enable روشن و خاموش تست می‌کند

module tb_decoder_3to8();

reg [2:0] sel;
reg en;
wire [7:0] y;

decoder_3to8 DUT(
    .sel(sel),
    .en(en),
    .y(y)
);

initial begin
    $monitor("Time=%0t en=%b sel=%b y=%b", $time, en, sel, y);

    // همه حالت‌ها با enable = 1
    en = 1;
    for (sel = 0; sel < 8; sel = sel + 1) begin
        #10;
    end

    // همان حالت‌ها با enable = 0
    en = 0;
    for (sel = 0; sel < 8; sel = sel + 1) begin
        #10;
    end

    $finish;
end

endmodule
