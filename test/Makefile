
CFLAGS = -Wall -Werror -Wextra -MP -MMD -fsanitize=address -fsanitize=leak

#CFLAGS = -Wall -Werror -Wextra -MP -MMD -g

SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin
INC_DIR = ./inc

SRC = 	test_ft_atoi_base.c			\
		test_ft_list_push_front.c 	\
		test_ft_list_size.c		 	\
		test_ft_list_sort.c		 	\
		test_ft_list_remove_if.c	\
		test_strcpy.c				\
		text_strcmp.c				\
		test_strlen.c				\
		test_write.c				\
		test_read.c

DEPS = $(patsubst %.c, ${OBJ_DIR}/%.d, ${SRC})

LIBASM = ../bin/libasm.a

FOLDERS = ${OBJ_DIR} ${BIN_DIR}

all: 	${FOLDERS}	\
		${BIN_DIR}/test_ft_atoi_base	\
		${BIN_DIR}/test_ft_list_push_front \
		${BIN_DIR}/test_ft_list_size \
		${BIN_DIR}/test_ft_list_sort \
		${BIN_DIR}/test_ft_list_remove_if	\
		${BIN_DIR}/test_strdup	\
		${BIN_DIR}/test_strlen	\
		${BIN_DIR}/test_strcpy	\
		${BIN_DIR}/test_strcmp	\
		${BIN_DIR}/test_write	\
		${BIN_DIR}/test_read

#Reglas strlen
${BIN_DIR}/test_strlen :  ${OBJ_DIR}/test_strlen.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_strlen.o ${LIBASM}

${OBJ_DIR}/test_strlen.o: ${SRC_DIR}/test_strlen.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas strcpy
${BIN_DIR}/test_strcpy : ${OBJ_DIR}/test_strcpy.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_strcpy.o ${LIBASM}

${OBJ_DIR}/test_strcpy.o: ${SRC_DIR}/test_strcpy.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas strcmp
${BIN_DIR}/test_strcmp : ${OBJ_DIR}/test_strcmp.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_strcmp.o ${LIBASM}

${OBJ_DIR}/test_strcmp.o: ${SRC_DIR}/test_strcmp.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas write
${BIN_DIR}/test_write : ${OBJ_DIR}/test_write.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_write.o ${LIBASM}

${OBJ_DIR}/test_write.o: ${SRC_DIR}/test_write.c Makefile
	cc ${CFLAGS} -I ${INC_DIR}  -o $@ -c $<

#Reglas read
${BIN_DIR}/test_read : ${OBJ_DIR}/test_read.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_read.o ${LIBASM}

${OBJ_DIR}/test_read.o: ${SRC_DIR}/test_read.c Makefile
	cc ${CFLAGS} -I ${INC_DIR}  -o $@ -c $<

#Reglas strdup
${BIN_DIR}/test_strdup : ${OBJ_DIR}/test_strdup.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_strdup.o ${LIBASM}

${OBJ_DIR}/test_strdup.o: ${SRC_DIR}/test_strdup.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas ft_atoi_base
${BIN_DIR}/test_ft_atoi_base : ${OBJ_DIR}/test_ft_atoi_base.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_ft_atoi_base.o ${LIBASM}

${OBJ_DIR}/test_ft_atoi_base.o: ${SRC_DIR}/test_ft_atoi_base.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas ft_list_push_front
${BIN_DIR}/test_ft_list_push_front : ${OBJ_DIR}/test_ft_list_push_front.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_ft_list_push_front.o ${LIBASM}

${OBJ_DIR}/test_ft_list_push_front.o: ${SRC_DIR}/test_ft_list_push_front.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas ft_list_size
${BIN_DIR}/test_ft_list_size : ${OBJ_DIR}/test_ft_list_size.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_ft_list_size.o ${LIBASM}

${OBJ_DIR}/test_ft_list_size.o: ${SRC_DIR}/test_ft_list_size.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas ft_list_sort
${BIN_DIR}/test_ft_list_sort : ${OBJ_DIR}/test_ft_list_sort.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_ft_list_sort.o ${LIBASM}

${OBJ_DIR}/test_ft_list_sort.o: ${SRC_DIR}/test_ft_list_sort.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

#Reglas ft_list_remove_if
${BIN_DIR}/test_ft_list_remove_if : ${OBJ_DIR}/test_ft_list_remove_if.o ${LIBASM}
	cc ${CFLAGS} -z execstack -o $@ ${OBJ_DIR}/test_ft_list_remove_if.o ${LIBASM}

${OBJ_DIR}/test_ft_list_remove_if.o: ${SRC_DIR}/test_ft_list_remove_if.c Makefile
	cc ${CFLAGS} -I ${INC_DIR} -o $@ -c $<

${LIBASM}:
	make --no-print-directory all -C ../

${OBJ_DIR}:
	mkdir -p ${OBJ_DIR}

${BIN_DIR}:
	mkdir -p ${BIN_DIR}

clean:
	@rm -rf ${OBJ_DIR}

fclean: clean
	@rm -rf ${BIN_DIR}

re: fclean all

-include ${DEPS}

.PHONY: all clean fclean re