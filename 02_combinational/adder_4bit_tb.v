module adder_4bit_tb;
    reg [3:0] a, b;
    wire [3:0] sum;
    wire carry;
    
    adder_4bit uut (.a(a), .b(b), .sum(sum), .carry(carry));
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, adder_4bit_tb);
        
        $display("A    B    | SUM  CARRY");
        $display("----------------------");
        a=4'b0011; b=4'b0101; #10;
        $display("%b %b | %b  %b", a, b, sum, carry);
        
        a=4'b1111; b=4'b0001; #10;
        $display("%b %b | %b  %b", a, b, sum, carry);
        
        a=4'b1010; b=4'b0101; #10;
        $display("%b %b | %b  %b", a, b, sum, carry);
        
        a=4'b1111; b=4'b1111; #10;
        $display("%b %b | %b  %b", a, b, sum, carry);
        $finish;
    end
endmodule