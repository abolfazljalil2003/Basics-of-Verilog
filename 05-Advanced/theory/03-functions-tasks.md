# توابع و تسک‌ها

## Function

### تعریف

`function` یک **زیربرنامه ترکیبی** است: یک مقدار برمی‌گرداند و در یک گام شبیه‌سازی (زمان صفر) اجرا می‌شود. مثل تابع در ریاضیات.

### قواعد

- حداقل یک آرگومان ورودی دارد
- فقط یک خروجی برمی‌گرداند (نام تابع)
- داخل آن تاخیر (`#`) و کنترل زمان نداریم
- **ترکیبی** است: در تست‌بنچ و سنتز (در بلوک always ترکیبی) قابل استفاده

### مثال: توابع پرکاربرد

```verilog
// تعداد بیت‌های 1 در یک بردار (popcount)
function integer count_ones;
    input [7:0] data;
    integer i;
    begin
        count_ones = 0;
        for (i = 0; i < 8; i = i + 1)
            if (data[i])
                count_ones = count_ones + 1;
    end
endfunction
```

### مثال: XOR همه بیت‌ها

```verilog
function parity;
    input [7:0] data;
    begin
        parity = ^data;   // عملگر کاهشی
    end
endfunction
```

### استفاده

```verilog
wire [7:0] byte_in;
wire       p = parity(byte_in);
```

## Task

### تعریف

`task` انعطاف بیشتری دارد: می‌تواند **چند خروجی** داشته باشد، تاخیر و رویداد زمانی داشته باشد و عمدتاً برای **تست‌بنچ** استفاده می‌شود.

### مثال: تولید ساعت در تست‌بنچ

```verilog
task gen_clock;
    input integer cycles;
    integer i;
    begin
        for (i = 0; i < cycles; i = i + 1) begin
            #5 clk = 1;
            #5 clk = 0;
        end
    end
endtask
```

### مثال: اعمال وکتور تست و بررسی خروجی

```verilog
task check_adder;
    input [7:0] a, b;
    begin
        tb_a = a; tb_b = b;
        #10;
        if (sum !== ((a + b) & 8'hFF))
            $display("FAIL: a=%h b=%h sum=%h", a, b, sum);
        else
            $display("PASS: %h + %h = %h", a, b, sum);
    end
endtask
```

## مقایسه

| ویژگی | function | task |
|---|---|---|
| خروجی | یک مقدار | صفر یا چند |
| ورودی | دارد | اختیاری |
| تاخیر/زمان | ندارد | دارد |
| فراخوانی در عبارت | بله | به صورت دستور |
| کاربرد اصلی | منطق ترکیبی | تست‌بنچ |

## قاعده کلی

- محاسبه ترکیبی که بارها تکرار می‌شود → `function`
- کارهای تکراری تست‌بنچ → `task`
- در کد سنتزپذیر از task استفاده نکنید
