DIR_ROOT=$(shell pwd)
DIR_SCRIPT=$(DIR_ROOT)/script
DIR_OUTPUT=$(DIR_ROOT)/output

scgrn: $(DIR_SCRIPT)/scgrn.sh
	sh $(DIR_SCRIPT)/scgrn.sh

scgrn-hpc: $(DIR_SCRIPT)/scgrn.sh
	sbatch $(DIR_SCRIPT)/scgrn.sh

docker: $(DIR_SCRIPT)/docker.sh
	sh $(DIR_SCRIPT)/docker.sh

clean:
	rm -rf *.out
	rm -rf $(DIR_OUTPUT)
	cd $(DIR_SCRIPT) && make clean

