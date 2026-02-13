module and2(
    input A,
    input B,
    output out
    );
	 
wire o1;

nand2 na1(A, B, o1);
inverter inv1(o1, out);

endmodule