SHELL := /bin/bash

BUILD_DATE=$(shell date '+%Y%m%d')
BUILD_VERSION=$(shell git log -1 --pretty=format:%h)
REGISTRY=ip:8001
NAME=custom-mysql

test:
	docker build --no-cache -f Dockerfile -t $(NAME) .
	docker run --name mymysql -d -v $(PWD)/etc/my.cnf:/etc/my.cnf -v $(PWD)/logs/error.log:/var/lib/mysql/mysql-error.log -p 3336:3306 $(NAME)

product:
	docker build --no-cache -f Dockerfile -t $(REGISTRY)/$(NAME):$(BUILD_DATE)-$(BUILD_VERSION) .
	docker tag $(REGISTRY)/$(NAME):$(BUILD_DATE)-$(BUILD_VERSION) $(REGISTRY)/$(NAME)
	docker push $(REGISTRY)/$(NAME):$(BUILD_DATE)-$(BUILD_VERSION)
	docker push $(REGISTRY)/$(NAME)
