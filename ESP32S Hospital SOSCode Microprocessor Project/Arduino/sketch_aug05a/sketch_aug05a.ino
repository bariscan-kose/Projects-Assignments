
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>
#include <BLEAdvertisedDevice.h>
#include <BLEBeacon.h>

#include <HTTPClient.h>
#include <Arduino.h>
#if defined(ESP32)
  #include <WiFi.h>
#endif

#define ENDIAN_CHANGE_U16(x) ((((x)&0xFF00) >> 8) + (((x)&0xFF) << 8))

#define WIFI_SSID "ideaktif"
#define WIFI_PASSWORD "2017idea2017"

int scanTime = 3; //In seconds
BLEScan* pBLEScan;
BLEBeacon minBeacon;
BLEAdvertisedDevice minDevice;

class MyAdvertisedDeviceCallbacks: 
  public BLEAdvertisedDeviceCallbacks {
    void onResult(BLEAdvertisedDevice advertisedDevice) 
    {
      
      if (advertisedDevice.haveName())
      {
        Serial.print("Device name: ");
        Serial.println(advertisedDevice.getName().c_str());
        Serial.println("");
      }

      if (advertisedDevice.haveServiceUUID())
      {
        BLEUUID devUUID = advertisedDevice.getServiceUUID();
        Serial.print("Found ServiceUUID: ");
        Serial.println(devUUID.toString().c_str());
        Serial.println("");
      }
      else
      {
        if (advertisedDevice.haveManufacturerData() == true)
        {
          std::string strManufacturerData = advertisedDevice.getManufacturerData();

          uint8_t cManufacturerData[100];
          strManufacturerData.copy((char *)cManufacturerData, strManufacturerData.length(), 0);

          if (strManufacturerData.length() == 25 && cManufacturerData[0] == 0x4C && cManufacturerData[1] == 0x00)
          {
            Serial.println("Found an iBeacon!");
            BLEBeacon oBeacon = BLEBeacon();
            oBeacon.setData(strManufacturerData);
            Serial.printf("iBeacon Frame\n");
            Serial.printf("ID: %04X Major: %d Minor: %d UUID: %s Power: %d\n", oBeacon.getManufacturerId(), ENDIAN_CHANGE_U16(oBeacon.getMajor()), ENDIAN_CHANGE_U16(oBeacon.getMinor()), oBeacon.getProximityUUID().toString().c_str(), advertisedDevice.getRSSI());
            if( minDevice.getRSSI() < advertisedDevice.getRSSI() )
            {
              minDevice=advertisedDevice;
              minBeacon=oBeacon;
            }
            Serial.printf("Current best :  %d \n" , minDevice.getRSSI());
          }
        }
        return;
      }
     
   }
};

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
  const char* pminDevice = minDevice.getName().c_str();
  String minDeviceStr = String(pminDevice);
  int minMajor = ENDIAN_CHANGE_U16(minBeacon.getMajor());
  int minMinor = ENDIAN_CHANGE_U16(minBeacon.getMinor());
  Serial.printf("Min device Major %d, Min device Minor %d\n", minMajor, minMinor);
  Serial.printf("Closest Advertised Device: %s , Strength: %d \n", minDevice.toString().c_str(), minDevice.getRSSI(), "\n");
  Serial.println("Scan done!");
  pBLEScan->clearResults();   // delete results from BLEScan buffer to release memory
  
  if(minMajor == 10035 && minMinor == 56498)
  {
     minDeviceStr = "Alsancak Nevvar Salih Hospital Endocrinology Dept. Room 14"; 
  }
  else if (minMajor==8981 && minMinor==33684)
  {
     minDeviceStr = "Dokuz Eylul University Hospital Cardiology Dept. Room 3";
  }
  
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
  
  if(WiFi.status()== WL_CONNECTED){
      WiFiClient client;
      HTTPClient http;
    
      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName);

      // Specify content-type header
      http.addHeader("Content-Type", "application/x-www-form-urlencoded");
      // Data to send with HTTP POST
      
      String httpRequestData = "api_key=tPmAT5Ab3j7F9&emergencyLocation=";
      httpRequestData.concat(String(minDeviceStr));
      String httpRequestData3 = "&value1=24.25&value2=49.54&value3=1005.14"; 
      httpRequestData.concat(httpRequestData3);    
      Serial.printf("httpRequestData = %s \n", &httpRequestData);      
     
      // If you need an HTTP request with a content type: application/json, use the following:
      /*http.addHeader("Content-Type", "application/json");
      String httpRequestData = "{\"api_key\":\"tPmAT5Ab3j7F9\",\"emergencyLocation\":\"";
      httpRequestData.concat(String(minDeviceStr));
      String httpRequestData3 = "\",\"value1\":\"24.25\",\"value2\":\"49.54\",\"value3\":\"1005.14\"}";
      httpRequestData.concat(httpRequestData3);    
      Serial.printf("httpRequestData = %s \n", &httpRequestData);   */   
     
      // If you need an HTTP request with a content type: text/plain
      //http.addHeader("Content-Type", "text/plain");
      //int httpResponseCode = http.POST("Hello, World!");

       // Send HTTP POST request
      int httpResponseCode = http.POST(httpRequestData);
     
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
        
      // Free resources
      http.end();
    }
    else {
      Serial.println("WiFi Disconnected");
    }

}


void loop()
{
}
