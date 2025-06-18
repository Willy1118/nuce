# CMD: vsim -c -do SET_MD3.tcl

vlib work
vlog SET.v
vlog testfixture.v +define+MD3
vsim work.testfixture1
run -all
