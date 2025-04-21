module moore_fsm_sd_tb;
    reg seq_in;
    reg clock;
    reg reset;
    wire detector_out;
    
    // Instantiate the Unit Under Test (UUT)
    moore_fsm_sd uut (
        .seq_in(seq_in),
        .clock(clock),
        .reset(reset),
        .detector_out(detector_out)
    );

    // Clock generation (period = 10ns)
    initial begin
        clock = 0;
        forever #5 clock = ~clock;  // Toggle clock every 5ns, resulting in a 100MHz clock
    end

    // Stimulus generation
    initial begin
        // Initial values
        seq_in = 0;
        reset = 1; // Assert reset
        
        // Apply reset for some time
        #20;        // Hold reset for 20ns
        
        reset = 0;  // Deassert reset
        #10;        // Wait for some time to let the FSM start

        // Apply sequence of inputs to the FSM
        seq_in = 1;  #10;  // Apply 1 for 10ns
        seq_in = 0;  #10;  // Apply 0 for 10ns
        seq_in = 1;  #10;  // Apply 1 for 10ns
        seq_in = 0;  #10;  // Apply 0 for 10ns
        seq_in = 1;  #10;  // Apply 1 for 10ns
        seq_in = 0;  #10;  // Apply 0 for 10ns
        
        // Add more test vectors here if needed
        #50;        // Wait some more time before finishing the simulation
    end
endmodule
