
int scanTime = 3; //In seconds
BLEScan* pBLEScan;
BLEAdvertisedDevice minDevice;

class MyAdvertisedDeviceCallbacks: public BLEAdvertisedDeviceCallbacks {
    void onResult(BLEAdvertisedDevice advertisedDevice) {
      
      if(advertisedDevice.getName() == "BLE Device") 
      {
       if( minDevice.getRSSI() < advertisedDevice.getRSSI() )
       {
          minDevice=advertisedDevice;
       }
       Serial.printf("Advertised Device: %s , Strength: %d \n", advertisedDevice.toString().c_str(), advertisedDevice.getRSSI(), "\n");
       Serial.printf("Current best :  %d \n" , minDevice.getRSSI());
     }
   }
};

void setup1() {
  Serial.begin(115200);
  Serial.println("Scanning...");

  BLEDevice::init("BLE Scanner of Banana");
  pBLEScan = BLEDevice::getScan(); //create new scan
  pBLEScan->setAdvertisedDeviceCallbacks(new MyAdvertisedDeviceCallbacks());
  pBLEScan->setActiveScan(true); //active scan uses more power, but get results faster
  pBLEScan->setInterval(100);
  pBLEScan->setWindow(99);  // less or equal setInterval value
}

void loop1() {
  // put your main code here, to run repeatedly:
  BLEScanResults foundDevices = pBLEScan->start(scanTime, false);
  Serial.print("Devices found: ");
  Serial.println(foundDevices.getCount());
  Serial.printf("Closest Advertised Device: %s , Strength: %d \n", minDevice.toString().c_str(), minDevice.getRSSI(), "\n");
  Serial.println("Scan done!");
  pBLEScan->clearResults();   // delete results from BLEScan buffer to release memory
  delay(2000);
  
}
