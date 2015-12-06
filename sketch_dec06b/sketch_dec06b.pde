/*  
 *  ------ Waspmote Pro Code Example -------- 
 *  
 *  Explanation: This is the basic Code for Waspmote Pro
 *  
 *  Copyright (C) 2013 Libelium Comunicaciones Distribuidas S.L. 
 *  http://www.libelium.com 
 *  
 *  This program is free software: you can redistribute it and/or modify  
 *  it under the terms of the GNU General Public License as published by  
 *  the Free Software Foundation, either version 3 of the License, or  
 *  (at your option) any later version.  
 *   
 *  This program is distributed in the hope that it will be useful,  
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of  
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the  
 *  GNU General Public License for more details.  
 *   
 *  You should have received a copy of the GNU General Public License  
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.  
 */
     
// Put your libraries here (#include ...)
// Include WIFI library 
#include <WaspWIFI.h>
int counter = 0;
int wifi_result = 0;
//WiFi sockets
uint8_t socket=SOCKET0;
uint8_t socket1=SOCKET1;

void switchWifi() {
    if( WIFI.ON(socket) == 1 ) {    
      USB.println(F("WiFi switched ON on socket 0"));
      wifi_result = 1;
    }else if(WIFI.ON(socket1) == 1) {
      USB.println(F("WiFi switched ON on socket 1"));
      wifi_result = 1;
    }else{
      USB.println(F("WiFi is off. Secure connections if they seems to be present")); 
    }
}

void wifiInfo() {
   if (wifi_result == 1) {
    // Displays connection status.  
    USB.println(F("\nFirmware Version:"));
    WIFI.getVersion();
   
    USB.println(F("Connection Info:"));
    WIFI.getConnectionInfo();
   }  else {
    USB.println(F("Wifi is not ON, there is no status to check")); 
   }
}
void setup() {
    // put your setup code here, to run once:
    // Open the USB connection
    USB.ON();
    USB.print("Test number 1\n");
    switchWifi();
    if(wifi_result == 1){
      USB.println(F("Resetting WiFI to Default values..."));
      WIFI.resetValues();
    }  
    USB.println(F("Setup done"));
    
    
}


void loop() {
  wifiInfo();
  
  USB.print(F("Battery: "));
  USB.print((PWR.getBatteryLevel(),DEC));
  USB.print(F(" %"));
  

  USB.print(F("\nFree memory: "));
  USB.print(freeMemory());
  USB.print(F(" %\n"));  
  
  
  delay(5000);
}

