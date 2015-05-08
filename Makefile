_help_:
	@echo make clean - clean project
	@echo make compile - compile and concat coffee into single file


clean:
	rm -r build node_modules

compile:
	grunt coffee
