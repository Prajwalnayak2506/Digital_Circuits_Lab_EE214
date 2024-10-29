transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/Register6bit/Gates.vhdl}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/Register6bit/Register6bit.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/Register6bit/J_KFF.vhd}
vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/Register6bit/DFF_JK.vhd}

vcom -93 -work work {C:/Users/Student/Desktop/22B3914_2023EE114_EndSem/Register6bit/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
