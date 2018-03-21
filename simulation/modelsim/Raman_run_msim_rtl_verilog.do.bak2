transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/FIFORam.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Raman.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Action.v}

