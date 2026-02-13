<div dir="rtl">

# NMOS و PMOS

</div>

![NMOS and PMOS](https://www.allaboutcircuits.com/uploads/articles/Nick_11_1_2023_Fig_1.jpg)

## ساختار دستورات

### NMOS
```verilog
nmos نام_ترانزیستور (drain, source, gate);
```

### PMOS
```verilog
pmos نام_ترانزیستور (drain, source, gate);
```

## تفاوت‌های کلیدی

| ویژگی | NMOS | PMOS |
|-------|------|------|
| رسانایی | Gate=1 | Gate=0 |
| سرعت | سریع‌تر | کندتر |
| کاربرد | Pull-Down | Pull-Up |

## منابع تغذیه در Verilog
```verilog
supply1 vdd;  // منبع +V
supply0 gnd;  // زمین
```

## مثال: Inverter

![Inverter](https://www.tutorialspoint.com/vlsi_design/images/cmos_inverter_circuit.jpg)

```verilog
module inverter(
    input in,
    output out
);

supply1 vdd;
supply0 gnd;

pmos mp1(out, vdd, in);
nmos mn1(out, gnd, in);

endmodule
```

### نحوه عملکرد

وقتی in=0:
- PMOS روشن می‌شود → out به vdd متصل می‌شود → out=1

وقتی in=1:
- NMOS روشن می‌شود → out به gnd متصل می‌شود → out=0

## مثال: NAND
```verilog
module nand2(
    input A,
    input B,
    output out
);

supply1 vdd;
supply0 gnd;

pmos mp1(out, vdd, A);
pmos mp2(out, vdd, B);

nmos mn1(out, n1, A);
nmos mn2(n1, gnd, B);

endmodule
```

### نحوه عملکرد

PMOSها موازی هستند:
- اگر A=0 یا B=0 → یکی از آنها روشن است → out=1

NMOSها سری هستند:
- فقط اگر A=1 و B=1 → هر دو روشن‌اند → out=0

## Pull-Up و Pull-Down

### Pull-Up Network
- از PMOS ساخته می‌شود
- خروجی را به VDD می‌برد

### Pull-Down Network
- از NMOS ساخته می‌شود
- خروجی را به GND می‌برد

## نکات طراحی

### تعداد ترانزیستورها
- یک Inverter: 2 ترانزیستور
- یک NAND2: 4 ترانزیستور
- یک NOR2: 4 ترانزیستور

### سرعت
- NMOS سریع‌تر است
- PMOS توان کمتری مصرف می‌کند

### مدار CMOS ایده‌آل
- تعداد PMOS = تعداد NMOS
- در هر حالت، یک مسیر روشن است

## جمع‌بندی

با ترکیب NMOS و PMOS می‌توان تمام گیت‌های منطقی را ساخت.