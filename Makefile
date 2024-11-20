NAME = libasm.a

PLATFORM = elf64

SRC_DIR = ./src
OBJ_DIR = ./obj
BIN_DIR = ./bin

#SRC =	ft_strlen.s		\
		ft_strcpy.s

SRC =	ft_strlen.s		\
		ft_strcpy.s

SRCS = $(patsubst %.s, ${SRC_DIR}/%.s, ${SRC})
OBJS = $(patsubst %.s, ${OBJ_DIR}/%.o, ${SRC})

all:	${BIN_DIR}/${NAME}

${BIN_DIR}/${NAME}: makedirs ${OBJS}
	ar rcs -o ${BIN_DIR}/${NAME} ${OBJS}

${OBJ_DIR}/%.o: ${SRC_DIR}/%.s Makefile
	nasm -f ${PLATFORM} -o $@ $<

clean:
	@rm -rf ${OBJ_DIR}

fclean: clean
	@rm -rf ${BIN_DIR}

re: fclean

makedirs: ${BIN_DIR} ${OBJ_DIR}

${BIN_DIR}:
	@mkdir -p ${BIN_DIR}

${OBJ_DIR}:
	@mkdir -p ${OBJ_DIR}

tests: 
	make --no-print-directory all -C ./test 

#Prueba de concepto...
hello: makedirs
	nasm -f elf64 -o ${OBJ_DIR}/Hello.o ${SRC_DIR}/Hello.s
	ld -m elf_x86_64 -o ${BIN_DIR}/Hello ${OBJ_DIR}/Hello.o
#Fin prueba de concepto..

.PHONY= all fclean clean re makedirs tests