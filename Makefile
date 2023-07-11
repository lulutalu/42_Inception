# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lduboulo				    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/27 18:29:51 by lduboulo          #+#    #+#              #
#    Updated: 2023/07/11 19:15:25 by lduboulo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# COLORS

GREEN	= \033[1;32m
RED 	= \033[1;31m
ORANGE	= \033[1;33m
BUILD	= \e[38;5;225m
SEP	= \e[38;5;120m
DUCK	= \e[38;5;227m
RESET	= \033[0m

# COLORS

##############################  FOLDER  ########################################
SRCS_DIR	:= ./srcs/
################################################################################


##############################   FILES  ########################################
SRCS_FILES	= docker-compose.yml
################################################################################

MAKELIB	= ${MAKE} -C
CC	= gcc
AR	= ar rcs
MKDIR	= mkdir -p
RM	= rm -f

TSEP	= ${SEP}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${RESET}



all:
	@printf "\n${GREEN}Starting setup of Inception docker${RESET}\n"
	@docker-compose up -f -d ${SRCS_DIR}${SRCS_FILES} --build
	@printf "${GREEN}Docker started !${RESET} ✅\n"

stop :
	@docker-compose down
	@printf "${RED} 🧹 Docker stopped${RESET} ❌\n"

clean :
	@docker system prune -a
	@printf "${RED} 🧹 Docker images deleted${RESET} ❌\n"

volume-clean :
	@${RM} /home/lduboulo/data/*
	@${RM} /home/lduboulo/data/wordpress/*
	@${RM} /home/lduboulo/data/mariadb/*
	@printf "${RED} 🧹 Docker volumes's files deleted${RESET} ❌\n"

mariadb :
	@docker exec --it mariadb ash

nginx :
	@docker exec --it nginx ash

wordpress :
	@docker exec --it wordpress ash

re :	stop clean volume clean all

.PHONY : all stop clean volume-clean mariadb nginx wordpress re
