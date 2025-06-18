# CMD: vsim -c -do SET_MD1.tcl

vlib work
vlog SET.v
vlog testfixture.v +define+MD1 
vsim work.testfixture1
run -all
