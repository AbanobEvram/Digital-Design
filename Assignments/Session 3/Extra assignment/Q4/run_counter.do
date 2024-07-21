vlib work

vlog D_Flipflop.v Ripple_counter.v Extend_counter.v Extend_counter_tb.v

vsim -voptargs=+acc Extend_counter_tb

add wave *

run -all

#quit -sim
