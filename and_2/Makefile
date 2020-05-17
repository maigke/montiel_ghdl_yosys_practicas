PROJ = and_2
PIN_DEF = and_2.pcf
DEVICE = hx1k
PACKAGE = tq144  #Si se usa la icestick
#DEVICE = hx8k
#PACKAGE = ct256 #Si se usa la iCE40-HX8K

all:  $(PROJ).bin

%.blif: %.vhd
	ghdl -a $(PROJ).vhd
	#yosys -m /usr/share/yosys/plugins/ghdl.so -p 'ghdl $(PROJ); synth_ice40 -blif $@'
	yosys -m /usr/share/yosys/plugins/ghdl.so -p 'ghdl $(PROJ); synth_ice40 -top $(PROJ) -json $(PROJ).json -blif $@'
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
	rm -f $(PROJ).blif $(PROJ).asc $(PROJ).rpt $(PROJ).bin work-obj93.cf

.SECONDARY:
.PHONY: all prog clean
