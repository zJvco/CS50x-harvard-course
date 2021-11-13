#include <stdio.h>
#include <stdlib.h>
#include <stdint.h> 
#include <cs50.h>

int main(int argc, char *argv[])
{
    if (argc != 2) {
        printf("Usage: ./recover image\n");
        return 1;
    }
    
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        return 1;
    }
    
    const int BLOCK_SIZE = 512;
    
    typedef uint8_t BYTE;
    BYTE buffer[BLOCK_SIZE];
    bool found = false;
    int c = 0;
    
    FILE *outfile;
    
    while(fread(buffer, sizeof(BYTE), BLOCK_SIZE, file) != 0) {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0) {
            if (!found) {
                found = true;
            }
            else {
                fclose(outfile);
            }
            
            char fname[8];
            sprintf(fname, "%03i.jpg", c++);
            outfile = fopen(fname, "w");
            if (outfile == NULL) {
                return 1;
            }
            fwrite(buffer, BLOCK_SIZE, 1, outfile);
        }
        else if (found) {
            fwrite(buffer, BLOCK_SIZE, 1, outfile);
        }
    }
    fclose(outfile);
    fclose(file);
}