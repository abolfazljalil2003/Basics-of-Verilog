// تشخیص‌دهنده توالی 1011 - ماشین Moore با روش سه‌بلوکی
// هر وقت بیت‌های پشت‌سرهم 1011 در ورودی سریال دیده شود،
// خروجی found برای یک دوره ساعت فعال می‌شود
// توالی‌های همپوشان هم پیدا می‌شوند (مثلاً در 101011، توالی 1011 دوبار)

module sequence_detector_1011(
    input clk,
    input reset,     // reset ناهمزمان
    input din,       // ورودی سریال بیت
    output found     // 1 یعنی توالی 1011 پیدا شد
);

// --- کدگذاری حالت ---
localparam S0 = 3'd0,   // هیچ تطبیق
           S1 = 3'd1,   // "1" دیده شده
           S2 = 3'd2,   // "10" دیده شده
           S3 = 3'd3,   // "101" دیده شده
           S4 = 3'd4;   // "1011" دیده شده (found)

reg [2:0] state, next_state;

// --- بلوک 1: رجیستر حالت ---
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end

// --- بلوک 2: منطق حالت بعدی (ترکیبی) ---
always @(*) begin
    case (state)
        S0: next_state = din ? S1 : S0;
        S1: next_state = din ? S1 : S2;
        S2: next_state = din ? S3 : S0;
        S3: next_state = din ? S4 : S2;
        S4: next_state = din ? S1 : S2;
        default: next_state = S0;
    endcase
end

// --- بلوک 3: خروجی (Moore: فقط تابع حالت) ---
assign found = (state == S4);

endmodule
