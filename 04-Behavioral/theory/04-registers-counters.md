# رجیسترها و شمارنده‌ها

## رجیستر (Register)

### تعریف

رجیستر مجموعه‌ای از Flip-Flop هاست که همزمان مقدار می‌گیرند. یک رجیستر N بیتی = N عدد Flip-Flop.

### رجیستر 8 بیتی با Enable

```verilog
module register_8bit(
    input clk,
    input en,          // فقط وقتی 1 است مقدار جدید گرفته می‌شود
    input [7:0] din,
    output reg [7:0] q
);

always @(posedge clk) begin
    if (en)
        q <= din;
end

endmodule
```

## شمارنده‌ها (Counters)

### شمارنده Mod-N

شمارنده‌ای که از 0 تا N-1 می‌شمارد و دوباره به 0 برمی‌گردد. مثال: شمارنده Mod-10 (دهدهی):

```verilog
module counter_mod10(
    input clk,
    input reset,
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else if (count == 4'd9)
        count <= 4'd0;
    else
        count <= count + 4'd1;
end

endmodule
```

### شمارنده بالا/پایین شمار

```verilog
module up_down_counter_4bit(
    input clk,
    input reset,
    input up_down,     // 1: بالا، 0: پایین
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else if (up_down)
        count <= count + 4'd1;   // آپ با wrap طبیعی
    else
        count <= count - 4'd1;   // داون: 0 به 15 برمی‌گردد
end

endmodule
```

### Ring Counter

N عدد Flip-Flop که فقط یکی از آن‌ها 1 است و آن «تک‌بیت» در هر ساعت جابه‌جا می‌شود:

```verilog
module ring_counter_4bit(
    input clk,
    input reset,
    output reg [3:0] q
);

always @(posedge clk) begin
    if (reset)
        q <= 4'b0001;
    else
        q <= {q[2:0], q[3]};   // چرخش به چپ
end

endmodule
```

### Johnson Counter

مثل Ring Counter اما با خروجی معکوسِ بیت آخر:

```verilog
q <= {~q[0], q[3:1]};   // 0000 → 1000 → 1100 → ... → 1111 → 0111 → ...
```

با N بیت، 2N حالت می‌سازد (Ring فقط N حالت).

## رجیستر شیفت (Shift Register)

رجیستری که داده‌ها را بیت‌به‌بیت جابه‌جا می‌کند.

### SIPO: Serial In, Parallel Out

```verilog
module shift_register_sipo(
    input clk,
    input din,           // ورودی سریال
    output reg [7:0] q   // خروجی موازی
);

always @(posedge clk) begin
    q <= {q[6:0], din};   // شیفت به چپ، din وارد بیت 0 می‌شود
end

endmodule
```

### PISO: Parallel In, Serial Out

```verilog
module shift_register_piso(
    input clk,
    input load,          // 1: بارگذاری موازی
    input [7:0] din,
    output serial_out
);

reg [7:0] q;

always @(posedge clk) begin
    if (load)
        q <= din;
    else
        q <= {q[6:0], 1'b0};
end

assign serial_out = q[7];

endmodule
```

## کاربردها

| مدار | کاربرد |
|---|---|
| رجیستر | ذخیره موقت داده در CPU |
| Mod-N Counter | تقسیم فرکانس، ساعت دیجیتال |
| Ring/Johnson | چرخش وضعیت، دیکدر |
| شیفت رجیستر | ارتباط سریال (UART)، ضرب/تقسیم بر 2 |
