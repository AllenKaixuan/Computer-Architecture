cmake_minimum_required(VERSION 3.23)
project(simp_md5 C)

set(CMAKE_C_STANDARD 11)

add_executable(simp_md5 main.c simp_md5.h simp_md5.c)
