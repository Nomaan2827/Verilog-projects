module traffic_light_tb;
    reg clk, reset;
    wire [1:0] light;
    
    traffic_light uut (.clk(clk), .reset(reset), .light(light));
    
    // Generate clock
    initial clk = 0;
    always #5 clk = ~clk;
    
    // Dump waves
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, traffic_light_tb);
    end
    
    // Task to display light name
    task display_light;
        case(light)
            2'b00: $display("Time=%0t | Light = RED", $time);
            2'b01: $display("Time=%0t | Light = GREEN", $time);
            2'b10: $display("Time=%0t | Light = YELLOW", $time);
            default: $display("Time=%0t | Light = UNKNOWN", $time);
        endcase
    endtask
    
    initial begin
        // Reset first
        reset=1; #10;
        display_light;
        
        // Release reset
        reset=0;
        
        // Watch it cycle through states
        #10; display_light;
        #10; display_light;
        #10; display_light;
        #10; display_light;
        #10; display_light;
        #10; display_light;
        
        // Reset in middle
        reset=1; #10;
        display_light;
        
        // Start again
        reset=0;
        #10; display_light;
        #10; display_light;
        #10; display_light;
        
        $finish;
    end
endmodule