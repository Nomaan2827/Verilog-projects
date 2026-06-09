module counter_tb;
    reg clk, reset;
    wire [3:0] count;
    
    counter uut (.clk(clk), .reset(reset), .count(count));
    
    // Generate clock
    initial clk = 0;
    always #5 clk = ~clk;
    
    // Dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, counter_tb);
    end
    
    initial begin
        $display("TIME | RESET | COUNT");
        $display("--------------------");
        
        // Test reset first
        reset=1; #10;
        $display(" %0t  |   %b   | %b", $time, reset, count);
        
        // Release reset - start counting
        reset=0; #10;
        $display(" %0t  |   %b   | %b", $time, reset, count);
        
        // Let it count
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        
        // Reset in middle of counting
        reset=1; #10;
        $display(" %0t  |   %b   | %b", $time, reset, count);
        
        // Start counting again
        reset=0; #10;
        $display(" %0t  |   %b   | %b", $time, reset, count);
        #10; $display(" %0t  |   %b   | %b", $time, reset, count);
        
        $finish;
    end
endmodule