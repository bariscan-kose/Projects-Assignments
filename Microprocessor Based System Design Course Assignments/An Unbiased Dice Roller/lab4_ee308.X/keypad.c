#include <xc.h>

unsigned char read_keypad(void)
{
    int i;
    unsigned char j, result;
    
    result = 16;
    
    for (i = 0 ; i < 1000 ; i++);
    for (j=0; j<16; j++)
    {
        LATCbits.LATC4 = 0;
        for (i = 0 ; i < 100 ; i++);
        if (PORTBbits.RB8==0) result = j;
        LATCbits.LATC4 = 1;
    }
    for (i = 0 ; i < 10000 ; i++);

    IFS1bits.CNIF = 0;
    CNEN2bits.CN22IE = 1;   // re-enable CNint
    return(result);
}