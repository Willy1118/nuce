# CMD: vsim -c -do lcd_ctrl_tb2.tcl

vlib work
vlog lcd_ctrl.v
vlog testfixture.v +define+tb2 
vsim work.test
run -all
