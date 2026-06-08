module decoder_2to4_tb;
    reg [1:0] in;
    wire [3:0] out;
    
    decoder_2to4 uut (.in(in), .out(out));
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, decoder_2to4_tb);
        
        $display("IN | OUT");
        $display("---------");
        in=2'b00; #10; $display("%b  | %b", in, out);
        in=2'b01; #10; $display("%b  | %b", in, out);
        in=2'b10; #10; $display("%b  | %b", in, out);
        in=2'b11; #10; $display("%b  | %b", in, out);
        $finish;
    end
endmodule