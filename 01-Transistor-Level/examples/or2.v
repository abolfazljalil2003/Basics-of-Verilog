module or2(
    input a,
    input b,
    output out
);

wire norRes;

nor2 nor_gate(a, b, norRes);
inverter inv(norRes, out);

endmodule