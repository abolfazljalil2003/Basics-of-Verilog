# گیت‌های منطقی پایه

## گیت‌های موجود در Verilog

Verilog گیت‌های آماده‌ای دارد که می‌توان مستقیم استفاده کرد.

### لیست گیت‌ها
```verilog
and     // AND gate
or      // OR gate
not     // NOT gate (Inverter)
nand    // NAND gate
nor     // NOR gate
xor     // XOR gate
xnor    // XNOR gate
buf     // Buffer
```

## نحوه استفاده

### ساختار کلی
```verilog
نوع_گیت نام_نمونه (خروجی, ورودی1, ورودی2, ...);
```

### مثال‌ها
```verilog
and g1(out, in1, in2);
or g2(out, in1, in2, in3);
not g3(out, in);
```

## گیت‌های تک‌ورودی

### NOT
```verilog
not gate1(out, in);
```

جدول راستی:
```
in | out
0  | 1
1  | 0
```

### BUF
```verilog
buf gate2(out, in);
```

فقط سیگنال را منتقل می‌کند.

## گیت‌های دو‌ورودی

### AND
```verilog
and gate3(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 0
0 1 | 0
1 0 | 0
1 1 | 1
```

### OR
```verilog
or gate4(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 1
```

### NAND
```verilog
nand gate5(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 1
0 1 | 1
1 0 | 1
1 1 | 0
```

### NOR
```verilog
nor gate6(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 1
0 1 | 0
1 0 | 0
1 1 | 0
```

### XOR
```verilog
xor gate7(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 0
```

### XNOR
```verilog
xnor gate8(out, a, b);
```

جدول راستی:
```
a b | out
0 0 | 1
0 1 | 0
1 0 | 0
1 1 | 1
```

## گیت‌های چند‌ورودی

می‌توان بیش از دو ورودی داشت:
```verilog
and gate9(out, a, b, c, d);
or gate10(out, a, b, c);
```

## مثال کامل
```verilog
module basic_gates(
    input a,
    input b,
    output y_and,
    output y_or,
    output y_not,
    output y_nand,
    output y_nor,
    output y_xor,
    output y_xnor
);

and g1(y_and, a, b);
or g2(y_or, a, b);
not g3(y_not, a);
nand g4(y_nand, a, b);
nor g5(y_nor, a, b);
xor g6(y_xor, a, b);
xnor g7(y_xnor, a, b);

endmodule
```

## نکات مهم

### نام‌گذاری نمونه‌ها
هر گیت باید نام منحصربفرد داشته باشد

### ترتیب پارامترها
اول خروجی، بعد ورودی‌ها

### تعداد ورودی
برخی گیت‌ها می‌توانند ورودی‌های زیاد داشته باشند

## جمع‌بندی

گیت‌های پایه ساده‌ترین روش طراحی هستند و پایه تمام مدارها می‌باشند.