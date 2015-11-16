#include <pic.h>
#include "delay.h"
#include "macros.h"


typedef struct anModul {
    unsigned char DATA_H;
    unsigned char DATA_L;
}anModul;

struct anModul VOLTAGE;


unsigned char init_con = 0;

struct anModul *ANALOG_READ(void) {

    /* |ADCS1|ADCS0|CHS2|CHS1|CHS0|GO/nonDONE|x|ADON| */
    /* 1000 0000 */
    ADCON0 = 0x80;

    /* |ADFM|ADCS2|x|x|PCFG3|PCFG2|PCFG1|PCFG0| */
    /* 1100 1110 */
    ADCON1 = 0xce; //nastavi analog pouze pin AN0, ostatni jsou digitalni

    /*
     * ADCS2, ADCS1, ADCS0 - volba hodin A/D prevodniku
     * CHS2, CHS1, CHS0 - volba analogoveho kanalu
     * ADFM - volba vystupniho formatu
     * PCGF3, PCGF2, PCGF1, PCGF0 - konfigurace vyvodu ANn
     * ADON - 1 zapne prevodnik, 0 vypne prevodnik (nespotrebovava energii)
     *          nastaveni GP zapne prevod, pote se automaticky vynuluje
     * 
     */

    ADON = 1;
    DELAY_TIMER1_15uS();

    ADGO = 1;
    while(ADGO);

    ADON = 0;

    /*
     * Procesor je vybaven 10 bitovym prevodnikem, ktery meri hodnoty v rozsahu <0,1023>.
     *
     */

    VOLTAGE.DATA_H = ADRESH;
    VOLTAGE.DATA_L = ADRESL;

    return &VOLTAGE;
}

