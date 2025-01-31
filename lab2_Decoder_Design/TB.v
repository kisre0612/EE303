`timescale 1ns / 1ps

module TB ();

/////////////////////////////////////////////////

reg  [3:0] din;
wire [6:0] dout;

reg  [3:0] sol_cnt;

parameter SOLUTION_0 = 7'b0111111;
parameter SOLUTION_1 = 7'b0000110;
parameter SOLUTION_2 = 7'b1011011;
parameter SOLUTION_3 = 7'b1001111;
parameter SOLUTION_4 = 7'b1100110;
parameter SOLUTION_5 = 7'b1101101;
parameter SOLUTION_6 = 7'b1111101;
parameter SOLUTION_7 = 7'b0000111;
parameter SOLUTION_8 = 7'b1111111;
parameter SOLUTION_9 = 7'b1101111;

/////////////////////////////////////////////////

decoder u_decoder (
  .i_A ( din[3]  ),
  .i_B ( din[2]  ),
  .i_C ( din[1]  ),
  .i_D ( din[0]  ),

  .o_1 ( dout[0] ),
  .o_2 ( dout[1] ),
  .o_3 ( dout[2] ),
  .o_4 ( dout[3] ),
  .o_5 ( dout[4] ),
  .o_6 ( dout[5] ),
  .o_7 ( dout[6] )
);

/////////////////////////////////////////////////

initial begin

  // for iverilog waveform
  $dumpfile("myfile.dmp");
  $dumpvars;

  din     = 0;
  sol_cnt = 0;
  
  // ------------------------
  // number 0
  din = 0;
  #10;
  if (dout==SOLUTION_0) begin
    $display ("Case 0 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 0 is failed");
  end
  #10;

  // ------------------------
  // number 1
  din = 1;
  #10;
  if (dout==SOLUTION_1) begin
    $display ("Case 1 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 1 is failed");
  end
  #10;

  // ------------------------
  // number 2
  din = 2;
  #10;
  if (dout==SOLUTION_2) begin
    $display ("Case 2 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 2 is failed");
  end
  #10;

  // ------------------------
  // number 3
  din = 3;
  #10;
  if (dout==SOLUTION_3) begin
    $display ("Case 3 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 3 is failed");
  end
  #10;

  // ------------------------
  // number 4
  din = 4;
  #10;
  if (dout==SOLUTION_4) begin
    $display ("Case 4 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 4 is failed");
  end
  #10;

  // ------------------------
  // number 5
  din = 5;
  #10;
  if (dout==SOLUTION_5) begin
    $display ("Case 5 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 5 is failed");
  end
  #10;

  // ------------------------
  // number 6
  din = 6;
  #10;
  if (dout==SOLUTION_6) begin
    $display ("Case 6 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 6 is failed");
  end
  #10;

  // ------------------------
  // number 7
  din = 7;
  #10;
  if (dout==SOLUTION_7) begin
    $display ("Case 7 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 7 is failed");
  end
  #10;

  // ------------------------
  // number 8
  din = 8;
  #10;
  if (dout==SOLUTION_8) begin
    $display ("Case 8 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 8 is failed");
  end
  #10;

  // ------------------------
  // number 9
  din = 9;
  #10;
  if (dout==SOLUTION_9) begin
    $display ("Case 9 is passed");
    sol_cnt = sol_cnt + 1;
  end
  else begin
    $display ("Case 9 is failed");
  end
  #10;

  // ------------------------
  // Results
  $display ("Total score: %d", sol_cnt);

end

endmodule
