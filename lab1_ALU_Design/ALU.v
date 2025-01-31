module ALU (
	input	[15:0]									A,
	input	[15:0]									B,
	input	[2:0]									SEL,
	output	[15:0]									ALU_OUT,
	output  										Cout
);				

/********************************				
  Write your own code here.
  1. Inputs and outputs are 16-bit signed binary numbers.
  2. Operation selection signals are 3-bit binary numbers. Those are defined in TB.v like ADD_SEL, SUB_SEL...
  3. Overflow must be detected. For Add & Sub operation, the ALU should be able to handle overflow. Cout must be one if overflow happens; otherwise, Cout should be zero.				
*********************************/				

	reg [15:0] alu;
	reg c;

	always @* begin
		alu = 16'b0;
		c = 1'b0;
		case (SEL)
			3'b000: begin
				// add operation
				alu = A + B;
				if((A[15] == 0) && (B[15] == 0) && (alu[15] == 1)) c = 1;
				else if((A[15] == 1) && (B[15] == 1)) c = 1;
				else if((A[15] != B[15]) && (alu[15] == 0)) c = 1;
			end
			3'b001: begin
				// sub operation
				alu = A - B;
				if((A[15] != B[15]) && (A[15] != alu[15])) c = 1;
			end
			3'b010: begin
				// nand operation, Cout = 0
				alu = ~(A & B);
			end
			3'b011: begin
				// nor operation, Cout = 0
				alu = ~(A | B);
			end
			3'b100: begin
				// not operation, Cout = 0
				alu = ~A;
			end
			3'b101: begin
				// logical right shift operation, Cout = 0
				alu = A >> 1;
			end
			default: begin
				alu = 16'b0;
				c = 1'b0;
			end
		endcase
	end

	assign ALU_OUT = alu;
	assign Cout = c;

endmodule