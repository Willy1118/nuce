# CMD: vsim -c -do lcd_ctrl_tb1.tcl

vlib work
vlog lcd_ctrl.v
vlog testfixture.v +define+tb1
vsim work.test
run -all
