# WKC Lite (Walking Kiger Camera Lite)

# ![WKCLite_Logo](./WKCLite.svg)

[简体中文](./README_CN.md)

An analog binocular kigurumi vision enhancemnent project based on ESP32-S3 module and AGRV2KQ32 CPLD/FPGA.

## Features
* I2S-based dual OSD display
* Driving peripherals such as fan, glowing eye and lock (lock may need to be designed and ported by users)
* External capture card output
* SAA7113-based Camera capture
* BLE-Based communication protocol

## Video Introduction (Chinese)
* [https://www.bilibili.com/video/BV1TD3Y6qEnB](https://www.bilibili.com/video/BV1TD3Y6qEnB)

## Usage
* For ESP32-S3 code, build with ESP-IDF 6.x.
* For Verilog code, compile with [AGM Supra](https://www.agmcn.com/developer/tool/) and flash through 3-pin programming port (TCK, TMS, GND) with [AGM DAP-LINK](https://www.agmcn.com/doc/6878.html). The device and the programmer need to be connected to the same computer.

## Notice
* It's recommended to use PAL format camera because of the higher resolution. For the headset, it's better to choose one with a good deinterlacing feature.
* It's recommended to take some anti-moisture precautions to keep the circuitry stable. **Otherwise, you might run into situations including, but not limited to,** things like the screen suddenly dimming, flipping, or the time information not being saved. If the screen image flips unexpectedly, you can try pressing the menu button multiple times in brightness adjustment mode to manually flip it back.
* Communication protocol does not use BLE native pairing method for the convenience of mobile phone operation. See `main/protocol`.

## Known Issues
* The accuracy of battery level detection is relatively limited, so if needed, you can measure it yourself and adjust the detection threshold.

## TODO
- [x] Implement camera capture
- [x] Improve the protocol and add support for shortcut and settings table
- [ ] Digital camera input

## License
Verilog code `verilog/` and resource generator `resgen/` are under **MIT license**, the rest of code is under **GNU GPL v3.0**. Third-party components retain their respactive licenses.

### Third-party
* The default binary icon and font files are derivative works: \
  Icons: [Material Design Icons](https://github.com/google/material-design-icons) → **Apache License Version 2.0**, see `NOTICE` \
  Fonts: [Source Han Sans](https://github.com/adobe-fonts/source-han-sans) → **OFL-1.1**, see `NOTICE` \
  Full license texts are located in `third_party/`

* [esp32-camera](https://github.com/espressif/esp32-camera) → **Apache License Version 2.0**
* [esp_new_jpeg](https://github.com/espressif/esp-adf-libs/blob/master/esp_new_jpeg) → **MIT License**
* [littlefs](https://github.com/littlefs-project/littlefs) → **BSD-3-Clause license**
* [cJSON](https://github.com/DaveGamble/cJSON) → **MIT License**