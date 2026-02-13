module nand2(
    input A,
    input B,
    output out
    );

supply1 vdd;
supply0 gnd;

pmos mp1(out, vdd, A);
pmos mp2(out, vdd, B);

nmos mn1(out, n1, A);
nmos mn2(n1, gnd, B);

endmodule