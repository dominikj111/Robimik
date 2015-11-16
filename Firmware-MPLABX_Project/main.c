#include <stdio.h>
#include <stdlib.h>
#include <pic.h>

#include "macros.h"
#include "delay.h"

#include "sonar_modul.h"
#include "analog_modul.h"
#include "bluetooth_modul.h"
#include "engine_modul.h"

#include "routines.h"

//#pragma config CP=OFF, WRT=OFF, CPD=OFF, LVP=OFF, BOREN=OFF, PWRTE=ON, WDTE=OFF, FOSC=HS //0xff32
__CONFIG(0x3f32);

bank1 struct sonarModul SONAR = {0, 0};
bank1 struct anModul VOLTMETER = {0, 0};

unsigned char UPDATE_COUNT = 0;
unsigned char UPDATE_VOLTMETER = 0;
unsigned char UPDATE_SONAR = 0;

//unsigned char messTotaCountButtonsChange = 5;
//unsigned char messCurrCountButtonsChange = 5;
unsigned char beforeButtonStates;
unsigned char currenButtonStates;

void read_data(unsigned char);

void read_data(unsigned char prijata_data){

        /*
	      |xxx|UPDATE_SONAR|UPDATE_VOLTMETER|LED|00|
	      Obslou?en� po?adavku na aktualizaci m??en�ch dat.
	*/
	if((prijata_data & 0b00000011) == 0x00){
            /* LED */
            LED = !((prijata_data >> 2) & 0b00000001);

            /* UPDATE VOLTMETER */
            UPDATE_VOLTMETER = ((prijata_data >> 3) & 0b00000001);

            /* UPDATE SONAR */
            UPDATE_SONAR = ((prijata_data >> 4) & 0b00000001);


            /* UPDATE COUNT */
            UPDATE_COUNT = ((prijata_data >> 5) & 0b00000111);

            return;
	}

        /*
	      |ML_SPEED|ML_DIRECTION|01|
	      Nastaven� stavu lev�ho motoru.
	*/
	if((prijata_data & 0b00000011) == 0x01){
            //nastaveni pwm
            unsigned char dir   = ((prijata_data & 0b00000100) == 4) ? L_MOTOR_BACK : L_MOTOR_FORW;
            unsigned int  speed = ((prijata_data & 0b11111000) >> 3) * 33; // speed(0-31) * 1023 / 31

            LEFT_ENGINE_UPDATE(speed, dir);
	}

	/*
	      |MR_SPEED|MR_DIRECTION|10|
	      Nastaven� stavu prav�ho motoru.
	*/
	if((prijata_data & 0b00000011) == 0x02){
            //nastaveni pwm
            unsigned char dir   = ((prijata_data & 0b00000100) == 4) ? R_MOTOR_BACK : R_MOTOR_FORW;
            unsigned int  speed = ((prijata_data & 0b11111000) >> 3) * 33; // speed(0-31) * 1023 / 31

            RIGHT_ENGINE_UPDATE(speed, dir);
	}

        /*
         *    0x03
         *    |111111|11|
         * Na byte 0xFF nelze reagovat v uspokojiv� rychlosti.
         * P?i odesl�n� zp?t do PC trv� reakce velmi dlouho.
         */
}


int main(int argc, char** argv) {

        BUTTON_L_TRIS = INPUT;
        BUTTON_R_TRIS = INPUT;

        LED_TRIS = OUTPUT;
        LED = OFF;

        BLUETOOTH_INIT();


        while(1){

//            if(LED == ON){LED = OFF;} else {LED = ON;}
//            DELAY(200);

//            UPDATE_SONAR = 1;

            if(UPDATE_SONAR){SONAR = *GET_SONAR_DATA();}
            if(UPDATE_VOLTMETER){VOLTMETER = *ANALOG_READ();}
            currenButtonStates = prepareButtons(!BUTTON_L, !BUTTON_R);


//            if(beforeButtonStates != currenButtonStates){
//                messCurrCountButtonsChange = messTotaCountButtonsChange;
//            } else {
//                messCurrCountButtonsChange--;
//            }

            SENDData(UPDATE_SONAR,                    &SONAR,
                     UPDATE_VOLTMETER,                &VOLTMETER,
                     beforeButtonStates != currenButtonStates, currenButtonStates);

            UPDATE_SONAR = 0;
            UPDATE_VOLTMETER = 0;
            beforeButtonStates = currenButtonStates;


//            messCurrCountButtonsChange = (messCurrCountButtonsChange == 0) ? messTotaCountButtonsChange : messCurrCountButtonsChange;

//            if(UPDATE_COUNT <= 0){
//                UPDATE_COUNT     = 0;
//                UPDATE_SONAR     = 0;
//                UPDATE_VOLTMETER = 0;
//            } else {
//               --UPDATE_COUNT;
//            }
        }
}


void interrupt isr(){
	/*
		Pokud jsou data p?ijata, nastav� se p?�znak RCIF.
	*/
	if(RCIF){
		/*
			Pokud je OERR nastaven, tak do?lo k potla?en� p?enosu dat z registru
			RSR do RCREG.
		*/
		if(!OERR){

			/*
				Framing Error bit (FERR) je nastaven pokud nedo?lo k detekov�n� stop bitu.
				Tento bit nebr�n� nijak v ?innosti p?ij�ma?e,
				je d?le?it� jen pro u?ivatele.

				Bit FERR i p?�padn� dev�t� bit mus� b�t p?e?teny d?�ve ne?
				je p?e?ten RCREG registr,
				jinak se p?ep�?e nov�mi hodnotami nov? p?ijat�ho slova.
			*/
			if(!FERR){
				unsigned char prijata_data;
				prijata_data = RCREG;

				/*
  					Metoda read_data p?�jme char a vyhodnot� po?adovan� stav robota.
				*/

				read_data(prijata_data);
                                
//                                while(!TRMT);
//                                SERIAL_OUT = prijata_data;

			}
			else{
				/*
				      Nedo?lo k tedekov�n� stop bitu.
				      Pokud tak nastane v�cekr�t, po?�ta? by m?l po?adovat synchronizaci.
				*/
			}

                        /* P?e?teme RCREG pro vy?i?t?n�. */
                        unsigned char rubbish;
                        rubbish = RCREG;

		}
		else{
			/*
				Pokud nastala chyba, restartujeme komunika?n� modul.
			*/
			BLUETOOTH_RESTART();
		}
	}
}

