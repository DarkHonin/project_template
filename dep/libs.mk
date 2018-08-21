WORKING_DIR:=$(realpath .)
FOLDERS=$(shell find $(WORKING_DIR)/dep -name ft_lib)
LIBRAIRIES=$(dir $(FOLDERS))
INCLUDE=$(addprefix -I,$(addsuffix includes, $(LIBRAIRIES)))
LINKS=$(foreach file,$(FOLDERS), $(addprefix -l,$(shell cat $(file))))

mod_list:
	@echo Installed modules:
	@for i in $(LIBRAIRIES); do \
		echo '\t'$$i;	\
	done

mod_init:
	@echo "Cloning submodules:"
	@for i in $(shell cat $(WORKING_DIR)/dep/modules); do \
		echo '\t'$$i;	\
		cd $(WORKING_DIR)/dep; \
		git clone $$i -q; \
	done

mod_remove:
	@if [ ! -z "$(MOD)" -a "$(MOD)" != " "  ]; then \
		rm -rf $(WORKING_DIR)/dep/$(MOD); \
	else \
		echo "You need to define a mod: MOD=mod_name"; \
	fi