`timescale 1ns/1ps

// تست‌بنچ MUX 4 به 1
// هر سه پیاده‌سازی را با هم تست می‌کند تا خروجی‌ها یکسان باشند

module tb_mux_4to1_dataflow();

reg [3:0] d;
reg [1:0] sel;
wire y1, y2, y3;

mux_4to1_nested  M1(.d(d), .sel(sel), .y(y1));
mux_4to1_chain   M2(.d(d), .sel(sel), .y(y2));
mux_4to1_dataflow M3(.d(d), .sel(sel), .y(y3));

initial begin
    $monitor("Time=%0t d=%b sel=%b nested=%b chain=%b dataflow=%b",
             $time, d, sel, y1, y2, y3);

    d = 4'b1010;   // الگوی تست: بیت‌های زوج 0 و فرد 1
    for (sel = 0; sel < 4; sel = sel + 1) begin
        #10;
    end

    d = 4'b0101;
    for (sel = 0; sel < 4; sel = sel + 1) begin
        #10;
    end

    // بررسی خودکار: اگر خروجی‌ها فرق کنند خطا چاپ می‌شود
    if (y1 !== y2 || y2 !== y3)
        $display("ERROR: خروجي روش‌ها متفاوت است!");
    else
        $display("OK: هر سه روش خروجي يکسان دارند");

    $finish;
end

endmodule
