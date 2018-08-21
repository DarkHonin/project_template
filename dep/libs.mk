WORKING_DIR:=$(realpath .)
FOLDERS=$(shell find $(LIBDIR) -name ft_lib)
LIBRAIRIES=$(dir $(FOLDERS))
INCLUDE=$(addprefix -I,$(addsuffix includes, $(LIBRAIRIES)))
LINKS=$(foreach file,$(FOLDERS), $(addprefix -l,$(shell cat $(file))))

mod_list:
	@echo Installed modules:
	@for i in $(LIBRAIRIES); do \
		echo \t$$i;	\
	done

mod_init:
	@echo "Cloning submodules:"
	@for i in $(shell cat $(WORKING_DIR)/dep/modules); do \
		echo \t$$i;	\
		cd $(WORKING_DIR)/dep; \
		git clone $$i -q; \
	done