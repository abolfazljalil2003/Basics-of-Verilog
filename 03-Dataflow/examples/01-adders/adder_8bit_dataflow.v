// جمع‌کننده 8 بیتی - سطح جریان داده
// مقایسه کنید با ripple_adder_4bit_structural در بخش 02!
// فقط یک خط کد در برابر نمونه‌سازی 8 عدد Full Adder

module adder_8bit_dataflow(
    input [7:0] a,
    input [7:0] b,
    input carry_in,
    output [7:0] sum,
    output carry_out
);

assign {carry_out, sum} = a + b + carry_in;

endmodule
