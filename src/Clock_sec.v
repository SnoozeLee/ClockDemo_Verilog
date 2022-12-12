module Clock_sec (
    clk_out_sec,
    clk_in_50M
);
output clk_out_sec;      // 输出 1Hz -> 1s
input clk_in_50M;      // 50MHz -> 20ns

// 根据需要解开相应注释
// 标准一秒
//  wire clk1, clk2, clk3;
//  Div_100 div_A(clk1, clk_in_50M);
//  Div_100 div_B(clk2, clk1);
//  Div_100 div_C(clk3, clk2);
//  Div_5 divD(clk_out_sec, clk3);

// 加快100倍
// wire clk1, clk2;
// Div_100(clk1, clk_in_50M);
// Div_100(clk2, clk1);
// Div_5(clk_out_sec, clk2);

// 加快500倍
// wire clk1;
// Div_100(clk1, clk_in_50M);
// Div_100(clk_out_sec, clk1);

// 加快50000倍
// Div_100 div_A(clk_out_sec, clk_in_50M);

// 不分频供仿真使用
assign clk_out_sec = clk_in_50M;

endmodule //Clock_sec