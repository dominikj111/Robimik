#include <pic.h>
#include "macros.h"
#include "engine_modul.h"

unsigned int  OLD_LM_SPEED = 0;
unsigned char OLD_LM_DIR   = 0;

unsigned int  OLD_RM_SPEED = 0;
unsigned char OLD_RM_DIR   = 0;


void ENGINE_UPDATE(unsigned int LM_speed, unsigned char LM_dir,
                   unsigned int RM_speed, unsigned char RM_dir);

void STOP_ENGINE(){
    CCP1CON = 0x00; //reset CCP1
    CCP2CON = 0x00; //reset CCP2
    TMR2ON  = 0;    //vypnuti Timeru2
}

void START_ENGINE(){

    /* Nastaveni periody PWM zapsanim do registru PR2. */
    PR2 = 0xff;

    /* Nastaveni preddelicky TMR2 a aktivace Timeru2. */

    /*
     * Vyber preddelicky v T2CON.
     * 00 1: 1
     * 01 1: 4
     * 1x 1:16
     *
     */

    T2CKPS1 = 1;
    T2CKPS0 = 1;

    TMR2ON = 1;
}





void LEFT_ENGINE_UPDATE(unsigned int speed, unsigned char dir) {

    OLD_LM_SPEED = speed;
    OLD_LM_DIR   = dir;

    ENGINE_UPDATE(OLD_LM_SPEED, OLD_LM_DIR, OLD_RM_SPEED, OLD_RM_DIR);
}

void RIGHT_ENGINE_UPDATE(unsigned int speed, unsigned char dir){

    OLD_RM_SPEED = speed;
    OLD_RM_DIR   = dir;

    ENGINE_UPDATE(OLD_LM_SPEED, OLD_LM_DIR, OLD_RM_SPEED, OLD_RM_DIR);
}

void ENGINE_UPDATE(unsigned int LM_speed, unsigned char LM_dir,
                   unsigned int RM_speed, unsigned char RM_dir){

    STOP_ENGINE();

    CCP1_TRIS = OUTPUT;
    M1_TRIS   = OUTPUT;

    CCP2_TRIS = OUTPUT;
    M2_TRIS   = OUTPUT;

    
    /* Nastaveni pracovniho cyklu zapsanim do CCPR1L a CCP1CON<5:4>. */
    CCPR1L = (LM_speed >> 2);
    CCP1X  = (LM_speed & 2);
    CCP1Y  = (LM_speed & 1);

    /* Nastaveni pracovniho cyklu zapsanim do CCPR1L a CCP1CON<5:4>. */
    CCPR2L = (RM_speed >> 2);
    CCP2X  = (RM_speed & 2);
    CCP2Y  = (RM_speed & 1);

    /* Nastaveni smeru otaceni. */
    M1_DIR = LM_dir;

    /* Nastaveni smeru otaceni. */
    M2_DIR = RM_dir;



    /*
     * Nastaveni CCPx do rezimu PWM.
     *
     */

    /* Konfigurace modulu CCP1 jako PWM. */

    CCP1M3 = 1;
    CCP1M2 = 1;

    /* Konfigurace modulu CCP2 jako PWM. */

    CCP2M3 = 1;
    CCP2M2 = 1;
    

    START_ENGINE();
}


