cmake_minimum_required(VERSION 3.10)

project(Timer)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

if(CPPTEST_COVERAGE)
  include(cpptest-coverage.cmake) #include for CT
  #include(/opt/parasoft/cpptest/std/2024.1.0/integration/cmake/cpptest-coverage.cmake) #include for std
endif()

# add_compile_definitions(STDINPUT)

add_executable(timer
 clock.c
 driver.c
 timer.c
 stdinout.c)
