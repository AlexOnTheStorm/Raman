transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/FIFORam.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Raman.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Action.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Accumulation.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Storage.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Divider.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Pool.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Switch.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Ratio.v}
vlog -vlog01compat -work work +incdir+D:/Quartus/Raman {D:/Quartus/Raman/Divider2.v}

