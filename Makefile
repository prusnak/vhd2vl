#!/usr/bin/make
# by RAM 2017

EXAMPLES = $(wildcard examples/*.vhd)
VHDLS    = $(notdir $(EXAMPLES))

all: diff

src/vhd2vl:
	make -C src

translate: src/vhd2vl
	@mkdir -p temp/verilog
	@$(foreach VHDL,$(VHDLS),cd examples; ../src/vhd2vl $(VHDL) ../temp/verilog/$(basename $(VHDL)).v)

diff: translate
	@diff -u translated_examples temp/verilog

clean:
	make -C src clean
	rm -fr temp
