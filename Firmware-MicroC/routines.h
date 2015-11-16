void SENDData(unsigned char UPDATE_SONAR,     struct sonarModul *SONO,
              unsigned char UPDATE_VOLTMETER, struct anModul    *VOLT,
              unsigned char UPDATE_BUTTONS,   unsigned char     BTSValue);

unsigned char prepareButtons(unsigned char, unsigned char);