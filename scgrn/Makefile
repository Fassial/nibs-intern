DIR_ROOT=$(shell pwd)
DIR_SCRIPT=$(DIR_ROOT)/script
DIR_OUTPUT=$(DIR_ROOT)/output

scgrn: $(DIR_SCRIPT)/scgrn.sh
	cd $(DIR_SCRIPT) && sh ./scgrn.sh

scgrn-hpc: $(DIR_SCRIPT)/scgrn.sh
	cd $(DIR_SCRIPT) && sbatch ./scgrn.sh

docker: $(DIR_SCRIPT)/docker.sh
	sh $(DIR_SCRIPT)/docker.sh

clean:
	rm -rf *.out
	cd $(DIR_SCRIPT) && make clean

clean-deep:
	make clean
	rm -rf $(DIR_OUTPUT)

