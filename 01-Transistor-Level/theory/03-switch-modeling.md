# مدل‌سازی Switch-Level در Verilog

## انواع سوئیچ‌ها در Verilog

### ترانزیستورهای MOS
```verilog
nmos    // N-channel transistor
pmos    // P-channel transistor
cmos    // Complementary MOS
```

### سوئیچ‌های دوطرفه
```verilog
tran    // بدون کنترل
tranif0 // فعال وقتی control=0
tranif1 // فعال وقتی control=1
```

### بافرهای سه‌حالته
```verilog
bufif0  // فعال وقتی control=0
bufif1  // فعال وقتی control=1
```

## Transmission Gate

یک ترکیب از NMOS و PMOS:
```verilog
module transmission_gate(
    input in,
    input control,
    output out
);

wire control_n;

not n1(control_n, control);

nmos nm1(out, in, control);
pmos pm1(out, in, control_n);

endmodule
```

### مزایا
- مقاومت کمتر
- عبور کامل سیگنال
- استفاده در multiplexer

## مثال: Multiplexer 2-to-1
```verilog
module mux_2to1(
    input a,
    input b,
    input sel,
    output out
);

wire sel_n, t1, t2;

not n1(sel_n, sel);

nmos nm1(t1, a, sel_n);
pmos pm1(t1, a, sel_n);

nmos nm2(t2, b, sel);
pmos pm2(t2, b, sel);

assign out = t1 | t2;

endmodule
```

## مقادیر منطقی در Switch-Level

| مقدار | معنی |
|-------|------|
| 0 | صفر منطقی |
| 1 | یک منطقی |
| Z | High Impedance |
| X | نامشخص |

## حالت High Impedance

وقتی هیچ ترانزیستوری روشن نیست، خروجی Z می‌شود:
```verilog
bufif1 buf1(out, in, enable);
// اگر enable=0 → out=Z
```

## کاربردهای عملی

### باس‌های سه‌حالته
چند خروجی به یک خط متصل می‌شوند

### Multiplexer
انتخاب یکی از چند ورودی

### حافظه
خواندن و نوشتن داده

## مثال کامل: دیماکس 1-bit
```verilog
module demux_1bit(
    input x,
    input sel,
    output y0,
    output y1
);

wire sel_not;

not not1(sel_not, sel);
and and1(y0, x, sel_not);
and and2(y1, x, sel);

endmodule
```

## نکات مهم

### استفاده در طراحی واقعی
در پروژه‌های واقعی کمتر از این سطح استفاده می‌شود

### دلایل عدم استفاده
- پیچیدگی بالا
- کد طولانی
- سخت‌تر برای debug

### چه موقع استفاده کنیم
- طراحی مدارهای آنالوگ
- بهینه‌سازی شدید
- آموزش و یادگیری

<div dir="rtl">

## جمع‌بندی

Switch-Level Modeling ابزار قدرتمندی است اما در عمل از سطوح بالاتر استفاده می‌شود.

</div>