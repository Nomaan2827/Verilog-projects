// Code your testbench here
// or browse Examples
module half_adder_tb;
    // Declare inputs as reg
    reg a, b;
    
    // Declare outputs as wire
    wire sum, carry;
    
    // Connect to half_adder module
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );
    
    initial begin
        $display("A B | SUM CARRY");
        $display("---------------");
        
        a=0; b=0; #10;
        $display("%b %b |  %b    %b", a, b, sum, carry);
        
        a=0; b=1; #10;
        $display("%b %b |  %b    %b", a, b, sum, carry);
        
        a=1; b=0; #10;
        $display("%b %b |  %b    %b", a, b, sum, carry);
        
        a=1; b=1; #10;
        $display("%b %b |  %b    %b", a, b, sum, carry);
        
        $finish;
    end
endmodule