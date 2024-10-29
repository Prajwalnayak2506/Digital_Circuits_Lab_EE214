transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/MealyFSM.vhd}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/DUT.vhdl}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/runFSM.vhd}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/cryFSM.vhd}
vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/broomFSM.vhd}

vcom -93 -work work {C:/Users/Acer/Documents/EE214/Week7/MealyFSM/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
