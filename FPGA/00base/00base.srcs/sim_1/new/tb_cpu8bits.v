`timescale 1ns / 1ps

module tb_cpu8bits;

reg sys_clk;
reg sys_rst_n;

initial begin
    sys_clk = 0;
    sys_rst_n = 0;
    #100
    sys_rst_n = 1;
end

always #10 sys_clk = ~sys_clk;

reg ra;
reg rb;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        ra <= 1'b0;
        rb <= 1'b0;
    end
    else begin
        {ra, rb} <= {ra, rb} + 1'b1;
    end
end

halfadd ihalfadd(
    .a      (ra),
    .b      (rb),
    .sum    (sum),
    .c      (c)
);

endmodule
