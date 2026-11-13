# Latch و Flip-Flop

## عنصر حافظه

مدارهای ترکیبی حافظه ندارند؛ خروجی فقط تابع ورودی فعلی است. برای ساخت مدارهای ترتیبی به **عنصر حافظه** نیاز داریم.

## Latch

### تعریف

Latch یک عنصر حافظه است که **در سطح سیگنال** (Level-Sensitive) کار می‌کند: تا زمانی که enable فعال است، خروجی دنبال ورودی می‌رود.

### D Latch

```verilog
module d_latch(
    input en,    // enable
    input d,
    output reg q
);

always @(*) begin
    if (en)
        q = d;   // شفاف: خروجی = ورودی
    // اگر en=0 باشد q مقدار قبلی را نگه می‌دارد (حافظه)
end

endmodule
```

### جدول حالت

| en | d | q | توضیح |
|---|---|---|---|
| 1 | 0 | 0 | شفاف |
| 1 | 1 | 1 | شفاف |
| 0 | x | q قبلی | حافظه |

> نکته: در کد بالا چون مسیر `else` وجود ندارد، کامپایلر برای نگه‌داشتن مقدار، Latch می‌سازد. این دقیقاً همان جایی است که Latch «ناخواسته» ساخته می‌شود — یک `always @(*)` ناقص!

## Flip-Flop

### تعریف

Flip-Flop عنصر حافظه‌ای است که **فقط در لبه ساعت** (Edge-Triggered) به‌روز می‌شود. بین لبه‌ها حتی اگر ورودی عوض شود، خروجی ثابت می‌ماند.

### D Flip-Flop

```verilog
module d_flipflop(
    input clk,
    input d,
    output reg q
);

always @(posedge clk) begin
    q <= d;
end

endmodule
```

### D Flip-Flop با Reset

```verilog
// Reset همزمان
always @(posedge clk) begin
    if (reset) q <= 1'b0;
    else       q <= d;
end
```

```verilog
// Reset ناهمزمان
always @(posedge clk or posedge reset) begin
    if (reset) q <= 1'b0;
    else       q <= d;
end
```

## JK Flip-Flop

```verilog
module jk_flipflop(
    input clk,
    input j,
    input k,
    output reg q
);

always @(posedge clk) begin
    case ({j, k})
        2'b00: q <= q;          // نگه‌داشتن
        2'b01: q <= 1'b0;      // ریست
        2'b10: q <= 1'b1;      // ست
        2'b11: q <= ~q;        // تاگل
    endcase
end

endmodule
```

## Latch در برابر Flip-Flop

| ویژگی | Latch | Flip-Flop |
|---|---|---|
| حساسیت | سطح سیگنال | لبه ساعت |
| سرعت | سریعتر (ساختار کوچکتر) | کندتر |
| خطر | Timing Glitch | پایدار |
| کاربرد مدرن | نادر (به‌طور ناخواسته!) | پایه تمام مدارهای ترتیبی |

## جمع‌بندی

- Latch در Verilog ساخته می‌شود وقتی `always @(*)` همه مسیرها را پوشش ندهد
- Flip-Flop با `always @(posedge clk)` ساخته می‌شود
- در طراحی سنتزپذیر، تقریباً همیشه Flip-Flop می‌خواهیم — Latch معمولاً باگ است
