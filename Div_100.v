module Div_100 (
    low_out,
    high_in
);
output wire low_out;
input  wire high_in;
reg[7:0] count;
initial begin
    count = 7'b0000000;
end
always @(posedge high_in) begin
    count = count + 1;
    if(count >= 100)    // 0~99 
        count = 0;
end
assign low_out = (count<50) ? 1 : 0;

endmodule //Div_100