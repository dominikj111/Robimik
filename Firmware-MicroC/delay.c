#include <pic.h>

#include "delay.h"

void DELAY_TIMER1_10mS(void) {

    /* 10 ms
    #asm


    CLRW
    ADDLW   0xf4
    MOVWF   _TMR1H          //TMR1H  = 0xfe;

    CLRW
    ADDLW   0x03
    MOVWF   _TMR1L          //TMR1L  = 0xe0;

    CLRW
    MOVWF   _TMR1IF         //TMR1IF = 0x00;

    CLRW
    ADDLW   0x30
    MOVWF   _T1CON          //T1CON  = 0x30;

    BSF     _T1CON, 0x00    //TMR1ON = 1; //TIMER1_START();

        

    WHILELOOP:
       BTFSS    _PIR1, 0x00 //TMR1IF
       GOTO     WHILELOOP


    BCF     _T1CON, 0x00    //TMR1ON = 0; //TIMER1_STOP();

    NOP
    NOP
    NOP

    #endasm
    */

    TMR1H  = 0xf4;
    TMR1L  = 0x03;
    TMR1IF = 0;

    T1CON = 0x30;

    TMR1ON = 1;
    while(!TMR1IF);
    TMR1ON = 0;

}

void DELAY_TIMER1_50mS(void){

    TMR1H  = 0xc4;
    TMR1L  = 0x03;
    TMR1IF = 0;

    T1CON = 0x30;

    TMR1ON = 1;
    while(!TMR1IF);
    TMR1ON = 0;

}

void DELAY_TIMER1_x10mS(int x){
    for(;x>0;--x){
        DELAY_TIMER1_10mS();
    }
}

void DELAY_TIMER1_1S(void){

    int x = 100;

    for(;x>0;--x){
        DELAY_TIMER1_10mS();
    }
}

void DELAY_TIMER1_xS(int x){
    
    for(;x>0;--x){
        DELAY_TIMER1_1S();
    }
}

void DELAY_TIMER1_15uS(void){

    TMR1H  = 0xff;
    TMR1L  = 0xfe;
    TMR1IF = 0;

    T1CON = 0x20;

    TMR1ON = 1;
    while(!TMR1IF);
    TMR1ON = 0;

    asm("NOP");
    asm("NOP");
    asm("NOP");
    asm("NOP");
    asm("NOP");
    asm("NOP");
}
