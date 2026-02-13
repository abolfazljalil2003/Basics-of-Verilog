module nor2(
    input a,
    input b,
    output out
);

supply0 gnd;
supply1 vdd;
wire m1;

pmos pm1(m1, vdd, a);
pmos pm2(out, m1, b);

nmos nm1(out, gnd, a);
nmos nm2(out, gnd, b);

endmodule