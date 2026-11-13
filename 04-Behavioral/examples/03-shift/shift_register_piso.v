// رجیستر شیفت موازی-ورود / سریال-خروج (PISO)
// با load=1 یک بایت کامل بارگذاری می‌شود
// سپس بیت‌به‌بیت از serial_out خارج می‌شود (بیت پرارزش اول)

module shift_register_piso(
    input clk,
    input load,
    input [7:0] din,
    output serial_out
);

reg [7:0] q;

always @(posedge clk) begin
    if (load)
        q <= din;
    else
        q <= {q[6:0], 1'b0};
end

assign serial_out = q[7];

endmodule
