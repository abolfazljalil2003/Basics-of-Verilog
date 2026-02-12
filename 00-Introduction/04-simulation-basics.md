# مبانی شبیه‌سازی در Verilog

## تست‌بنچ چیست؟

تست‌بنچ یک ماژول Verilog است که:

- ورودی‌های مدار را تولید می‌کند
- خروجی‌ها را مانیتور می‌کند
- عملکرد مدار را بررسی می‌کند

## ساختار یک تست‌بنچ
```verilog
module testbench();

    // تعریف سیگنال‌ها
    reg a;
    reg b;
    wire y;
    
    // ایجاد نمونه از مدار
    and_gate DUT(
        .a(a),
        .b(b),
        .y(y)
    );
    
    // تولید ورودی‌ها
    initial begin
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end
    
endmodule
```

## نکات مهم

### reg و wire

- `reg`: برای سیگنال‌هایی که مقدار به آنها انتساب می‌دهیم
- `wire`: برای خروجی‌های مدار

### بلوک initial

کدهای داخل این بلوک یکبار در ابتدا اجرا می‌شوند

### تاخیر زمانی
```verilog
#10  //10 واحد تاخسر
```

### $finish

شبیه‌سازی را متوقف می‌کند

## اجرای شبیه‌سازی

### مرحله ۱: ایجاد تست‌بنچ

۱. New Source
۲. Verilog Test Fixture
۳. نام: `tb_and_gate`
۴. مدار مورد نظر: `and_gate`

### مرحله ۲: کامل کردن کد

بلوک initial را با مقادیر تست کامل کنید

### مرحله ۳: اجرا

۱. در Design Panel به Simulation بروید
۲. Behavioral Simulation را انتخاب کنید
۳. روی Simulate Behavioral Model دابل کلیک کنید

### مرحله ۴: مشاهده نتایج

ISim Simulator باز می‌شود و موج‌ها را نمایش می‌دهد

## دستورات نمایش

### $monitor
```verilog
$monitor("a=%b, b=%b, y=%b", a, b, y);
```

هر تغییر را چاپ می‌کند

### $display
```verilog
$display("Time=%0t, a=%b", $time, a);
```

یکبار چاپ می‌کند

## timescale
```verilog
`timescale 1ns/1ps
```

واحد زمان شبیه‌سازی را تعیین می‌کند

## مثال کامل
```verilog
`timescale 1ns/1ps

module tb_and_gate();
    
    reg a, b;
    wire y;
    
    and_gate DUT(.a(a), .b(b), .y(y));
    
    initial begin
        $monitor("Time=%0t a=%b b=%b y=%b", 
                 $time, a, b, y);
        
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end
    
endmodule
```

## جمع‌بندی

با تست‌بنچ می‌توانید:

- عملکرد مدار را بررسی کنید
- خطاها را پیدا کنید
- نتایج را مستند کنید

اکنون آماده شروع طراحی مدارها هستید!