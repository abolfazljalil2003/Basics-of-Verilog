module basic_gates_demo(
    input a,
    input b,
    output y_and,
    output y_or,
    output y_not_a,
    output y_nand,
    output y_nor,
    output y_xor,
    output y_xnor
);

and AND1(y_and, a, b);
or OR1(y_or, a, b);
not NOT1(y_not_a, a);
nand NAND1(y_nand, a, b);
nor NOR1(y_nor, a, b);
xor XOR1(y_xor, a, b);
xnor XNOR1(y_xnor, a, b);

endmodule