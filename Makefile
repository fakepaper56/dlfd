CC = gcc
RM = rm -f
CFLAG = -D_GNU_SOURCE -shared -ldl -fPIC
DL = /tmp/fclose_check.so
TEST = test
CTEST = test.c
CFILE = fclose_check.c


all: $(DL) $(TEST)

$(DL): $(CFILE)
	$(CC) $(CFLAG) -o $(DL) $(CFILE)

$(TEST): $(CTEST)
	$(CC) -o $(TEST) $(CTEST)

.PHONY: clean
clean:
	$(RM) $(TEST) $(DL)
