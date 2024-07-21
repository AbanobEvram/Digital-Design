vlib work

vlog D_Flipflop.v Ripple_counter.v Ripple_counter_tb.v

vsim -voptargs=+acc work.Ripple_counter_tb

add wave *

run -all

#quit -sim
