cmake_minimum_required(VERSION 3.10.0)

project(testProjectName)
add_executable(testExecutableName src/main.cpp)

# add_executable(${PROJECT_NAME} src/main.cpp)

install(TARGETS testExecutableName DESTINATION bin)
# bin here on linux would mean : /usr/local/bin

