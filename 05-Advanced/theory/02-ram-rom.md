# حافظه‌های RAM و ROM

## مقدمه

حافظه در Verilog با **آرایه دو بعدی از reg** مدل می‌شود:

```verilog
reg [7:0] mem [0:15];   // 16 خانه 8 بیتی
```

- بعد اول: **عرض** داده (تعداد بیت هر خانه)
- بعد دوم: تعداد خانه‌ها
- خواندن/نوشتن با اندیس: `mem[3]` یا `mem[addr]`

## RAM همزمان (Synchronous)

خواندن و نوشتن هر دو در لبه ساعت انجام می‌شود:

```verilog
module ram_16x8(
    input clk,
    input we,              // write enable
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

reg [7:0] mem [0:15];

// نوشتن
always @(posedge clk) begin
    if (we)
        mem[addr] <= din;
end

// خواندن
always @(posedge clk) begin
    dout <= mem[addr];
end

endmodule
```

## ROM (حافظه فقط‌خواندنی)

### روش اول: مقداردهی در initial

```verilog
module rom_16x8(
    input [3:0] addr,
    output reg [7:0] dout
);

reg [7:0] mem [0:15];

initial begin
    mem[0]  = 8'h00;
    mem[1]  = 8'hA5;
    mem[2]  = 8'h3C;
    // ... بقیه خانه‌ها
end

always @(*)
    dout = mem[addr];

endmodule
```

### روش دوم: فایل حافظه با $readmemh

```verilog
initial begin
    $readmemh("rom_data.mem", mem);
end
```

فایل `rom_data.mem` (مقادیر hex، یکی در هر خط):

```
00
A5
3C
FF
12
```

> این روش در سنتز روی FPGA پشتیبانی می‌شود (بلاک‌های Block RAM/ROM پر می‌شوند).

## نکات سنتز

1. آرایه‌های بزرگ روی FPGA به Block RAM سنتز می‌شوند؛ آرایه‌های کوچک به LUT RAM
2. برای سنتز موفق به عنوان RAM، الگوی استاندارد (آدرس پایدار در لبه ساعت) را رعایت کنید
3. مقداردهی `initial` روی FPGA‌های مدرن (مثل Xilinx 7 سری) معتبر است و در بیت‌استریم ذخیره می‌شود
4. خروجی RAM را `reg` تعریف کنید چون داخل always مقدار می‌گیرد

## مقایسه

| ویژگی | RAM | ROM |
|---|---|---|
| نوشتن | دارد | ندارد |
| آدرس‌دهی | معمولاً همزمان | ترکیبی یا همزمان |
| کاربرد | بافر، کش، رجیستر فایل | جدول ثابت، کد برنامه |
