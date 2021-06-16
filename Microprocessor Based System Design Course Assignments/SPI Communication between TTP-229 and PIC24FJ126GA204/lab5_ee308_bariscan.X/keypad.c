#include <xc.h>

unsigned char read_keypad(void)
{
        
    unsigned int i,j;
    unsigned int buffer;
    unsigned int result;
    result=16;
    
    
    while(!SPI1STATLbits.SPIRBF);
    if(SPI1STATLbits.SPIRBF)
    {  
        
        buffer = SPI1BUFL;
    }
    
    for (j = 0;j<16 ;j++ )
    {   
        unsigned int i = 1;
        i=i<<j;
        if((buffer & i)==0)
        {
            result = 15-j;
        }
    }
    
    IFS1bits.CNIF = 0;
    CNEN2bits.CN22IE = 1;   // re-enable CNint
    return(result);
}