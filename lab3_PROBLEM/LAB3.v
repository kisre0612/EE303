module Multi_operator(
	input wire 			CLK,
	input wire			RST_N,
	input wire  [2:0] 	OP, 
	input wire  [7:0]	D,
	output reg  [7:0]	Q
);
	
localparam HOLD     = 3'b000;
localparam LOAD     = 3'b001;
//*************WRITE YOUR CODE HERE !**************** //
localparam S_RESET	= 3'b010;	// Synchronous Reset
localparam COMP_1	= 3'b011;	// 1's Complement
localparam ADD		= 3'b100;	// Add
localparam LSHIFT	= 3'b101;	// Left Shift
localparam COUNT_1	= 3'b110;	// Count the number of 1
localparam XOR		= 3'b111;	// XOR
localparam LOW		= 1'b0;

always @(posedge CLK or negedge RST_N) begin
	if(RST_N==LOW) Q <= 8'b0; // Asynchronous Reset
	else begin
		case(OP)
			HOLD:	 Q <= Q;
			LOAD: 	 Q <= D;
			S_RESET: Q <= 8'b0;
			COMP_1:  Q <= ~Q;
			ADD:	 Q <= Q+D;
			LSHIFT:	 Q <= Q<<1;
			COUNT_1: Q <= D[0]+D[1]+D[2]+D[3]+D[4]+D[5]+D[6]+D[7];
			XOR: 	 Q <= Q^D;
			default: Q <= Q;
		endcase
	end
//*************WRITE YOUR CODE HERE !**************** //
end

endmodule
