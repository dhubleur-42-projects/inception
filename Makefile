# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dhubleur <dhubleur@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/06 20:13:19 by dhubleur          #+#    #+#              #
#    Updated: 2022/11/24 13:57:02 by dhubleur         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

HOME	=	/home/dhubleur
DOCKER_COMPOSE	=	sudo docker compose

all: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up -d

folders:
	mkdir -p $(HOME)/data/db_volume
	mkdir -p $(HOME)/data/nginx_volume

build: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml build

log: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up

stop:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml stop

clean: stop
	sudo docker system prune -f -a

fclean: clean
	sudo rm -rf ${HOME}/data

re : fclean all