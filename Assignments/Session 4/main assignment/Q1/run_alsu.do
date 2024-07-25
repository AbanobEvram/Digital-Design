vlib work

vlog ALSU.v ALSU_tb.v

vsim -voptargs=+acc ALSU_tb

add wave *

run -all

#quit -sim
