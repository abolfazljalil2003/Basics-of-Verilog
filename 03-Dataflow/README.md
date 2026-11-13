# سطح جریان داده (Dataflow Level)

در این بخش با استفاده از انتساب پیوسته (`assign`) مدارهای ترکیبی را به صورت توصیفی می‌سازیم.

## محتوای این بخش

### مبانی جریان داده
- انتساب پیوسته (Continuous Assignment)
- تفاوت `wire` و `reg`
- عملگرهای Verilog

### مدارهای ترکیبی
- Adder چند بیتی
- Decoder و Encoder
- Priority Encoder
- Multiplexer با انتساب توصیفی

## ساختار فایل‌ها
```
03-Dataflow/
├── theory/
│   ├── 01-continuous-assignment.md
│   ├── 02-operators.md
│   ├── 03-decoder-encoder.md
│   └── 04-mux-priority-encoder.md
├── examples/
│   ├── 01-adders/
│   ├── 02-decoder/
│   ├── 03-encoder/
│   └── 04-mux/
└── testbenches/
```

## مزایای این سطح

- کد کوتاه‌تر نسبت به سطح گیت
- بدون نیاز به دانستن ساختار داخلی مدار
- مناسب برای مدارهای ترکیبی

## معایب

- برای مدارهای ترتیبی (Sequential) مناسب نیست
- در مدارهای خیلی پیچیده خوانایی کم می‌شود

## ترتیب مطالعه

۱. انتساب پیوسته و عملگرها
۲. طراحی Adder با جریان داده
۳. Decoder و Encoder
۴. Priority Encoder
۵. Multiplexer توصیفی
