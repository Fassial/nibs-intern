EXPR_CURR=sleep-mouse

run:
	make prep
	make postp

prep:
	cd preprocess && python preprocess-$(EXPR_CURR).py

postp:
	cd postprocess && python postprocess-$(EXPR_CURR).py

train:
	python main.py

clean:
	rm -rf ./__pycache__
	rm -rf *.pyc

