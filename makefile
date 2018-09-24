LIB_CFG=dep/libs.mk
NAME=#PROJECT NAME GOES HERE
LIBDIR=$(realpath dep)
OS_D=$(WORKING_DIR)/$(shell uname)
include dep/gen.mk
export NAME

make: $(OBJS)
	@echo "Assembly phase goes here"
