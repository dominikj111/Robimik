#include <pic.h>
#include <math.h>
#include "macros.h"

#include "sonar_modul.h"
#include "analog_modul.h"

void odesliData1(unsigned char pole[], unsigned char delkaPole);
void odesliData2(unsigned char);

unsigned char protokol[5];
unsigned char beforeButtons;

void SENDData(unsigned char UPDATE_SONAR,     struct sonarModul *SONO,
              unsigned char UPDATE_VOLTMETER, struct anModul    *VOLT,
              unsigned char UPDATE_BUTTONS,   unsigned char     BTSValue){

    if(!UPDATE_SONAR && !UPDATE_VOLTMETER && !UPDATE_BUTTONS){return;}

//    if(UPDATE_SONAR){
//        int sonarIN  = ((*SONO).DATA_H << 8) + (*SONO).DATA_L;
//
//        /*
//         * Sonar potrebuje pro sve mereni maximalne 13 bitu a maximalni nadsazena hodnota je
//         * 0x1fff (8191 -> 26 [ms])
//         */
//
//        sonarIN = (sonarIN > 0x1fff) ? 0x1fff : sonarIN;
//
//        int sonarOUT = (int)round(sonarIN * 0.00769137); //odesilame hodnotu 0-63
//        odesliData2((sonarOUT << 2) + 0x01);
//    }
//
//    if(UPDATE_VOLTMETER){
//        int voltmIN = ((*VOLT).DATA_H << 8) + (*VOLT).DATA_L;
//        int voltmOUT = (int)round(voltmIN * 0.06158358);
//        odesliData2((voltmOUT << 2) + 0x02);
//    }
//
//    if(UPDATE_BUTTONS && (beforeButtons != BTSValue)){
//        odesliData2(((BTSValue) << 2) + 0x03);
//        beforeButtons = BTSValue;
//    }
    
      /* P?vodn� protokol pro odes�l�n� dat. */

      protokol[0] = (*SONO).DATA_H; //hodnota 0x00 - 0x24
      protokol[1] = (*SONO).DATA_L; //hodnota 0x00 - 0xff
      protokol[2] = (*VOLT).DATA_H; //hodnota 0x00 - 0x03
      protokol[3] = (*VOLT).DATA_L; //hodnota 0x00 - 0xff
      protokol[4] = BTSValue;
      
      odesliData1(protokol, LENGTH_ARRAY(protokol));
}



unsigned char prepareButtons(unsigned char BTL, unsigned char BTR){
//      return ((BTL&0b00000001) << 4) + (BTR&0b00000001);

    /* Testovani binarni aritmetiky */
//      if((((((BTL&0x01) << 1) + (BTR&0x01)) << 2) + 0x03) == 0x0b){LED = ON;}
//      else {LED = OFF;}

//      return (( BTL&0x01) << 1) +  BTR&0x01;
      return (((BTL&0x01) << 1) + (BTR&0x01));
//      return (BTL << 4) + (BTR);
}




void odesliData1(unsigned char pole[], unsigned char delkaPole){

     /*
		Registr TRMT indikuje stav registru TSR pro vys�l�n� dat.
		TRMT = 1 <=> TSR je pr�zdn�
		TRMT = 0 <=> TSR je pln�
      */

      int index;
      for(index = 0;index<delkaPole;index++){
            while(!TRMT);
            SERIAL_OUT = pole[index];
      }

//      while(!TRMT);
//            SERIAL_OUT = 0x00;

      for(index = 0;index<5;index++){
            while(!TRMT);
            SERIAL_OUT = 0xff;
      }
}

void odesliData2(unsigned char data){
    while(!TRMT);
    SERIAL_OUT = data;
}


