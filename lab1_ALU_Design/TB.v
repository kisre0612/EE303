`define CLK_PERIOD                              2
        
// Arithmetic selection                     
`define ADD_SEL                                 3'b000
`define SUB_SEL                                 3'b001
// Bitwise selection                        
`define NAND_SEL                                3'b010
`define NOR_SEL                                 3'b011
`define NOT_SEL                                 3'b100
// Shift selection                      
`define LRS_SEL                                 3'b101

module TB;              
    reg     [15:0]                              A;
    reg     [15:0]                              B;
    reg     [2:0]                               SEL;
    wire    [15:0]                              ALU_OUT;
    wire                                        Cout;

    reg     [15:0]                              Passed;
    reg     [15:0]                              Failed;

    ALU                         
    YourALU(                            
        .A                                      (A),
        .B                                      (B),
        .SEL                                    (SEL),
        .ALU_OUT                                (ALU_OUT),
        .Cout                                   (Cout)
    );

    initial begin
        $dumpfile("myfile.dmp");
        $dumpvars;

        $display("The ALU test begins!");
        Passed                                  = 0;
        Failed                                  = 0;

        ArithmeticTest;
        BitwiseTest;
        ShiftTest;
        
        $display("Passed = %0d, Failed = %0d", Passed, Failed);
        $finish();
    end

    task ArithmeticTest;
    begin
        AddTest;
        SubTest;
    end
    endtask

    task BitwiseTest;
    begin
        NandTest;
        NorTest;
        NotTest;
    end
    endtask

    task ShiftTest;
    begin
        LrsTest;
    end
    endtask


    task AddTest;
    begin
        SEL = `ADD_SEL;
        Test("Add-1", 0, 0, 0, 0);
        Test("Add-2", 1, 0, 1, 0);
        Test("Add-3", 2, 3, 5, 0);
        Test("Add-4", 3, 2, 5, 0);
        Test("Add-5", 2, 3, 5, 0);
        Test("Add-6", 3, 2, 5, 0);
        Test("Add-7", 16'h8000, 16'h8000, 0, 1);
        Test("Add-8", 16'hffff, 1, 0, 1);
        Test("Add-9", 16'hffff, 16'hffff, 16'hfffe, 1);    
    end
    endtask

    task SubTest;
    begin
        SEL = `SUB_SEL;
        Test("Sub-1", 0, 0, 0, 0);
        Test("Sub-2", 1, 0, 1, 0);
        Test("Sub-3", 0, 1, 16'hffff, 0);
        Test("Sub-4", 16'hffff, 16'hffff, 0, 0);
        Test("Sub-5", 3, 2, 1, 0);
        Test("Sub-6", 0, 2, 16'hfffe, 0);
        Test("Sub-7", 0, 16'hffff, 1, 0);
    end
    endtask

    task NandTest;
    begin
        SEL = `NAND_SEL;
        Test("Nand-1", {4{4'b1010}}, {4{4'b0101}}, {4{4'b1111}}, 0);
        Test("Nand-2", {4{4'b0110}}, {4{4'b0101}}, {4{4'b1011}}, 0);
    end
    endtask

    task NorTest;
    begin
        SEL = `NOR_SEL;
        Test("Nor-1", {4{4'b0101}}, {4{4'b1101}}, {4{4'b0010}}, 0);
        Test("Nor-2", {4{4'b1000}}, {4{4'b0001}}, {4{4'b0110}}, 0);
    end
    endtask

    task NotTest;
    begin
        SEL = `NOT_SEL;
        Test("Not-1", 0, 0, 16'hffff, 0);
        Test("Not-2", 1, 0, 16'hfffe, 0);
        Test("Not-3", 16'hcafe, 0, 16'h3501, 0);
    end
    endtask

    task LrsTest;
    begin
        SEL = `LRS_SEL;
        Test("Lrs-1", 16'ha, 0, 5, 0);
        Test("Lrs-2", 1, 0, 0, 0);
        Test("Lrs-3", 16'hfffa, 0, 16'h7ffd, 0);
        Test("Lrs-4", 16'hffff, 0, 16'h7fff, 0);
    end
    endtask

    task Test;
        input [16 * 8 : 0]                      test_name;
        input [15:0]                            A_;
        input [15:0]                            B_;
        input [15:0]                            C_expected;
        input                                   Cout_expected;
    begin
        $display("TEST %s :", test_name);
        A = A_;
        B = B_;
        #1;
        if (ALU_OUT == C_expected && Cout == Cout_expected) begin
            $display("PASSED");
            Passed                              = Passed + 1;
        end
        else begin
            $display("FAILED");
            $display("A = %0b, B = %0b, AluOut = %0b (Ans : %0b), Cout = %0b (Ans : %0b)", A_, B_, ALU_OUT, C_expected, Cout, Cout_expected);
            Failed                              = Failed + 1;
        end   
    end
    endtask

endmodule