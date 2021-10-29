int LED_BUILTIN = 2;

void setup()
{
Serial.begin(9600);
pinMode(LED_BUILTIN, OUTPUT); //pin 10 is set as output pin

}


void loop() // The loop function runs again and again
{
digitalWrite(LED_BUILTIN, HIGH); // Change the brightness of LED by 5 points
delay (1000);
digitalWrite (LED_BUILTIN, LOW); // Change the brightness of LED by 5 points
delay (1000);
Serial.print("blink motherfucker\n");
}
