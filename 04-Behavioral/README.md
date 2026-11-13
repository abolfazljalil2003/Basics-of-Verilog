# سطح رفتاری (Behavioral Level)

در این بخش با بلوک `always` مدارهای **ترتیبی (Sequential)** را می‌سازیم: Latch، Flip-Flop، شمارنده و رجیستر شیفت.

## محتوای این بخش

### مبانی سطح رفتاری
- بلوک‌های `always` و `initial`
- تفاوت انتساب Blocking و Non-blocking
- Latch در برابر Flip-Flop

### مدارهای ترتیبی
- D Flip-Flop و JK Flip-Flop
- شمارنده‌ها (Mod-N، Up/Down، Ring)
- رجیسترهای شیفت (SIPO و PISO)

## ساختار فایل‌ها
```
04-Behavioral/
├── theory/
│   ├── 01-always-initial.md
│   ├── 02-blocking-nonblocking.md
│   ├── 03-latch-flipflop.md
│   └── 04-registers-counters.md
├── examples/
│   ├── 01-latch-flipflop/
│   ├── 02-counters/
│   └── 03-shift/
└── testbenches/
```

## مزایای این سطح

- بالاترین سطح انتزاع در Verilog
- مناسب برای مدارهای ترتیبی و پیچیده
- شبیه‌سازی سریع‌تر

## معایب

- سخت‌افزار تولیدی کاملاً به دست کامپایلر وابسته است
- اگر قواعد نوشتن رعایت نشود، مدار اشتباه (مثل Latch ناخواسته) ساخته می‌شود

## ترتیب مطالعه

۱. بلوک always و initial
۲. Blocking و Non-blocking
۳. Latch و Flip-Flop
۴. رجیسترها
۵. شمارنده‌ها
۶. رجیستر شیفت
