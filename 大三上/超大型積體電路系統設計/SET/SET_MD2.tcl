# CMD: vsim -c -do SET_MD2.tcl

vlib work
vlog SET.v
vlog testfixture.v +define+MD2 
vsim work.testfixture1
run -all
