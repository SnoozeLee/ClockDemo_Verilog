module BCD_7seg_100_ca (
    shiwei_out,
    gewei_out,
    num_in
);  // 7线数据输入一个100以内的二进制数，输出两个数码管编码
output wire[7:0] shiwei_out, gewei_out;
input [6:0] num_in;
reg[3:0] shiwei_value;
reg[3:0] gewei_value;
always @(num_in) begin
    shiwei_value = num_in/10;
    gewei_value = num_in%10;
end

BCD_7seg_decoder_ca shiweiModule(shiwei_out, shiwei_value);
BCD_7seg_decoder_ca geweiModule(gewei_out, gewei_value);

endmodule //BCD_7seg_100_ca

module BCD_7seg_decoder_ca (dula, num);
// 共阳极 common anode
    input [3:0] num;
    output [7:0] dula; 
    // 
    // dula 从左到右依次为  点,a,b,c, d,e,f,g
    reg [7:0] dula;

    always @(num) begin
        case(num[3:0]) 
        // 0-4
            4'b0000 : dula[7:0] = 8'b10000001;
            4'b0001 : dula[7:0] = 8'b11001111;
            4'b0010 : dula[7:0] = 8'b10010110;
            4'b0011 : dula[7:0] = 8'b10000110;
            4'b0100 : dula[7:0] = 8'b11001100;
        // 5-9
            4'b0101 : dula[7:0] = 8'b10100100;
            4'b0110 : dula[7:0] = 8'b10100000;
            4'b0111 : dula[7:0] = 8'b10001111;
            4'b1000 : dula[7:0] = 8'b10000000;
            4'b1001 : dula[7:0] = 8'b10000100;
        // 其他
            default: dula[7:0] = 2'hff;
        // 建议以后写入ABCDEF
        endcase
    end
endmodule