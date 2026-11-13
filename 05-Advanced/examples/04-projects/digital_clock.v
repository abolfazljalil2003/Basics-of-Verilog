// ساعت دیجیتال با خروجی BCD
// ساختار: سه جفت شمارنده BCD برای ثانیه و دقیقه (یکان mod-10، دهگان mod-6)
// و یک جفت برای ساعت (mod-24)
// خروجی‌ها مستقیماً به دیکدر سون‌سگمنت وصل می‌شوند
// clk فرض 1 هرتز است (در FPGA از تقسیم‌کننده فرکانس تغذیه می‌شود)

module digital_clock(
    input clk,          // 1 هرتز
    input reset,        // ریست ناهمزمان به 00:00:00
    output reg [3:0] sec_u,    // ثانیه یکان   (0-9)
    output reg [3:0] sec_t,    // ثانیه دهگان (0-5)
    output reg [3:0] min_u,    // دقیقه یکان   (0-9)
    output reg [3:0] min_t,    // دقیقه دهگان (0-5)
    output reg [3:0] hour_u,   // ساعت یکان   (0-9)
    output reg [3:0] hour_t    // ساعت دهگان (0-2)
);

// --- سیگنال‌های انتی (فعال‌سازی شمارنده بعدی) ---
wire sec_en   = 1'b1;                                        // هر تیک
wire min_en   = (sec_u == 4'd9) && (sec_t == 4'd5);          // 59 ثانیه گذشت
wire hour_en  = min_en && (min_u == 4'd9) && (min_t == 4'd5);// 59 دقیقه گذشت
wire day_over = hour_en && (hour_t == 4'd2) && (hour_u == 4'd3); // 23:59:59

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sec_u  <= 4'd0;  sec_t  <= 4'd0;
        min_u  <= 4'd0;  min_t  <= 4'd0;
        hour_u <= 4'd0;  hour_t <= 4'd0;
    end else begin
        // ---- ثانیه‌ها ----
        if (min_en) begin
            sec_u <= 4'd0;
            sec_t <= 4'd0;
        end else if (sec_u == 4'd9) begin
            sec_u <= 4'd0;
            sec_t <= sec_t + 4'd1;   // sec_t==5 در min_en پوشش داده شده
        end else begin
            sec_u <= sec_u + 4'd1;
        end

        // ---- دقیقه‌ها ----
        if (hour_en) begin
            min_u <= 4'd0;
            min_t <= 4'd0;
        end else if (min_en) begin
            if (min_u == 4'd9) begin
                min_u <= 4'd0;
                min_t <= min_t + 4'd1;   // mod-6 در hour_en
            end else begin
                min_u <= min_u + 4'd1;
            end
        end

        // ---- ساعت‌ها (mod-24) ----
        if (day_over) begin
            hour_u <= 4'd0;
            hour_t <= 4'd0;
        end else if (hour_en) begin
            if (hour_t == 4'd2 && hour_u == 4'd3) begin   // 23 → 00
                hour_u <= 4'd0;
                hour_t <= 4'd0;
            end else if (hour_u == 4'd9) begin
                hour_u <= 4'd0;
                hour_t <= hour_t + 4'd1;
            end else begin
                hour_u <= hour_u + 4'd1;
            end
        end
    end
end

endmodule
