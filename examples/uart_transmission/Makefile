# Project setup
PROJ      = uart
BUILD     = ./build
DEVICE    = 8k
FOOTPRINT = ct256

# Files
FILES = top.v
FILES += uart_trx.v

.PHONY: all clean burn

all:$(BUILD)/$(PROJ).bin

$(BUILD)/$(PROJ).bin: $(FILES) Makefile
	# if build folder doesn't exist, create it
	mkdir -p $(BUILD)
	# synthesize using Yosys
	yosys -p "synth_ice40 -top top -blif $(BUILD)/$(PROJ).blif" $(FILES)
	# Place and route using arachne
	arachne-pnr -d $(DEVICE) -P $(FOOTPRINT) -o $(BUILD)/$(PROJ).asc -p pinmap_$(FOOTPRINT).pcf $(BUILD)/$(PROJ).blif
	# Convert to bitstream using IcePack
	icepack $(BUILD)/$(PROJ).asc $(BUILD)/$(PROJ).bin

burn:   $(BUILD)/$(PROJ).bin
	iceprog $<

clean:
	rm -f build/*
