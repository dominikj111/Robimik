#define LENGTH_ARRAY(x)  (sizeof(x) / sizeof(x[0]))

#define SERIAL_OUT TXREG

#define LED RD4
#define LED_TRIS TRISD4

#define ON 0
#define OFF 1

#define INPUT 1
#define OUTPUT 0

#define BUTTON_L RD7
#define BUTTON_R RD6
#define BUTTON_L_TRIS TRISD7
#define BUTTON_R_TRIS TRISD6

#define SONAR_PIN RD5
#define SONAR_PIN_TRIS TRISD5

#define TX_TRIS TRISC6
#define RX_TRIS TRISC7


/* Podle zapojeni - pravy motor */
#define M2_TRIS TRISD0
#define M2_DIR RD0
#define CCP2_TRIS TRISC1

/* Podle zapojeni - levy motor */
#define M1_TRIS TRISD1
#define M1_DIR RD1
#define CCP1_TRIS TRISC2
