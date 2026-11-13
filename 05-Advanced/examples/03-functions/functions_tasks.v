// توابع و تسک‌ها - مثال‌های عملی

// ---- Function 1: توازن (XOR همه بیت‌ها) ----
module parity_checker(
    input [7:0] data,
    output parity
);

// تابع parity_of: ترکیبی و قابل سنتز
function parity_of;
    input [7:0] d;
    begin
        parity_of = ^d;
    end
endfunction

assign parity = parity_of(data);

endmodule

// ---- Function 2: شمارش بیت‌های 1 (popcount) ----
module popcount_8bit(
    input [7:0] data,
    output [3:0] count
);

function [3:0] count_ones;
    input [7:0] d;
    integer i;
    begin
        count_ones = 4'd0;
        for (i = 0; i < 8; i = i + 1)
            if (d[i])
                count_ones = count_ones + 4'd1;
    end
endfunction

assign count = count_ones(data);

endmodule

// ---- Task: فقط برای تست‌بنچ ----
// این تسک در تست‌بنچ‌ها استفاده می‌شود (فایل‌های tb_*)
// نمونه در testbenches/tb_functions_tasks.v
