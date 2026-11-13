`timescale 1ns/1ps

// تست‌بنچ Priority Encoder 4 به 2
// همه 16 حالت ورودی را تست می‌کند

module tb_priority_encoder_4to2();

reg [3:0] in;
wire [1:0] out;
wire valid;

priority_encoder_4to2 DUT(
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $monitor("Time=%0t in=%b out=%b valid=%b", $time, in, out, valid);

    for (in = 0; in < 16; in = in + 1) begin
        #10;
    end

    $finish;
end

endmodule
