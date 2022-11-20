module Counter24 (
    state,
    rco,
    rst, en, clk, load,
    data
);
output reg[4:0] state;
output rco;                 // 进位
input rst, en, clk, load;   // 1-异步清零、 计数使能(0-保持, 1-计数)、时钟、载入预置数
input wire[4:0] data;       // 预置数数值

always @(posedge clk or posedge rst) begin
    if(rst) state <= 6'b00000;
    else 
        if(load) 
            state <= data;              // 载入数据
        else 
            if(en) begin
                if(state + 1 >= 24) state <= 0;
                else state <= state + 1;     // 计数
            end
            else
                state <= state;         // 保持
end
assign rco = (state == 23 && en == 1) ? 1 : 0;

endmodule //Counter60