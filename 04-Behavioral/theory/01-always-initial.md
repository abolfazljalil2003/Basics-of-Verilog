# بلوک‌های Always و Initial

## مقدمه

سطح رفتاری بالاترین سطح انتزاع در Verilog است. به جای توصیف ساختار مدار یا رابطه ورودی/خروجی، **رفتار** مدار را توصیف می‌کنیم: «هر وقت ساعت صعودی شد، مقدار d را در q بگذار».

## بلوک initial

فقط **در شبیه‌سازی** اجرا می‌شود و در سنتز (تبدیل به سخت‌افزار) نادیده گرفته می‌شود.

```verilog
initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
end
```

کاربرد اصلی: مقداردهی اولیه در تست‌بنچ و تولید ساعت.

## بلوک always

قلب سطح رفتاری است. دو شکل اصلی دارد:

### 1. always با لیست حساسیت (مدارهای ترتیبی)

```verilog
always @(posedge clk) begin
    // فقط در لبه بالارونده ساعت اجرا می‌شود
end
```

### 2. always با ستاره (مدارهای ترکیبی)

```verilog
always @(*) begin
    // هر وقت هر ورودی تغییر کند اجرا می‌شود
end
```

`@(*)` به کامپایلر می‌گوید خودش لیست حساسیت را پیدا کند — همیشه از این شکل استفاده کنید.

## مثال: نیم‌جمع‌کننده با always

```verilog
module half_adder_beh(
    input a,
    input b,
    output reg sum,   // خروجی always باید reg باشد!
    output carry
);

always @(*) begin
    sum = a ^ b;
end

assign carry = a & b;

endmodule
```

> نکته مهم: متغیرهایی که داخل `always` مقدار می‌گیرند باید `reg` باشند، حتی اگر مدار ترکیبی باشد.

## مثال: D Flip-Flop

```verilog
module dff(
    input clk,
    input d,
    output reg q
);

always @(posedge clk) begin
    q <= d;
end

endmodule
```

## قواعد نوشتن always

1. خروجی بلوک `always` باید از نوع `reg` باشد
2. هر سیگنال `reg` فقط باید در **یک** بلوک `always` مقدار بگیرد
3. برای مدار ترکیبی از `always @(*)` استفاده کنید و مطمئن شوید **همه مسیرها** به خروجی مقدار می‌دهند، وگرنه Latch ناخواسته ساخته می‌شود
4. برای مدار ترتیبی از `always @(posedge clk)` یا `always @(posedge clk or posedge reset)` استفاده کنید

## always در برابر assign

| ویژگی | assign | always |
|---|---|---|
| نوع خروجی | wire | reg |
| مناسب برای | ترکیبی ساده | هر مداری |
| ساختار شرطی | عملگر `?:` | if/else، case |
| مدار ترتیبی | نمی‌سازد | می‌سازد |

## ساختارهای کنترلی داخل always

```verilog
// if / else
always @(*) begin
    if (sel) y = a;
    else     y = b;
end

// case
always @(*) begin
    case (op)
        2'b00: y = a + b;
        2'b01: y = a - b;
        default: y = 0;   // حتماً default بنویسید
    endcase
end
```

> قانون طلایی: در `case` ترکیبی همیشه `default` بنویسید تا Latch ناخواسته ساخته نشود.
