module inverter(
    input in,
    output out
    );

supply1 vdd;
supply0 gnd;

pmos mp1(out, vdd, in);
nmos mn1(out, gnd, in);

endmodule