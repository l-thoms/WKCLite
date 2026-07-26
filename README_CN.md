# WKC Lite (娃眼·青春版)

# ![WKCLite_Logo](./WKCLite.svg)

[English](./README.md)

基于 ESP32-S3 模块及 AGRV2KQ32 FPGA/CPLD 的模拟 Kigurumi 双目视野增强方案。

## 功能
* 基于 I2S 的双屏 OSD 显示
* 支持驱动风扇、发光眼及头壳锁等外设 (头壳锁可能需要自行设计与适配)
* 外置采集卡通道输出
* 基于 SAA7113 的拍照功能
* 基于 BLE 的通信协议

## 使用方法
* 对于 ESP32-S3 的代码，使用 ESP-IDF 6.x 编译。
* 对于 Verilog 代码，使用 [AGM Supra](https://www.agmcn.com/developer/tool/) 编译，并通过主板上的 3-pin 烧录口 (TCK、TMS、GND) 连接 [AGM DAP-LINK](https://www.agmcn.com/doc/6878.html) 烧录。板子和烧录器需连接到同一台电脑。

## 使用提醒
* 摄像头建议使用 PAL 制式，清晰度更高；头显建议选择反交错功能好一点的。
* 头壳久戴可能会产生大量水汽，为保证电路稳定，建议做好防潮措施。**否则可能会出现包括但不限于以下状况**：如屏幕亮度突然变暗、翻转，时间信息无法保存等。若屏幕图像意外翻转，可尝试在亮度调节模式中连按多次菜单键手动翻转。
* 考虑到手机端操作的便捷性，通信协议未使用 BLE 原生配对方法，详见 `main/protocol/`。

## 已知问题
* 电池电量检测精度相对有限，若有需要可自行测量并调整检测阈值。

## 开发计划
- [x] 实现拍照功能
- [ ] 改进通信协议，增加对快捷操作与设置列表的支持
- [ ] 数字摄像头输入

## 许可证
Verilog 代码 `verilog/` 及资源生成代码 `resgen/` 采用 **MIT** 许可证，其余代码采用 **GNU GPL v3.0** 许可证。第三方组件保留原始许可。
* [esp32-camera](https://github.com/espressif/esp32-camera)，采用 **Apache License Version 2.0** 许可。
* [esp_new_jpeg](https://github.com/espressif/esp-adf-libs/blob/master/esp_new_jpeg)，采用 **MIT** 许可。
* [littlefs](https://github.com/littlefs-project/littlefs)，采用 **BSD-3-Clause** 许可。
* [cJSON](https://github.com/DaveGamble/cJSON)，采用 **MIT** 许可。