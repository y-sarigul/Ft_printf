# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msarigul <msarigul@student.42kocaeli.com.  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/02 10:02:09 by msarigul          #+#    #+#              #
#    Updated: 2022/08/02 10:11:50 by msarigul         ###   ########.tr        #
#                                                                              #
# **************************************************************************** #

NAME	:= libftprintf.a 
SRCS	:= src
SRC		:= src/ft_print_pointer.c\
	src/ft_printf.c\
	src/ft_printf_hex.c\
	src/ft_printf_number.c\
	src/ft_printf_utils.c\

OBJDIR	:= objects
LIBFT	:= $(OBJDIR)/libft.a
OBJ		:= $(SRC:$(SRCS)/%.c=$(OBJDIR)/%.o)
CC		:= cc
CFLAGS	:= -Wall -Wextra -Werror -I ./include

$(NAME): $(OBJDIR) $(LIBFT) $(OBJ)
	@mv $(OBJDIR)/libft.a libftprintf.a
	@ar -rcs $(NAME) $(OBJ)

$(OBJDIR):
	@mkdir -p $(OBJDIR)

$(LIBFT):
	@make -C libft

$(OBJDIR)/%.o: $(SRCS)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

clean:
	@rm -f $(OBJDIR)/*.o

fclean: clean
	@rm -f $(NAME)
	@rm -rf $(OBJDIR)

re: fclean all

.PHONY: all re clean fclean
