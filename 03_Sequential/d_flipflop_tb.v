module d_flipflop_tb;
    reg clk, reset, d;
    wire q;
    
    d_flipflop uut (.clk(clk), .reset(reset), .d(d), .q(q));
    
    // Generate clock
    initial clk = 0;
    always #5 clk = ~clk;
    
    // Dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, d_flipflop_tb);
    end
    
    initial begin
        $display("CLK RESET D | Q");
        $display("---------------");
        
        // Test reset
        reset=1; d=0; #10;
        $display(" %b    %b    %b | %b", clk, reset, d, q);
        
        // Release reset
        reset=0; d=1; #10;
        $display(" %b    %b    %b | %b", clk, reset, d, q);
        
        // Change d
        d=0; #10;
        $display(" %b    %b    %b | %b", clk, reset, d, q);
        
        // Change d again
        d=1; #10;
        $display(" %b    %b    %b | %b", clk, reset, d, q);
        
        // Test reset again
        reset=1; #10;
        $display(" %b    %b    %b | %b", clk, reset, d, q);
        
        $finish;
    end
endmodule