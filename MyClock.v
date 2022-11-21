module MyClock (
    hour_shi_seg, hour_ge_seg, min_shi_seg, min_ge_seg, sec_shi_seg, sec_ge_seg,
    testPort,
    secondState,
    clk_in_50M
);
output wire[7:0] hour_shi_seg, hour_ge_seg, min_shi_seg, min_ge_seg, sec_shi_seg, sec_ge_seg;
output reg testPort;
output wire [6:0] secondState;
input clk_in_50M;

wire clk_sec, clk_min;   // 时钟线
reg rst_sec=0;   // 清零端   1-异步清零
reg en_sec=1;      // 计数使能 1-计数 0-保持
reg load_sec=0;  // 载入数 1-载入
reg [6:0] data_sec_default = 7'b0000000;    // 预载入数据

Clock_sec(clk_sec, clk_in_50M);

Counter60 secCounter(
    secondState, clk_min, 
    rst_sec, en_sec, clk_sec, load_sec,
    data_sec_default
);
BCD_7seg_100_ca secGe(
    sec_shi_seg, sec_ge_seg, secondState 
);
always @(posedge clk_sec) begin
    testPort = ~testPort;
end

endmodule //MyClock
