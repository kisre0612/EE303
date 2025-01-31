`timescale 1ns / 1ps

module decoder(
  input  i_A,
  input  i_B,
  input  i_C,
  input  i_D,

  output o_1,
  output o_2,
  output o_3,
  output o_4,
  output o_5,
  output o_6,
  output o_7
);

///////////////////////////////////////
//
// write your code here
//
///////////////////////////////////////

reg [3:0] input_i;
reg [6:0] output_o;

always @* begin
  input_i[3] = i_A;
  input_i[2] = i_B;
  input_i[1] = i_C;
  input_i[0] = i_D;
  output_o[6] = o_1;
  output_o[5] = o_2;
  output_o[4] = o_3;
  output_o[3] = o_4;
  output_o[2] = o_5;
  output_o[1] = o_6;
  output_o[0] = o_7;
  case (input_i)
    4'b0000: output_o = 7'b1111110;
    4'b0001: output_o = 7'b0110000;
    4'b0010: output_o = 7'b1101101;
    4'b0011: output_o = 7'b1111001;
    4'b0100: output_o = 7'b0110011;
    4'b0101: output_o = 7'b1011011;
    4'b0110: output_o = 7'b1011111;
    4'b0111: output_o = 7'b1110000;
    4'b1000: output_o = 7'b1111111;
    4'b1001: output_o = 7'b1111011;
    default: output_o = 7'b0000000;
  endcase
end

assign o_1 = output_o[6];
assign o_2 = output_o[5];
assign o_3 = output_o[4];
assign o_4 = output_o[3];
assign o_5 = output_o[2];
assign o_6 = output_o[1];
assign o_7 = output_o[0];

endmodule
