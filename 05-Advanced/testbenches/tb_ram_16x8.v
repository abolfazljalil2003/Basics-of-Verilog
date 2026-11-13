`timescale 1ns/1ps

// تست‌بنچ RAM 16x8
// چند مقدار می‌نویسد، بعد دوباره می‌خواند و صحت را بررسی می‌کند

module tb_ram_16x8();

reg clk, we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

ram_16x8 DUT(.clk(clk), .we(we), .addr(addr), .din(din), .dout(dout));

always #5 clk = ~clk;

integer i;

initial begin
    clk = 0; we = 0; addr = 0; din = 0;
    $monitor("Time=%0t we=%b addr=%0d din=%h dout=%h", $time, we, addr, din, dout);

    // --- فاز نوشتن: mem[i] = i*16 ---
    we = 1;
    for (i = 0; i < 16; i = i + 1) begin
        addr = i[3:0];
        din  = i * 16;
        @(negedge clk);
    end
    @(negedge clk);
    we = 0;

    // --- فاز خواندن و بررسی ---
    for (i = 0; i < 16; i = i + 1) begin
        addr = i[3:0];
        @(negedge clk);      // آدرس در میانه دوره پایدار می‌شود
        @(posedge clk);      // خواندن در لبه بعدی انجام می‌شود
        #1;
        if (dout !== i * 16)
            $display("FAIL: addr=%0d dout=%h (انتظار %h)", addr, dout, i * 16);
        else
            $display("PASS: mem[%0d] = %h", addr, dout);
    end

    $finish;
end

endmodule
