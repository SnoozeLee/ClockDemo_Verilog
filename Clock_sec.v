module Clock_sec (
    clk_in_50M,
    clk_out_sec
);
output clk_in_50M;      // 50MHz -> 20ns
input clk_out_sec;      // 输出 1Hz -> 1s
wire clk1, clk2, clk3;
Div_100(clk1, clk_in_50M);
Div_100(clk2, clk1);
Div_100(clk3, clk2);
Div_5(clk_out_sec, clk3);

endmodule //Clock_sec