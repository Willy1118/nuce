onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testfixture/clk
add wave -noupdate /testfixture/reset
add wave -noupdate /testfixture/gray_ready
add wave -noupdate /testfixture/gray_req
add wave -noupdate /testfixture/gray_addr
add wave -noupdate /testfixture/gray_data
add wave -noupdate /testfixture/lbp_data
add wave -noupdate /testfixture/lbp_valid
add wave -noupdate /testfixture/finish
add wave -noupdate /testfixture/result_compare
add wave -noupdate /testfixture/err
add wave -noupdate /testfixture/times
add wave -noupdate /testfixture/over
add wave -noupdate /testfixture/exp_num
add wave -noupdate /testfixture/i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 189
configure wave -valuecolwidth 114
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1030 ps}
