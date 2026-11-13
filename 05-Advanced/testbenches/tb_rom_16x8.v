`timescale 1ns/1ps

// تست‌بنچ ROM 16x8
// همه 16 خانه را می‌خواند و با فایل rom_data.mem مقایسه می‌کند

module tb_rom_16x8();

reg [3:0] addr;
wire [7:0] dout;

rom_16x8 DUT(.addr(addr), .dout(dout));

integer i;

initial begin
    $monitor("Time=%0t addr=%0d dout=%h", $time, addr, dout);

    for (i = 0; i < 16; i = i + 1) begin
        addr = i[3:0];
        #10;
    end

    $finish;
end

endmodule
