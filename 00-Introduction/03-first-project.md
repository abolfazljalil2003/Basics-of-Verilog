# اولین پروژه Verilog

## ایجاد پروژه جدید

### مرحله ۱: باز کردن ISE

نرم‌افزار ISE Design Suite را اجرا کنید.

### مرحله ۲: پروژه جدید

۱. از منوی File گزینه New Project را انتخاب کنید
۲. نام پروژه: `first_project`
۳. مسیر پروژه را انتخاب کنید
۴. Next را بزنید

### مرحله ۳: تنظیمات پروژه

۱. Product Category: All
۲. Family: Spartan3E (یا هر FPGA دیگر)
۳. Device: XC3S500E
۴. Next و Finish

## ایجاد فایل Verilog

### مرحله ۱: فایل جدید

۱. کلیک راست روی پروژه
۲. New Source
۳. Verilog Module
۴. نام فایل: `and_gate`

### مرحله ۲: تعریف پورت‌ها
```
Port Name: a    Direction: input
Port Name: b    Direction: input  
Port Name: y    Direction: output
```

Next و Finish

## نوشتن کد

فایل `and_gate.v` را باز کنید و کد را کامل کنید:
```verilog
module and_gate(
    input a,
    input b,
    output y
    );

assign y = a & b;

endmodule
```

## بررسی Syntax

۱. فایل را ذخیره کنید (Ctrl+S)
۲. در Processes Panel گزینه Synthesize - XST را باز کنید
۳. روی Check Syntax دابل کلیک کنید

اگر سبز شد، کد صحیح است!

## مرحله بعد: شبیه‌سازی

برای تست عملکرد مدار باید یک تست‌بنچ بنویسیم که در فایل بعدی توضیح داده خواهد شد.

## نکات مهم

### ذخیره مرتب فایل‌ها
همیشه قبل از اجرا فایل‌ها را ذخیره کنید

### نام‌گذاری
از نام‌های معنادار و بدون فاصله استفاده کنید

<div dir="ltr">

### کامنت‌گذاری

برای درک بهتر کد، کامنت بگذارید
```verilog

// and gate

assign y = a & b;

```
</div>

## خلاصه

شما اولین پروژه Verilog خود را ایجاد کردید. در مرحله بعد یاد خواهیم گرفت چگونه آن را تست کنیم.
