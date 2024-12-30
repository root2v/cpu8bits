`timescale 1ns / 1ps

module halfadd(
    input a,
    input b,
    output sum,
    output c
);

assign sum = a^b;
assign c = a&b;


endmodule
