# مدارهای ترکیبی

## تعریف

مداری که خروجی آن فقط به ورودی‌های فعلی بستگی دارد، نه به تاریخچه.

## ویژگی‌های مدار ترکیبی

- بدون حافظه
- بدون فیدبک
- خروجی فقط تابعی از ورودی

## انواع مدارهای ترکیبی

### مدارهای حسابی
- Adder (جمع‌کننده)
- Subtractor (تفریق‌کننده)
- Multiplier (ضرب‌کننده)
- Comparator (مقایسه‌کننده)

### مدارهای کدگذاری
- Encoder (رمزنگار)
- Decoder (رمزگشا)
- Multiplexer (چندراهه)
- Demultiplexer

### مدارهای منطقی
- ALU (واحد محاسباتی منطقی)

## Half Adder

جمع دو بیت:
```verilog
module half_adder(
    input a,
    input b,
    output sum,
    output carry
);

xor XOR1(sum, a, b);
and AND1(carry, a, b);

endmodule
```

### جدول راستی
```
a b | sum carry
0 0 | 0   0
0 1 | 1   0
1 0 | 1   0
1 1 | 0   1
```

## Full Adder

جمع سه بیت (شامل carry ورودی):
```verilog
module full_adder(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);

wire sum1, carry1, carry2;

xor XOR1(sum1, a, b);
xor XOR2(sum, sum1, carry_in);

and AND1(carry1, a, b);
and AND2(carry2, sum1, carry_in);
or OR1(carry_out, carry1, carry2);

endmodule
```

### جدول راستی
```
a b cin | sum cout
0 0 0   | 0   0
0 0 1   | 1   0
0 1 0   | 1   0
0 1 1   | 0   1
1 0 0   | 1   0
1 0 1   | 0   1
1 1 0   | 0   1
1 1 1   | 1   1
```

## ساخت با Half Adder
```verilog
module full_adder_ha(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);

wire sum1, carry1, carry2;

half_adder HA1(
    .a(a),
    .b(b),
    .sum(sum1),
    .carry(carry1)
);

half_adder HA2(
    .a(sum1),
    .b(carry_in),
    .sum(sum),
    .carry(carry2)
);

or OR1(carry_out, carry1, carry2);

endmodule
```

## Comparator یک‌بیتی
```verilog
module comparator_1bit(
    input a,
    input b,
    output smaller,
    output equal,
    output greater
);

wire not_a, not_b;

not NOT1(not_a, a);
not NOT2(not_b, b);

and AND1(smaller, b, not_a);
xnor XNOR1(equal, a, b);
and AND2(greater, a, not_b);

endmodule
```

### جدول راستی
```
a b | smaller equal greater
0 0 | 0       1     0
0 1 | 1       0     0
1 0 | 0       0     1
1 1 | 0       1     0
```

## نکات طراحی

### سادگی
مدارهای ساده خوانایی بیشتر دارند

### استفاده مجدد
ماژول‌های کوچک را در ماژول‌های بزرگ‌تر استفاده کنید

### تست کامل
تمام حالات ممکن را تست کنید

## جمع‌بندی

مدارهای ترکیبی پایه طراحی دیجیتال هستند و با ترکیب آنها می‌توان مدارهای پیچیده ساخت.