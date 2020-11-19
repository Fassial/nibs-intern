## macro
# macro for dir
DIR_ROOT=$(shell pwd)
DIR_SCRIPT=$(DIR_ROOT)/script
DIR_OUTPUT=$(DIR_ROOT)/output
DIR_KEYS=$(DIR_ROOT)/keys
# macro for hpc
HPC_IP=10.12.100.88
HPC_USER=zhenghui
HPC_OUTPUT=~/DATA/nibs-intern/scgrn/output

scgrn: $(DIR_SCRIPT)/scgrn.sh
	sh $(DIR_SCRIPT)/scgrn.sh

scgrn-hpc: $(DIR_SCRIPT)/scgrn.sh
	sbatch $(DIR_SCRIPT)/scgrn.sh

update:
	scp -i $(DIR_KEYS)/id_rsa -r $(HPC_USER)@$(HPC_IP):$(HPC_OUTPUT) $(DIR_ROOT)

docker: $(DIR_SCRIPT)/docker.sh
	sh $(DIR_SCRIPT)/docker.sh

clean:
	rm -rf *.out
	cd $(DIR_SCRIPT) && make clean

clean-deep:
	make clean
	rm -rf $(DIR_OUTPUT)

