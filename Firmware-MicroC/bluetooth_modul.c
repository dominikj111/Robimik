#include <pic.h>
#include "macros.h"
#include "delay.h"

void BLUETOOTH_RESTART(void){

	SPEN = 0; // zakaz funkce serioveho portu
        CREN = 0; // zakaz kontinualniho prijmu

        DELAY_TIMER1_15uS();

	SPEN = 1; // povoleni funkce serioveho portu
	CREN = 1; // povoleni kontinualniho prijmu
}

void BLUETOOTH_INIT(void){

    TX_TRIS = OUTPUT;
    RX_TRIS = INPUT;

    //TXSTA slouzi jako stavovy a ovladaci registr vysilace.
    TX9 = 0;  // 8 bitovy prenos dat.
    TXEN = 1; // Povoleni vysilani.
    SYNC = 0; // Vyber rezimu 0 => asynchronni rezim.
    BRGH = 0; // Vyber prenosove rychlosti 0 => nizsi rychlost.

    //RXSTA slouzi jako stavovy a ovladaci registr prijimace.
    SPEN = 1; // Povoleni funkce serioveho portu.
    RX9 = 0;  // 8 bitovy prenos dat.
    CREN = 1; // Povoleni kontinualniho prijmu.

    //SPBRG urcuje periodu volne beziciho 8bitoveho citace.
    SPBRG = 15; // Jestli�e BRGH=1, pak SPBRG = 63 (odpovida pro Baud Rate 9600).

    /*
     * Inicializace USART preruseni.
     */

    RCIE = 1;
    GIE = 1;
    PEIE = 1;
}

