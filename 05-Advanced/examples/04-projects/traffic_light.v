// چراغ راهنمایی - FSM چهار حالته با تایمر
// چرخه: قرمز(4) → سبز(4) → زرد(2) → تکرار
// زمان‌ها بر حسب تیک ساعت ورودی هستند
// در شبیه‌سازی با clk_1hz فرضی هر تیک = 1 ثانیه

module traffic_light(
    input clk,        // فرض: 1 هرتز
    input reset,      // reset ناهمزمان
    output red,
    output yellow,
    output green
);

localparam RED    = 2'd0,
           GREEN  = 2'd1,
           YELLOW = 2'd2;

localparam RED_TIME    = 4,   // 4 ثانیه
           GREEN_TIME  = 4,   // 4 ثانیه
           YELLOW_TIME = 2;   // 2 ثانیه

reg [1:0]  state;
reg [2:0]  time_cnt;
reg [2:0]  state_time;    // مدت زمان حالت فعلی

// --- منطق حالت بعدی ---
wire [1:0] next_state = (state == RED)    ? GREEN :
                         (state == GREEN)  ? YELLOW :
                         (state == YELLOW) ? RED : RED;

// --- رجیستر حالت و تایمر ---
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state    <= RED;
        time_cnt <= 3'd0;
    end else begin
        if (time_cnt >= state_time - 1) begin
            state    <= next_state;
            time_cnt <= 3'd0;
        end else begin
            time_cnt <= time_cnt + 3'd1;
        end
    end
end

// --- مدت هر حالت ---
always @(*) begin
    case (state)
        RED:    state_time = RED_TIME;
        GREEN:  state_time = GREEN_TIME;
        YELLOW: state_time = YELLOW_TIME;
        default: state_time = RED_TIME;
    endcase
end

// --- خروجی‌ها (Moore) ---
assign red    = (state == RED);
assign yellow = (state == YELLOW);
assign green  = (state == GREEN);

endmodule
