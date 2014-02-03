/*
 * Setup
 *
 *
 * |||      |||
 * |||A||||B|||
 * |||C||||D|||
 *
 *
 * A - A5
 * B - GND
 * C - 3.3V
 * D - A4
 */

#include <Wire.h>
#include <ArduinoNunchuk.h>

ArduinoNunchuk nunchuk = ArduinoNunchuk();

void setup()
{
  Serial.begin(9600);
  nunchuk.init();
}

void loop()
{
  nunchuk.update();
  Serial.print(nunchuk.analogX, DEC);
  Serial.print(' ');
  Serial.print(nunchuk.analogY, DEC);
  Serial.print(' ');
  Serial.print(nunchuk.zButton, DEC);
  Serial.print(' ');
  Serial.println(nunchuk.cButton, DEC);
}
