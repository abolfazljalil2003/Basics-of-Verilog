module demux_1bit(
    input x,
    input sel,
    output y0,
    output y1
);

wire sel_not;

not NOT1(sel_not, sel);
and AND1(y0, x, sel_not);
and AND2(y1, x, sel);

endmodule