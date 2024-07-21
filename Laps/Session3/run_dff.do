vlib work
vlog dff_en_pre.v dff_en_pre_tb.v
vsim -voptargs=+acc work.dff_en_pre_tb
add wave *
run -all
#quit -sim