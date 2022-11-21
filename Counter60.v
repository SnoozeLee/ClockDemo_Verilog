module Counter60 (
    output_state,
    rco,
    rst, en, clk, load,
    data
);
output wire[6:0] output_state;
output rco;                 // 进位
input wire rst, en, clk, load;   // 1-异步清零、 计数使能(0-保持, 1-计数)、时钟、载入预置数1-载入
input wire[6:0] data;       // 预置数数值
reg[6:0] state;
always @(posedge clk or posedge rst) begin
    if(rst) begin
        // rst优先级最高
        state = 7'b0000000;
    end
    else if(clk) begin
        if(!load) begin 
            if(en) begin
                if(state+1==60) begin state = 7'b0000000; end
                else begin state = state +1 ; end   // 计数
            end
            else begin
                state = state;  // 维持
            end
        end
        else begin state <= data; end   // 载入数据
    end
end
assign rco = (state == 59 && en == 1) ? 1 : 0;
assign output_state = state;
endmodule //Counter60