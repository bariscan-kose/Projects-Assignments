#include "ee308.h"
#include "lcd.h"
//#include "keypad.h"

#include <stdlib.h>
#include <stdint.h>
//#include <stddef.h>
#include <xc.h>

#pragma config JTAGEN=OFF, FWDTEN = 0

const unsigned char LookUp[16] = "0123456789ABCDEF";
//volatile unsigned char LCD_data[2][16] = {"PIC24 Board v2.2", "Keyboard  -->   "};

unsigned char kbdflag = 0;

void __attribute__ ( ( __interrupt__ , auto_psv ) ) _T1Interrupt ( void )
{
    //LATAbits.LATA10 = ~LATAbits.LATA10;
    //LATA ^= 0x0200;     // bit 9 toggle
    IFS0bits.T1IF = 0 ;
}
void __attribute__ ( ( __interrupt__ , auto_psv ) ) _CNInterrupt ( void )
{
    if(PORTCbits.RC8==1)
    {
        kbdflag = 1;
        CNEN2bits.CN20IE = 0;
    }
    IFS1bits.CNIF = 0;
    
}

int randNum()
{
    CRYCONLbits.CRYON=1;
    //set the OPMOD<3:0> bits to 1010
    CRYCONLbits.OPMOD3=1;
    CRYCONLbits.OPMOD2=0;
    CRYCONLbits.OPMOD1=1;
    CRYCONLbits.OPMOD0=0;
    
    CRYCONLbits.CRYGO=1;
    int i;
    for( i = 0 ; i <20000;i++);
    if(CRYCONLbits.CRYGO==0)
    {
        int result= CRYTXTA;
        if(result < 0 ) result=result* (-1);
        result=result%7;
        return result;
    }
    return 0;
    
}


int main() {
    //unsigned char kbd;
    
    init_IO();
    init_timer();
    init_i2c();
    init_CNInt();
    init_lcd();
    
   
            
    while(1)
    {
        if(kbdflag)
        {
            int number1, number2;
            
            do{
                number1=randNum();
            } while(number1==0);            
            do{
                number2=randNum();
            } while(number2==0); 
                 
            
            kbdflag = 0;
            
            
            send_LCD_CMD(0xCD);
            send_LCD_DATA('0'+number1);
            send_LCD_CMD(0xCF);
            send_LCD_DATA('0'+number2);
            CNEN2bits.CN20IE=1;
        }
    }
}
