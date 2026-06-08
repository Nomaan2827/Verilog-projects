module mux_2to1_tb;
    reg a, b, sel;
    wire y;
    
    mux_2to1 uut (.a(a), .b(b), .sel(sel), .y(y));
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, mux_2to1_tb);
        
        $display("SEL A B | Y");
        $display("-----------");
        sel=0; a=0; b=0; #10; $display("%b   %b %b | %b", sel, a, b, y);
        sel=0; a=1; b=0; #10; $display("%b   %b %b | %b", sel, a, b, y);
        sel=1; a=0; b=1; #10; $display("%b   %b %b | %b", sel, a, b, y);
        sel=1; a=1; b=0; #10; $display("%b   %b %b | %b", sel, a, b, y);
        $finish;
    end
endmodule