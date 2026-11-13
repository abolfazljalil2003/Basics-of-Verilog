// JK Flip-Flop - نسخه کامل با هر چهار رفتار
// J=0,K=0: نگه‌داشتن | J=0,K=1: ریست | J=1,K=0: ست | J=1,K=1: تاگل

module jk_flipflop(
    input clk,
    input j,
    input k,
    output reg q
);

always @(posedge clk) begin
    case ({j, k})
        2'b00: q <= q;       // نگه‌داشتن
        2'b01: q <= 1'b0;   // ریست
        2'b10: q <= 1'b1;   // ست
        2'b11: q <= ~q;     // تاگل
    endcase
end

endmodule
