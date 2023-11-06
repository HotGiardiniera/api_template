DC=docker compose
D=docker

%:
	@:

args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

.PHONY: up rebuild exec action

up:
	$(DC) up

rebuild:
	$(DC) build --no-cache
	$(DC) up

shell:
	$(D) exec -it $(call args,api) /bin/bash

requirements:
	$(D) exec api pip-compile -o requirements.txt requirements.in;