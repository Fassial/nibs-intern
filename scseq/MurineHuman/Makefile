source=src/scseq

run-LaManno2016:
	Rscript ./LaManno2016/$(source).R

run-LaManno2018:
	Rscript ./LaManno2018/$(source).R

run-Zhong2018:
	Rscript ./Zhong2018/$(source).R

run-Vanlandewijck2018:
	Rscript ./Vanlandewijck2018/$(source).R

run-Kalucka2020:
	Rscript ./Kalucka2020/$(source).R

run-Crouch2020:
	Rscript ./Crouch2020/$(source).R

run-all:
	make run-LaManno2016
	make run-LaManno2018
	make run-Zhong2018
	make run-Vanlandewijck2018
	make run-Kalucka2020
	make run-Crouch2020

clean:
	rm -rf *.Rout

