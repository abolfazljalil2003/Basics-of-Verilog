`timescale 1ns/1ps

// تست‌بنچ خودکار ساعت دیجیتال
// 24 ساعت کامل (86400 ثانیه) شبیه‌سازی می‌شود
// در هر ثانیه، خروجی BCD مدار با زمان محاسبه‌شده مقایسه می‌شود
// این تست‌بنچ نمونه خوب استفاده از function و task است

module tb_digital_clock();

reg clk, reset;
wire [3:0] sec_u, sec_t, min_u, min_t, hour_u, hour_t;

digital_clock DUT(
    .clk(clk), .reset(reset),
    .sec_u(sec_u), .sec_t(sec_t),
    .min_u(min_u), .min_t(min_t),
    .hour_u(hour_u), .hour_t(hour_t)
);

always #5 clk = ~clk;

integer elapsed;    // ثانیه‌های گذشته از 00:00:00
integer errors;

// تبدیل عدد 0-59 به رقم BCD یکان
function [3:0] bcd_ones;
    input integer value;
    begin
        bcd_ones = value % 10;
    end
endfunction

// تبدیل عدد 0-59 به رقم BCD دهگان
function [3:0] bcd_tens;
    input integer value;
    begin
        bcd_tens = value / 10;
    end
endfunction

// تسک مقایسه: خروجی مدار باید elapsed ثانیه بعد از نیمه‌شب باشد
task check_time;
    begin
        if (sec_u  !== bcd_ones(elapsed % 60) ||
            sec_t  !== bcd_tens(elapsed % 60) ||
            min_u  !== bcd_ones((elapsed / 60) % 60) ||
            min_t  !== bcd_tens((elapsed / 60) % 60) ||
            hour_u !== bcd_ones((elapsed / 3600) % 24) ||
            hour_t !== bcd_tens((elapsed / 3600) % 24)) begin
            errors = errors + 1;
            if (errors <= 10)
                $display("FAIL در ثانیه %0d: %0d%0d:%0d%0d:%0d%0d",
                         elapsed, hour_t, hour_u, min_t, min_u, sec_t, sec_u);
        end
    end
endtask

initial begin
    clk = 0; reset = 1; elapsed = 0; errors = 0;
    #12 reset = 0;

    // شبیه‌سازی کامل 24 ساعت
    // (بررسی بعد از #1 انجام می‌شود تا مقادیر non-blocking تثبیت شوند)
    while (elapsed < 86400) begin
        @(posedge clk);
        elapsed = elapsed + 1;
        #1 check_time;
    end

    if (errors == 0)
        $display("PASS: تمام 86400 ثانیه شبانه‌روز درست شمرده شد");
    else
        $display("FAIL: %0d خطا در 24 ساعت", errors);

    $finish;
end

endmodule
