onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/INPUT_DATA
add wave -noupdate /test/EXPECT_DATA
add wave -noupdate /test/period
add wave -noupdate /test/clk
add wave -noupdate /test/reset
add wave -noupdate /test/nt
add wave -noupdate /test/xi
add wave -noupdate /test/yi
add wave -noupdate /test/xo
add wave -noupdate /test/yo
add wave -noupdate /test/po
add wave -noupdate /test/busy
add wave -noupdate /test/i
add wave -noupdate /test/j
add wave -noupdate /test/k
add wave -noupdate /test/l
add wave -noupdate /test/out_f
add wave -noupdate /test/err
add wave -noupdate /test/pattern_num
add wave -noupdate /test/total_num
add wave -noupdate /test/total_cycle_num
add wave -noupdate /test/a
add wave -noupdate /test/b
add wave -noupdate /test/c
add wave -noupdate /test/d
add wave -noupdate /test/data_base
add wave -noupdate /test/data_base_expect
add wave -noupdate /test/data_tmp_expect
add wave -noupdate /test/data_tmp_i1
add wave -noupdate /test/data_tmp_i2
add wave -noupdate /test/data_tmp_i3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {1 ns}
