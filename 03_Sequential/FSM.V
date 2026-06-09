module traffic_light(
    input clk, reset,
    output reg [1:0] light
);
    // State encoding
    parameter RED    = 2'b00;
    parameter GREEN  = 2'b01;
    parameter YELLOW = 2'b10;
    
    reg [1:0] state;
    
    // State transition
    always @(posedge clk or posedge reset) begin
        if(reset)
            state <= RED;
        else begin
            case(state)
                RED:    state <= GREEN;
                GREEN:  state <= YELLOW;
                YELLOW: state <= RED;
                default: state <= RED;
            endcase
        end
    end
    
    // Output logic
    always @(state) begin
        case(state)
            RED:    light = 2'b00;
            GREEN:  light = 2'b01;
            YELLOW: light = 2'b10;
            default: light = 2'b00;
        endcase
    end
endmodule