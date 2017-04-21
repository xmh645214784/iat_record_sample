#common makefile header

DIR_INC = ./include
DIR_BIN = ./bin
DIR_LIB = ./libs
DIR_SRC = ./src

TARGET	= iat_record_sample
BIN_TARGET = $(DIR_BIN)/$(TARGET)

CROSS_COMPILE = 
CFLAGS = -g -Wall -I$(DIR_INC)
LINUX64=1

#可根据实际需要修改，选择所需平台SDK，默认为x64或x86平台。
ifdef LINUX64
LDFLAGS := -L$(DIR_LIB)/x64
else
LDFLAGS := -L$(DIR_LIB)/x86 
endif

LDFLAGS += -lmsc -lrt -ldl -lpthread -lasound

CSRCFILES := $(shell find $(src) -name "*.c")

OBJECTS := $(CSRCFILES:$(DIR_SRC)/%.c=$(DIR_BIN)/%.o)

$(BIN_TARGET) : $(OBJECTS)
	echo $(CSRCFILES)
	$(CROSS_COMPILE)gcc $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(DIR_BIN)/%.o : $(DIR_SRC)/%.c
	$(CROSS_COMPILE)gcc -c $(CFLAGS) $< -o $@

clean:
	@rm -f $(OBJECTS) $(BIN_TARGET)


.PHONY:clean

#common makefile foot
