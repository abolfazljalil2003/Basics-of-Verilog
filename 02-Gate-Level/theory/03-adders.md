# جمع‌کننده‌ها (Adders)

## انواع Adder

### Half Adder
جمع دو بیت

### Full Adder
جمع سه بیت (با carry ورودی)

### Ripple Carry Adder
جمع دو عدد چند بیتی

### Carry Look-Ahead Adder
جمع سریع‌تر با پیش‌بینی carry

## Ripple Carry Adder

### تعریف

چند Full Adder که به صورت زنجیری به هم وصل شده‌اند.

### Ripple Adder 4-bit
```verilog
module ripple_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input carry_in,
    output [3:0] sum,
    output carry_out
);

wire [2:0] c;

full_adder FA0(
    .a(a[0]),
    .b(b[0]),
    .carry_in(carry_in),
    .sum(sum[0]),
    .carry_out(c[0])
);

full_adder FA1(
    .a(a[1]),
    .b(b[1]),
    .carry_in(c[0]),
    .sum(sum[1]),
    .carry_out(c[1])
);

full_adder FA2(
    .a(a[2]),
    .b(b[2]),
    .carry_in(c[1]),
    .sum(sum[2]),
    .carry_out(c[2])
);

full_adder FA3(
    .a(a[3]),
    .b(b[3]),
    .carry_in(c[2]),
    .sum(sum[3]),
    .carry_out(carry_out)
);

endmodule
```

### نحوه عملکرد

۱. بیت LSB با carry_in جمع می‌شود
۲. carry خروجی به مرحله بعد می‌رود
۳. این روند تا MSB ادامه می‌یابد

### مثال
```
  1010  (10)
+ 0110  (6)
------
 10000  (16)
```

### مزایا

- ساختار ساده
- راحت برای پیاده‌سازی

### معایب

- کند (باید منتظر carry قبلی باشیم)
- تاخیر متناسب با تعداد بیت‌ها

## تاخیر در Ripple Adder

### تاخیر کل
```
تاخیر کل = n × تاخیر یک Full Adder
```

برای 4-bit:
```
تاخیر = 4 × تاخیر_FA
```

### مسیر بحرانی

carry باید از LSB تا MSB حرکت کند.

## بهبود سرعت

### Carry Look-Ahead

به جای انتظار، carry را پیش‌بینی می‌کند:
```verilog
// Generate: هر دو ورودی 1
G = a & b

// Propagate: یکی از ورودی‌ها 1
P = a ^ b

// Carry
C[i+1] = G[i] | (P[i] & C[i])
```

### Carry Select Adder

دو حالت را موازی محاسبه می‌کند.

### Carry Save Adder

برای جمع چند عدد بهینه است.

## مثال استفاده
```verilog
module test_adder();

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

ripple_adder_4bit ADD(
    .a(a),
    .b(b),
    .carry_in(cin),
    .sum(sum),
    .carry_out(cout)
);

initial begin
    a = 4'd5; b = 4'd3; cin = 0;
    #10;
    a = 4'd15; b = 4'd1; cin = 0;
    #10;
    a = 4'd7; b = 4'd9; cin = 1;
end

endmodule
```

## توسعه به n-bit

می‌توان با حلقه یا تکرار، adder به هر سایزی ساخت:
```verilog
// برای 8-bit از دو 4-bit استفاده کنید
// برای 16-bit از دو 8-bit استفاده کنید
```

## جمع‌بندی

Ripple Adder ساده‌ترین نوع جمع‌کننده چندبیتی است که با زنجیر کردن Full Adder ساخته می‌شود.