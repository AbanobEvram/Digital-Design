vlib work

vlog D_Flipflop.v Ripple_counter.v Counte.v Counte_tb.v

vsim -voptargs=+acc Counter_golden_tb

add wave *

run -all

#quit -sim
