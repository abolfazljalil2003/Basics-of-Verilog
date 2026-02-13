module xor2(
    input a,
    input b,
    output out
    );
    
wire abar, bbar, abarB, bbarA;

inverter inv1(a, abar);
inverter inv2(b, bbar);

and2 and1(abar, b, abarB);
and2 and2(bbar, a, bbarA);

or2 or1(abarB, bbarA, out);

endmodule