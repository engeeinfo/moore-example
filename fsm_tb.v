module moore_fsm_sd_tb;
reg seq_in;
reg clock;
reg reset;
wire detector_out;
moore_fsm_sd uut (.seq_in(seq_in),.clock(clock),.reset(reset),.detector_out(detector_out));
initial begin
clock=0;
forever #5 clock=~clock;
end
initial begin
seq_in=0;
reset=1;
#30;
reset=1;
#40;
seq_in=1;
#10;
seq_in=0;
#10;
seq_in=1;
#20;
seq_in=0;
#20;
seq_in=1;
#20;
seq_in=0;

end
endmodule
