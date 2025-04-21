module seq_dect(
    input clk,
    input reset,
    input seq_in,
    output reg dect_out
);

parameter zero = 3'b000;
parameter one = 3'b001;
parameter onezero = 3'b011;
parameter onezeroone = 3'b010;
parameter onezerooneone = 3'b110;

reg [2:0] current_state, next_state;

// Sequential logic for state update
always @(posedge clk or posedge reset) begin
    if (reset == 1) 
        current_state <= zero;  // Reset state to 'zero' on reset signal
    else 
        current_state <= next_state;  // Update to next state
end

// Combinational logic for next state
always @(current_state or seq_in) begin
    case (current_state)
        zero: begin
            if (seq_in == 1)
                next_state = one;
            else
                next_state = zero;
        end

        one: begin
            if (seq_in == 0)
                next_state = onezero;
            else
                next_state = one;
        end

        onezero: begin
            if (seq_in == 0)
                next_state = zero;
            else
                next_state = onezeroone;
        end

        onezeroone: begin
            if (seq_in == 0)
                next_state = zero;
            else
                next_state = onezerooneone;
        end

        onezerooneone: begin
            if (seq_in == 1)
                next_state = zero;
            else
                next_state = one;
        end

        default: 
            next_state = zero; // Default to zero for safety
    endcase
end

// Output logic based on current state
always @(current_state) begin
    case (current_state)
        zero: dect_out = 0;
        one: dect_out = 0;
        onezero: dect_out = 0;
        onezeroone: dect_out = 0;
        onezerooneone: dect_out = 1; // Output '1' when reaching the final state
        default: dect_out = 0;
    endcase
end

endmodule
