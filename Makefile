SUBDIR_TARGETS= rabbitmq-base haproxy

.PHONY: all $(SUBDIR_TARGETS)

all: $(SUBDIR_TARGETS)

$(SUBDIR_TARGETS): %:
	@echo "Buiding image $@"
	@(cd $@ && make)