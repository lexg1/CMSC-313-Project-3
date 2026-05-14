#include <stdio.h>
#include <ctype.h>

void hexDump(FILE *fileptr) {
    unsigned char buffer[16];
    unsigned int bytes_read = 0;
    long int address = 0;
    //Continously read from the file performing the following
    while ((bytes_read = fread(buffer, 1, 16, fileptr)) > 0) {
        //Print the address in hex
        printf("%08lx", address);
        printf(" ");

        //print the bytes in hex
        for (int i = 0; i < 16; i++) {
            if (i < bytes_read) printf("%02x ", buffer[i]);
            else printf("  ");
        }

        //Print the bytes in ascii
        printf(" |");
        for (unsigned int i = 0; i < bytes_read; i++) {
            (isprint(buffer[i]) == 0) ? printf(".") : printf("%c", buffer[i]);
        }
        printf("|\n");

        //Update the address for the next print
        address += bytes_read;
    }
    
}

int main() {

    //Open the file if possible, perform the hex dump, close the file
    FILE *fileptr = fopen("binary.out", "rb");
    if (!fileptr) {
        printf("Error in opening the file\n");
        return 1;
    }
    hexDump(fileptr);
    fclose(fileptr); 

    return 0;
}