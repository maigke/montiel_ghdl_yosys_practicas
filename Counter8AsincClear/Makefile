PROJ = Counter8AsincClear
PIN_DEF = $(PROJ).pcf
PROJ_DIR =$(HOME)/Documents/Projects/APIO
GHDL_S =/usr/share/yosys/plugins/ghdl.so
DEVICE = hx1k
PACKAGE = tq144  #Si se usa la icestick
#DEVICE = hx8k
#PACKAGE = ct256 #Si se usa la iCE40-HX8K

all:  $(PROJ).bin

%.blif: %.vhd
	ghdl -a --workdir=../work.ghdl/ $(PROJ).vhd
	cp ../work.ghdl/$(PROJ).o  $(PROJ_DIR)/$(PROJ)
	cp ../work.ghdl/work-obj93.cf $(PROJ_DIR)/$(PROJ)
	#yosys -m /usr/share/yosys/plugins/ghdl.so -p 'ghdl $(PROJ); synth_ice40 -blif $@'
	yosys -m $(GHDL_S) -p 'ghdl $(PROJ); synth_ice40 -top $(PROJ) -json $(PROJ).json -blif $@'
%.asc: $(PIN_DEF) %.blif
	#arachne-pnr -d $(subst hx,,$(subst lp,,$(DEVICE))) -o $@ -p $^
	nextpnr-ice40 --$(DEVICE) --package $(PACKAGE) --json $(PROJ).json --pcf $(PROJ).pcf --asc $(PROJ).asc 
%.bin: %.asc
	icepack $< $@

%.rpt: %.asc
	icetime -d $(DEVICE) -mtr $@ $<

prog: $(PROJ).bin
	iceprog $<

sudo-prog: $(PROJ).bin
	@echo 'Executing prog as root!!!'
	sudo iceprog $<

clean:
	rm -f $(PROJ).blif $(PROJ).asc $(PROJ).rpt $(PROJ).bin work-obj93.cf $(PROJ).o $(PROJ).bin $(PROJ).json

.SECONDARY:
.PHONY: all prog clean
