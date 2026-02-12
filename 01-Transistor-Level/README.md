# سطح ترانزیستور (Transistor Level)

در این بخش با پایین‌ترین سطح طراحی در Verilog آشنا می‌شوید.

## محتوای این بخش

### تئوری
- مبانی ترانزیستور
- NMOS و PMOS
- مدل‌سازی Switch-Level

### مثال‌ها
- Inverter
- NAND و NOR
- AND و OR
- XOR

### تست‌بنچ‌ها
تست کامل برای تمام مدارها

## ترتیب مطالعه

۱. ابتدا فایل‌های theory را مطالعه کنید
۲. کدهای examples را بررسی کنید
۳. تست‌بنچ‌ها را اجرا کنید
۴. نتایج را با اسکرین‌شات‌ها مقایسه کنید

## نکته مهم

این سطح برای درک عمیق‌تر سخت‌افزار مفید است اما در عمل کمتر استفاده می‌شود. می‌توانید مستقیم به بخش ۰۲ بروید.

## فایل‌های این بخش
```
01-Transistor-Level/
├── theory/
│   ├── 01-transistor-basics.md
│   ├── 02-nmos-pmos.md
│   └── 03-switch-modeling.md
├── examples/
│   ├── inverter.v
│   ├── nand2.v
│   ├── nor2.v
│   ├── and2.v
│   ├── or2.v
│   └── xor2.v
└── testbenches/
    ├── tb_inverter.v
    ├── tb_nand2.v
    └── tb_xor2.v
```