// Multiplexer 4 به 1 - سه روش مختلف

// ---- روش 1: عملگر شرطی تودرتو ----
module mux_4to1_nested(
    input [3:0] d,
    input [1:0] sel,
    output y
);

assign y = sel[1] ? (sel[0] ? d[3] : d[2])
                   : (sel[0] ? d[1] : d[0]);

endmodule

// ---- روش 2: عملگر شرطی زنجیره‌ای ----
module mux_4to1_chain(
    input [3:0] d,
    input [1:0] sel,
    output y
);

assign y = (sel == 2'b00) ? d[0] :
           (sel == 2'b01) ? d[1] :
           (sel == 2'b10) ? d[2] : d[3];

endmodule

// ---- روش 3: اندیس‌گذاری بردار (بهترین روش) ----
module mux_4to1_dataflow(
    input [3:0] d,
    input [1:0] sel,
    output y
);

assign y = d[sel];

endmodule
