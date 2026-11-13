`timescale 1ns/1ps

// تست‌بنچ توابع و تسک‌ها
// یک تسک می‌سازیم که کار تست را خودکار می‌کند

module tb_functions_tasks();

reg [7:0] data;

// --- تسک: تست خودکار popcount ---
task check_popcount;
    input [7:0] d;
    input [3:0] expected;
    begin
        data = d;
        #10;
        if (count !== expected)
            $display("FAIL popcount: data=%b count=%0d (انتظار %0d)", d, count, expected);
        else
            $display("PASS popcount: data=%b count=%0d", d, count);
    end
endtask

// --- تسک: تست خودکار parity ---
task check_parity;
    input [7:0] d;
    input expected;
    begin
        data = d;
        #10;
        if (parity !== expected)
            $display("FAIL parity: data=%b parity=%b (انتظار %b)", d, parity, expected);
        else
            $display("PASS parity: data=%b parity=%b", d, parity);
    end
endtask

// نمونه‌سازی ماژول‌ها
wire parity, count_dummy;

parity_checker P1(.data(data), .parity(parity));

wire [3:0] count;
popcount_8bit  P2(.data(data), .count(count));

initial begin
    // تست‌های parity
    check_parity(8'h00, 1'b0);   // صفر بیت 1
    check_parity(8'hFF, 1'b0);   // هشت بیت 1 (زوج)
    check_parity(8'h0F, 1'b0);   // چهار بیت 1
    check_parity(8'h01, 1'b1);   // یک بیت 1 (فرد)
    check_parity(8'hA5, 1'b0);   // 10100101: چهار بیت 1

    // تست‌های popcount
    check_popcount(8'h00, 4'd0);
    check_popcount(8'hFF, 4'd8);
    check_popcount(8'h0F, 4'd4);
    check_popcount(8'hA5, 4'd4);  // 10100101
    check_popcount(8'h81, 4'd2);

    $finish;
end

endmodule
