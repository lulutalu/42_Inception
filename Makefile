# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lduboulo				    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/02/27 18:29:51 by lduboulo          #+#    #+#              #
#    Updated: 2023/07/12 18:33:16 by lduboulo         ###   ########.fr        #
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
RM	= rm -rf

TSEP	= ${SEP}=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=${RESET}



all:
	@printf "\n${GREEN}Starting setup of Inception docker${RESET}\n"
	@docker-compose -f ${SRCS_DIR}${SRCS_FILES} up --build -d
	@printf "${GREEN}Docker started !${RESET} ✅\n"

stop :
	@docker-compose -f ${SRCS_DIR}${SRCS_FILES} down
	@printf "${RED} 🧹 Docker stopped${RESET} ❌\n"

clean :
	@docker volume rm srcs_wordpress-data
	@docker volume rm srcs_database-data
	@printf "${RED} 🧹 Docker images deleted${RESET} ❌\n"

volume-clean :
	@${RM} /home/lduboulo/data/mariadb/*
	@${RM} /home/lduboulo/data/wordpress/*
	@printf "${RED} 🧹 Docker volumes's files deleted${RESET} ❌\n"

logs :
	@docker-compose -f ${SRCS_DIR}${SRCS_FILES} logs

mariadb :
	@docker exec -it mariadb ash

nginx :
	@docker exec -it nginx ash

wordpress :
	@docker exec -it wordpress ash

re :	stop clean volume-clean all

.PHONY : all stop clean volume-clean mariadb nginx wordpress re logs
