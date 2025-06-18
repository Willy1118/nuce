# modelsim: source SET.tcl

vlib work
vlog SET.v

vlog testfixture.v +define+MD1 
vsim work.testfixture1
run -all
quit -sim

vlog testfixture.v +define+MD2 
vsim work.testfixture1
run -all
quit -sim

vlog testfixture.v +define+MD3 
vsim work.testfixture1
run -all
quit -sim

vlog testfixture.v +define+MD4 
vsim work.testfixture1
run -all
quit -sim
