module Div_5 (
    low_out,
    high_in
);
output wire low_out;
input  wire high_in;
reg[2:0] count;
initial begin
    count = 'b0;
end
always @(posedge high_in) begin
    count = count + 1;
    if(count >= 5)    // 0~4
        count = 0;
end
assign low_out = (count<2) ? 1 : 0;

endmodule //Div_5