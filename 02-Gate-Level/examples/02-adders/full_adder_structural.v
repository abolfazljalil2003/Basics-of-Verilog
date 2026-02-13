module full_adder_structural(
    input a,
    input b,
    input carry_in,
    output sum,
    output carry_out
);

wire sum1, carry1, carry2;

half_adder_structural HA1(
    .a(a),
    .b(b),
    .sum(sum1),
    .carry(carry1)
);

half_adder_structural HA2(
    .a(sum1),
    .b(carry_in),
    .sum(sum),
    .carry(carry2)
);

or OR1(carry_out, carry1, carry2);

endmodule