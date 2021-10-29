
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>
#include <BLEAdvertisedDevice.h>

// Designed by : Barışcan Köse & Anıl Karahan 

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
#define AUTHOR_EMAIL "ideaktif1234@hotmail.com"
#define AUTHOR_PASSWORD "ideaktif2017"

/* Recipient's email*/
#define RECIPIENT_EMAIL "barisck98@gmail.com"

/* The SMTP Session object used for Email sending */
SMTPSession smtp;

/* Callback function to get the Email sending status */
void smtpCallback(SMTP_Status status);

int scanTime = 3; //In seconds
BLEScan* pBLEScan;
BLEAdvertisedDevice minDevice;

class MyAdvertisedDeviceCallbacks: 
  public BLEAdvertisedDeviceCallbacks {
    void onResult(BLEAdvertisedDevice advertisedDevice) {
      
      
       if( minDevice.getRSSI() < advertisedDevice.getRSSI() )
       {
          minDevice=advertisedDevice;
       }
       //Serial.printf("Advertised Device: %s , Strength: %d \n", advertisedDevice.toString().c_str(), advertisedDevice.getRSSI(), "\n");
       Serial.printf("Current best :  %d \n" , minDevice.getRSSI());
     
   }
};

/* Callback function to get the Email sending status */
void smtpCallback(SMTP_Status status){
  /* Print the current status */
  Serial.println(status.info());

  /* Print the sending result */
  if (status.success()){
    Serial.println("----------------");
    ESP_MAIL_PRINTF("Message sent success: %d\n", status.completedCount());
    ESP_MAIL_PRINTF("Message sent failled: %d\n", status.failedCount());
    Serial.println("----------------\n");
    struct tm dt;

    for (size_t i = 0; i < smtp.sendingResult.size(); i++){
     
      SMTP_Result result = smtp.sendingResult.getItem(i);
      time_t ts = (time_t)result.timestamp;
      localtime_r(&ts, &dt);

      ESP_MAIL_PRINTF("Message No: %d\n", i + 1);
      ESP_MAIL_PRINTF("Status: %s\n", result.completed ? "success" : "failed");
      ESP_MAIL_PRINTF("Date/Time: %d/%d/%d %d:%d:%d\n", dt.tm_year + 1900, dt.tm_mon + 1, dt.tm_mday, dt.tm_hour, dt.tm_min, dt.tm_sec);
      ESP_MAIL_PRINTF("Recipient: %s\n", result.recipients);
      ESP_MAIL_PRINTF("Subject: %s\n", result.subject);
    }
    Serial.println("----------------\n");
    
  }
}



void setup()
{

  Serial.begin(115200);
  Serial.println("Scanning...");

  BLEDevice::init("BLE Scanner of Banana");
  pBLEScan = BLEDevice::getScan(); //create new scan
  pBLEScan->setAdvertisedDeviceCallbacks(new MyAdvertisedDeviceCallbacks());
  pBLEScan->setActiveScan(true); //active scan uses more power, but get results faster
  pBLEScan->setInterval(100);
  pBLEScan->setWindow(99);  // less or equal setInterval value
  Serial.println("Did the BLE Setup.");

   BLEScanResults foundDevices = pBLEScan->start(scanTime, false);
  Serial.print("Devices found: ");
  Serial.println(foundDevices.getCount());
  const char* minDeviceStr = minDevice.getName().c_str();
  Serial.printf("Closest Advertised Device: %s , Strength: %d \n", minDevice.toString().c_str(), minDevice.getRSSI(), "\n");
  Serial.println("Scan done!");
  pBLEScan->clearResults();   // delete results from BLEScan buffer to release memory
  
  Serial.println();
  Serial.print("Connecting to AP");
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  while (WiFi.status() != WL_CONNECTED){
    Serial.print(".");
    delay(200);
  }
  Serial.println("");
  Serial.println("WiFi connected.");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  /** Enable the debug via Serial port
   * none debug or 0
   * basic debug or 1
  */
  smtp.debug(1);

  /* Set the callback function to get the sending results */
  smtp.callback(smtpCallback);

  /* Declare the session config data */
  ESP_Mail_Session session;

  /* Set the session config */
  session.server.host_name = SMTP_HOST;
  session.server.port = SMTP_PORT;
  session.login.email = AUTHOR_EMAIL;
  session.login.password = AUTHOR_PASSWORD;
  session.login.user_domain = "";

  /* Declare the message class */
  SMTP_Message message;

  /* Set the message headers */
  message.sender.name = "ESP";
  message.sender.email = AUTHOR_EMAIL;
  message.subject = "ESP Test Email";
  message.addRecipient("Sara", RECIPIENT_EMAIL);

  /*Send HTML message*/
  String htmlMsg = "<div style=\"color:#2f4468;\"><h1>There is a SOSCode emergency in the ";
  String htmlMsg3= ". Send immediate help!</h1><p>- Sent from Ideaktif SOSCode Emergency Service</p></div>";
  htmlMsg.concat(String(minDeviceStr));
  htmlMsg.concat(htmlMsg3);
  Serial.printf("HTMLMSG = %s \n", &htmlMsg);
  message.html.content = htmlMsg.c_str();
  message.text.charSet = "us-ascii";
  message.html.transfer_encoding = Content_Transfer_Encoding::enc_7bit;


  /* Set the custom message header */
  //message.addHeader("Message-ID: <abcde.fghij@gmail.com>");

  /* Connect to server with the session config */
  if (!smtp.connect(&session))
    return;

  /* Start sending Email and close the session */
  if (!MailClient.sendMail(&smtp, &message))
    Serial.println("Error sending Email, " + smtp.errorReason());
}


void loop()
{
}
