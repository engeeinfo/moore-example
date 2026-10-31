.PHONY: build lint test

IVERILOG ?= iverilog
VVP ?= vvp
BUILD_DIR := build
SIM := $(BUILD_DIR)/fsm

build:
	@mkdir -p $(BUILD_DIR)
	$(IVERILOG) -g2012 -Wall -s moore_fsm_sd_tb -o $(SIM) fsm.v fsm_tb.v

lint: build
	@echo "Icarus warning check completed during build."

test: build
	$(VVP) $(SIM)
