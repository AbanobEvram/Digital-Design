vlib work

vlog DSP.v D_Flipflop.v DSP_BLOCK_tb.v DSP_block_tb.v

vsim -voptargs=+acc DSP_block_tb

add wave *

run -all

#quit -sim