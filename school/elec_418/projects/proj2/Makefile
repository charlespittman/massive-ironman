# project name
PROJECT = shiftrot
# vhdl files
FILES = src/*.vhd
# testbench
SIMTOP = $(PROJECT)_tb
SIMFILES = testbench/$(SIMTOP).vhd
# Simu break condition
GHDL_SIM_OPT    = --assert-level=error
GHDL_SIM_OPT    = --stop-time=500ns

SIMDIR = simu
#SYNTHFILES = bin/bus_led_ise/netgen/synthesis

GHDL_CMD        = ghdl
GHDL_FLAGS      = --ieee=synopsys --warn-no-vital-generic

VIEW_CMD        = gtkwave

ghdl-compile :
	mkdir -p $(SIMDIR)
	$(GHDL_CMD) -i $(GHDL_FLAGS) --workdir=$(SIMDIR) --work=work $(SIMFILES) $(FILES)
	$(GHDL_CMD) -m $(GHDL_FLAGS) --workdir=$(SIMDIR) --work=work $(SIMTOP)
	@mv $(SIMTOP) $(SIMDIR)/$(SIMTOP)

ghdl-run :
	@$(SIMDIR)/$(SIMTOP) $(GHDL_SIM_OPT) --vcdgz=$(SIMDIR)/$(SIMTOP).vcdgz

ghdl-view:
	gunzip --stdout $(SIMDIR)/$(SIMTOP).vcdgz | $(VIEW_CMD) --vcd

ghdl-clean :
	$(GHDL_CMD) --clean --workdir=$(SIMDIR)
	-rm -rf simu
