NODES_EXISTS=$(shell [ -x "./node_modules" ] && echo 1 || echo 0 )


_help_:
	@echo make clean - clean project
	@echo make compile - compile and concat coffee into single file


clean:
	rm -r node_modules

compile:
ifneq ($(NODES_EXISTS), 1)
	npm install
endif
	grunt coffee concat uglify
