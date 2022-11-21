module MyClock (
    hour_shi_seg, hour_ge_seg, min_shi_seg, min_ge_seg, sec_shi_seg, sec_ge_seg,
    testPort,
    secState, minState, hourState,
    clk_in_50M
);
output wire[7:0] hour_shi_seg, hour_ge_seg, min_shi_seg, min_ge_seg, sec_shi_seg, sec_ge_seg;
output reg testPort;
output wire [6:0] secState, minState, hourState;
input clk_in_50M;

wire clk_sec, clk_min, clk_hour, clk_day;   // 时钟线
reg rst_sec=0, rst_min=0, rst_hour=0;   // 清零端   1-异步清零
reg en_sec=1, en_min=1, en_hour=1;      // 计数使能 1-计数 0-保持
reg load_sec=0, load_min=0 , load_hour=0;  // 载入数 1-载入
reg [6:0] data_sec_default = 7'b0000000;    // 预载入数据
reg [6:0] data_min_default = 7'b0000000;    // 预载入数据
reg [6:0] data_hour_default = 7'b0000000;    // 预载入数据

Clock_sec(clk_sec, clk_in_50M);

// 处理秒数连线
Counter60 secCounter(
    secState, clk_min, 
    rst_sec, en_sec, clk_sec, load_sec,
    data_sec_default
);
BCD_7seg_100_ca secSeg(sec_shi_seg, sec_ge_seg, secState);

// 处理分钟数连线
Counter60 minCounter(
    minState, clk_hour,
    rst_min, en_min, clk_min, load_min,
    data_min_default
);
BCD_7seg_100_ca minSeg(min_shi_seg, min_ge_seg, minState);

// 处理小时数连线
Counter24 hourCounter(
    hourState, clk_day,
    rst_hour, en_hour, clk_hour, load_hour,
    data_hour_default
);
BCD_7seg_100_ca hourSeg(hour_shi_seg, hour_ge_seg, hourState);

always @(posedge clk_sec) begin
    testPort = ~testPort;
end

endmodule //MyClock
