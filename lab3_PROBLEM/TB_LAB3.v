`timescale 1ns/100ps
module TB();

localparam  CLK_UNIT = 1;
localparam  CLK_HPER = CLK_UNIT * 5;       
localparam  CLK_PER  = CLK_HPER * 2;   

reg		     CLK;
reg        RST_N;
reg  [2:0] OP;
reg  [7:0] D;
wire [7:0] Q;

initial	CLK	<= 1'b0;
always #(CLK_HPER) CLK <= ~CLK;


initial begin
	//Reset and initial input value 
  RST_N= 1'b0;
  D    = 8'b00000000;
  OP   = 3'b000;

  // PART1
  #(CLK_PER)
  //*************WRITE YOUR CODE HERE !**************** //
  #(CLK_PER) RST_N = 1'b1;
  #(CLK_PER) OP = 3'b000; D = 8'hA5; // 1. Hold (000)
  #(CLK_PER) OP = 3'b001;            // 2. Load (001)
  #(CLK_PER) OP = 3'b010;            // 3. Synchronous reset (010)
  #(CLK_PER) OP = 3'b011;            // 4. 1's complement (011)
  #(CLK_PER) OP = 3'b100; D = 8'h0F; // 5. Add (100)
  #(CLK_PER) OP = 3'b101;            // 6. Left shift (101)
  #(CLK_PER) OP = 3'b110; D = 8'h2F; // 7. Count number of 1s (110)
  #(CLK_PER) OP = 3'b111; D = 8'hAA; // 8. Custom operation: XOR (111)
  #(CLK_PER)
  $display ("************************************************************************");
  $display ("Information for you: LAB3 is the last verilog homework of this semester!");
  $display ("************************************************************************");
	$finish();
end

Multi_operator Multi_op(
  .CLK(CLK), 
  .RST_N(RST_N),
  .OP(OP), 
  .D(D),
  .Q(Q)
);

// For gtkwave
initial
begin
	$dumpfile("myfile.dmp");
	$dumpvars;
end

endmodule
