# CMD: vsim -c -do SET_MD4.tcl

vlib work
vlog SET.v
vlog testfixture.v +define+MD4 
vsim work.testfixture1
run -all
