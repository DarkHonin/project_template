LIB_CFG=dep/libs.mk

NAME=#project produced tag
include dep/gen.mk
export NAME

make: $(OBJS)
	#
	#	project make rule comes here
	#
	#@ar rc $(NAME) $(OBJS)
	#@ranlib $(NAME)
	#@echo "LIB MADE"