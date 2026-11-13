# Blocking و Non-blocking

## دو نوع انتساب

### انتساب Blocking با `=`
```verilog
b = a;   // فوراً اجرا می‌شود
c = b;   // مقدار جدید b استفاده می‌شود
```
دستورات **به ترتیب** اجرا می‌شوند — مثل زبان C.

### انتساب Non-blocking با `<=`
```verilog
b <= a;  // مقداردهی به «آینده» برنامه‌ریزی می‌شود
c <= b;  // مقدار قدیمی b استفاده می‌شود!
```
همه دستورات «همزمان» اجرا می‌شوند و همه سمت راست‌ها با **مقادیر قدیمی** محاسبه می‌شوند.

## مثال کلیدی: انتقال داده بین دو رجیستر

```verilog
// --- Non-blocking: درست ---
always @(posedge clk) begin
    r1 <= din;
    r2 <= r1;    // r2 مقدار قبلی r1 را می‌گیرد (شیفت رجیستر)
end

// --- Blocking: غلط برای سخت‌افزار ---
always @(posedge clk) begin
    r1 = din;
    r2 = r1;     // r2 همان din را می‌گیرد (رجیستر اضافی حذف شد!)
end
```

با `=` مدار شما عملاً یک شیفت رجیستر **نمی‌سازد** و با سنتزکننده‌های مختلف نتایج متفاوت (و اشتباه) می‌گیرید.

## قاعده استاندارد صنعت

| نوع مدار | انتساب |
|---|---|
| مدار ترکیبی در `always @(*)` | `=` (Blocking) |
| مدار ترتیبی در `always @(posedge clk)` | `<=` (Non-blocking) |

> هرگز `<=` و `=` را در **یک** بلوک always قاطی نکنید.

## مثال: شمارنده با Reset همزمان

```verilog
module counter_4bit(
    input clk,
    input reset,     // reset همزمان با ساعت
    output reg [3:0] count
);

always @(posedge clk) begin
    if (reset)
        count <= 4'd0;
    else
        count <= count + 4'd1;
end

endmodule
```

## مثال: reset ناهمزمان

```verilog
// reset ناهمزمان: بلافاصله فعال می‌شود، منتظر لبه ساعت نمی‌ماند
always @(posedge clk or posedge reset) begin
    if (reset)
        count <= 4'd0;
    else
        count <= count + 4'd1;
end
```

## جدول مقایسه

| ویژگی | Blocking `=` | Non-blocking `<=` |
|---|---|---|
| ترتیب اجرا | ترتیبی | موازی |
| مقدار استفاده‌شده در سمت راست | جدید (به‌روز) | قدیمی (قبل از لبه) |
| مناسب | مدار ترکیبی | مدار ترتیبی |
| در یک بلوک با خودش | امن | امن |

## اشتباه رایج

```verilog
// غلط: قاطی کردن دو نوع انتساب
always @(posedge clk) begin
    temp  = a & b;     // Blocking
    q    <= temp;      // Non-blocking
end
```

درست‌تر: `temp` را `wire` کنید و با `assign` بیرون بلوک حساب کنید، یا هر دو را `<=` کنید.
