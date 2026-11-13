// D Latch - حساس به سطح enable
// تا وقتی en=1 است خروجی دنبال ورودی می‌رود (شفاف)
// وقتی en=0 شود خروجی آخرین مقدار را نگه می‌دارد (حافظه)

module d_latch(
    input en,
    input d,
    output reg q
);

always @(*) begin
    if (en)
        q = d;
end

endmodule
