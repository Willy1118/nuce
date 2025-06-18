onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /test/clk
add wave -noupdate /test/reset
add wave -noupdate /test/cmd_valid
add wave -noupdate /test/cmd
add wave -noupdate /test/busy
add wave -noupdate /test/datain
add wave -noupdate /test/output_valid
add wave -noupdate /test/dataout
add wave -noupdate -radix unsigned /test/top/pc
add wave -noupdate /test/out_temp
add wave -noupdate /test/stop
add wave -noupdate /test/i
add wave -noupdate /test/j
add wave -noupdate /test/out_f
add wave -noupdate /test/err
add wave -noupdate /test/pattern_num
add wave -noupdate /test/over
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {177750 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {2941450 ps} {4461560 ps}
