# WKC Lite (Walking Kiger Camera Lite)

# ![WKCLite_Logo](./WKCLite.svg)

[简体中文](./README_CN.md)

An analog binocular kigurumi vision enhancemnent project based on ESP32-S3 module and AGRV2KQ32 CPLD/FPGA.

## Features
* I2S-based dual OSD display
* Driving peripherals such as fan, glowing eye and lock (lock may need to be designed and ported by users)
* External capture card output
* ~~Camera capture~~ (still under development)
* BLE-Based communication protocol

## Usage
* For ESP32-S3 code, build with ESP-IDF 6.x.
* For Verilog code, compile with [AGM Supra](https://www.agmcn.com/developer/tool/) and flash through 3-pin programming port (TCK, TMS, GND) with [AGM DAP-LINK](https://www.agmcn.com/doc/6878.html).

## Notice
* Camera capture is not fully implemented yet, and the related circuits don't need to be soldered.
* It's recommended to use PAL format camera because of the higher resolution.
* It's recommended to take some anti-moisture precautions to keep the circuitry stable.
* Communication protocol does not use BLE native pairing method for the convenience of mobile phone operation. See `main/protocol`.

## TODO
- [ ] Implement camera capture
- [ ] Improve the protocol and add support for shortcut and settings table

## License
Verilog code `verilog/` and resource generator `resgen/` are under **MIT license**, the rest of code is under **GNU GPL v3.0**. Third-party components retain their respactive licenses.
* [esp32-camera](https://github.com/espressif/esp32-camera) → **Apache License Version 2.0**
* [esp_new_jpeg](https://github.com/espressif/esp-adf-libs/blob/master/esp_new_jpeg) → **MIT License**
* [littlefs](https://github.com/littlefs-project/littlefs) → **BSD-3-Clause license**
* [cJSON](https://github.com/DaveGamble/cJSON) → **MIT License**