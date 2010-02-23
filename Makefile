#CC=arm-linux-gnueabi-gcc
#CFLAGS= -march=armv4t -mtune=arm920t -DCPU_ARM -I . -g 
CFLAGS=-g
LDLIBS = -lmad -lao -lts -L. -lwma
SRC=minipod.c fbutils.c font_8x8.c font_8x16.c minimad.c songlist.c wma.c
OBJ=$(SRC:.c=.o)
WMA_SRC=$(addprefix libwma/,bitstream.c  wmadeci.c  wmafixed.c mdct.c mdct_lookup.c fft-ffmpeg.c asf.c)

minipod: libwma.a $(OBJ)

libwma.a: libwma.a($(WMA_SRC:.c=.o))


clean: 
	-rm *.o minipod libwma/*.o libwma.a


