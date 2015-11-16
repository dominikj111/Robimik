#include <pic.h>
#include "delay.h"
#include "macros.h"


typedef struct sonarModul{
      unsigned char DATA_H;
      unsigned char DATA_L;
}sonarModul;

struct sonarModul sonar;

struct sonarModul *GET_SONAR_DATA(void){

    /*
     * Podle dokumentace sonaru SRF05 je potreba pro mereni vzdalenosti
     * nastavit 3. pin na vysokou hodnotu na alespon 10 uS.
     * 
     * V uvedenem algoritmu nejdrive nastavime vystup procesoru (ktery
     * je propojen se 3. pinem sonaru) do nizkeho stavu a nastavime pin
     * jako vystupni.
     * Takto inicializujeme start algoritmu.
     * 
     * Pote nastavime pin do vysokeho stavu, pockame 15 uS a nakonec 
     * opet pin nastavime do nizkeho stavu.
     * 
     * Po kazde kdyz nastavujeme pin cekame 15 uS. Zkusenost rika, ze pokud
     * v uvedenem miste nepockame, algoritmus je nefunkcni.
     * 
     * To muze být zpusobeno tim, ze pameti v cipu jsou kapacitního charakteru 
     * a kondenzator je nutne pro ulození informace nechat nabit (Bc. Michal Benes).
     * 
     * Dle meho soudu to muze zpusobovat algoritmus naprogramovany v cipu sonaru.
     * Ten v nejakem cyklu kontroluje uroven na vstupech a pro spravne zaznamenani 
     * je dobre pockat.
     * 
     */

    SONAR_PIN = 0;
    SONAR_PIN_TRIS = OUTPUT;
    DELAY_TIMER1_15uS();


    SONAR_PIN = 1;
    DELAY_TIMER1_15uS();
    SONAR_PIN = 0;
    DELAY_TIMER1_15uS();

    /*
     * Jakmile sonar zaznamena vysokou uroven na 3. pinu na alespon 10 uS,
     * zapocne po prepnuti zpet na nizky stav mereni vzdalenosti.
     *
     * Podle dokumentace mame dost casu (700 uS) na prenastaveni vystupniho pinu.
     *
     */

    SONAR_PIN_TRIS = INPUT;

    /*
     * Po prenastaveni pinu procesoru nastavime timer 1 pro mereni vzdalenosti.
     * 
     * Sonar nastavi pin 3 do vysokeho stavu na 100 uS - 25 mS coz je doba,
     * za kterou zvuk urazi vzdalenost od sonaru k prekazce a zpet.
     *
     */

    TMR1H  = 0x00;
    TMR1L  = 0x00;
    T1CON  = 0x30;
    TMR1IF = 0;

    /*
     * Pockame nez sonar nastavi pin do vysokeho stavu, spustime timer
     * a ten zastavime jakmile sonar nastavi pin do nizkeho stavu.
     *
     * V registerch TMR1H a TMR1L je ulozena doba, ve ktere se pin nachazel
     * ve vysokem stavu.
     * 
     */

    while(!SONAR_PIN);
    TMR1ON = 1;
    while(SONAR_PIN);
    TMR1ON = 0;

    /*
     * Pro bezpecnost nastavime pin mezi sonarem a procesorem na vystup.
     * 
     */

    SONAR_PIN_TRIS = OUTPUT;

    /*
     * Pokud cekame dele jak 30 mS znamena to, ze prekazka nebyla detekovana.
     * Hodnota 0x24ff na TMR1 podle nastaveni odpovida 30830 uS.
     * Za tuto dobu zvuk urazi pres 10 m a sonar meri maximalen 4 m od prekazky,
     * tj. 8 metru pro drahu zvuku (rychlost zvuku predpokladama 344.8 m/s).
     * 
     * Minimalni hodnota, kterou podle dokumentace sonar posila je 100 uS a maximalni 25 mS.
     * 25  mS odpovida na timeru 7680 cyklum.
     * 100 uS odpovida na timeru 100 / 3.2552 (za 3.2552 uS se pricte do TRM1 1 bit), po zaokruhleni tedy 31 cyklum.
     * 
     * Z uvedeneho tak ziskame rozsah:
     *    100 uS    -     25 mS
     *     31 cyklu -   7680 cyklu
     *    101 uS    -     25 mS
     * 0x001f       - 0x1e00 
     *
     */

    sonar.DATA_H = TMR1H;
    sonar.DATA_L = TMR1L;


    /*
     * Pro dalsi pouziti sonaru musime podle dokumentace pockat alespon 50 mS
     * nez vyvolame dalsi trigger signal.
     *
     */
    
    DELAY_TIMER1_50mS();

    return &sonar;
}

