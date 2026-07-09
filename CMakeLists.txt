# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.16)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
# "Trim" the build. Include the minimal set of components, main, and anything it depends on.
idf_build_set_property(MINIMAL_BUILD ON)
project(WKCLite)
idf_build_set_property(COMPILE_OPTIONS "-Wno-parentheses" APPEND)

# After the first build, comment out the image generation code
fatfs_create_rawflash_image(data_static resources FLASH_IN_PROJECT)
fatfs_create_rawflash_image(data_fonts fonts FLASH_IN_PROJECT)