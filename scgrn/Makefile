## macro
# macro for expr
EXPR_CURR=cells.lps.mgla.csv
# EXPR_CURR=cells.pituitary.loom
# macro for dir
DIR_ROOT=$(shell pwd)
DIR_SCRIPT=$(DIR_ROOT)/script
DIR_OUTPUT=$(DIR_ROOT)/output
# macro for workstation
WORKSTAT_IP=192.168.18.19
WORKSTAT_USER=luolab
# macro for hpc
HPC_IP=10.12.100.88
HPC_USER=zhenghui
HPC_OUTPUT=~/DATA/nibs-intern/scgrn/output

contact:
	ssh $(HPC_USER)@$(HPC_IP)

scgrn: $(DIR_SCRIPT)/scgrn.sh
	cd $(DIR_SCRIPT) && sh ./scgrn.sh $(EXPR_CURR)

scgrn-hpc: $(DIR_SCRIPT)/scgrn.sh
	cd $(DIR_SCRIPT) && sbatch ./scgrn.sh $(EXPR_CURR)

update:
	scp -r $(HPC_USER)@$(HPC_IP):$(HPC_OUTPUT) $(DIR_ROOT)

docker: $(DIR_SCRIPT)/docker.sh
	sh $(DIR_SCRIPT)/docker.sh $(EXPR_CURR)

clean:
	rm -rf *.out
	cd $(DIR_SCRIPT) && make clean

clean-deep:
	make clean
	rm -rf $(DIR_OUTPUT)

