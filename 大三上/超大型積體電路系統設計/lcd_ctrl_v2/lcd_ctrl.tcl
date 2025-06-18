# modelsim: source lcd_ctrl.tcl

vlib work
vlog lcd_ctrl.v

vlog testfixture.v +define+tb1
vsim work.test
run -all
quit -sim

vlog testfixture.v +define+tb2
vsim work.test
run -all
quit -sim
