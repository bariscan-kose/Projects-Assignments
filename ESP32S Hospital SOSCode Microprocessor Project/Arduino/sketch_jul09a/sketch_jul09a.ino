
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>
#include <BLEAdvertisedDevice.h>

#include <Arduino.h>
#if defined(ESP32)
  #include <WiFi.h>
#endif
#include <ESP_Mail_Client.h>

#define WIFI_SSID "ideaktif"
#define WIFI_PASSWORD "2017idea2017"

#define SMTP_HOST "smtp.live.com"
#define SMTP_PORT 587

/* The sign in credentials */
#define AUTHOR_EMAIL "ideaktif123@hotmail.com"
#define AUTHOR_PASSWORD "ideaktif2017"

/* Recipient's email*/
#define RECIPIENT_EMAIL "barisck98@gmail.com"


void setup()
{
  setup1();
  setup2();
}


void loop()
{
  loop1();
  loop2();
  Serial.print("\n ALL DONE \n");
  while(1){};
}
