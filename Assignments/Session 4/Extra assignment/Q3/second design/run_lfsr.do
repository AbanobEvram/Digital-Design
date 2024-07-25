vlib work

vlog LFSR.v LFSR_tb.v

vsim -voptargs=+acc LFSR_tb

add wave *

run -all

#quit -sim
