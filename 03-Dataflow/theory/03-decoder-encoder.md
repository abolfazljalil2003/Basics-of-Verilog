# Decoder و Encoder

## Decoder

### تعریف

Decoder یک مدار ترکیبی است که **N بیت ورودی** را به **2^N خط خروجی** تبدیل می‌کند. در هر لحظه فقط **یک** خروجی فعال است.

### جدول حالت Decoder 2 به 4

| sel | y[3] | y[2] | y[1] | y[0] |
|---|---|---|---|---|
| 00 | 0 | 0 | 0 | 1 |
| 01 | 0 | 0 | 1 | 0 |
| 10 | 0 | 1 | 0 | 0 |
| 11 | 1 | 0 | 0 | 0 |

### پیاده‌سازی با انتساب پیوسته

```verilog
module decoder_2to4(
    input [1:0] sel,
    output [3:0] y
);

assign y[0] = (sel == 2'b00);
assign y[1] = (sel == 2'b01);
assign y[2] = (sel == 2'b10);
assign y[3] = (sel == 2'b11);

endmodule
```

### Decoder با Enable

```verilog
module decoder_2to4_en(
    input [1:0] sel,
    input en,
    output [3:0] y
);

assign y = en ? (1'b1 << sel) : 4'b0000;

endmodule
```

توجه کنید که `1'b1 << sel` به صورت توصیفی همان Decoder است و کد را خیلی کوتاه می‌کند.

## Encoder

### تعریف

Encoder عکس Decoder است: بین **2^N ورودی** که فقط یکی فعال است، **کد N بیتی** موقعیت آن را تولید می‌کند.

### Encoder 4 به 2 ساده

```verilog
module encoder_4to2(
    input [3:0] in,
    output [1:0] out
);

assign out[0] = in[1] | in[3];
assign out[1] = in[2] | in[3];

endmodule
```

### مشکل Encoder ساده

اگر **بیش از یک ورودی** همزمان فعال باشد، خروجی اشتباه می‌شود. راه‌حل: **Priority Encoder**.

## Priority Encoder

### تعریف

اگر چند ورودی همزمان فعال باشند، **بالاترین اولویت** (معمولاً بیت با شماره بزرگتر) در خروجی ظاهر می‌شود و خروجی `valid` نشان می‌دهد که حداقل یک ورودی فعال است.

### جدول حالت Priority Encoder 4 به 2

| in | out | valid |
|---|---|---|
| 0000 | xx | 0 |
| 0001 | 00 | 1 |
| 001x | 01 | 1 |
| 01xx | 10 | 1 |
| 1xxx | 11 | 1 |

### پیاده‌سازی

```verilog
module priority_encoder_4to2(
    input [3:0] in,
    output [1:0] out,
    output valid
);

// نکته: out را با عملگر شرطی تودرتو می‌سازیم
assign out   = in[3] ? 2'b11 :
               in[2] ? 2'b10 :
               in[1] ? 2'b01 : 2'b00;

assign valid = |in;   // عملگر کاهشی OR

endmodule
```

## کاربردها

### Decoder
- انتخاب حافظه (Memory Address Decoding)
- تبدیل کد به سیگنال (مثل حافظه Cache)
- سون‌سگمنت

### Encoder / Priority Encoder
- صفحه‌کلید (Keyboard Encoder)
- واحد وقفه (Interrupt Controller)
- اولویت‌بندی درخواست‌ها
