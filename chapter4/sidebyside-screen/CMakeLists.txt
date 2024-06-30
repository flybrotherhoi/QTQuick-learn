cmake_minimum_required(VERSION 3.16)

project(sidebyside-screen VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)

qt_standard_project_setup()

qt_add_executable(appsidebyside-screen
    main.cpp
)

qt_add_qml_module(appsidebyside-screen
    URI sidebyside-screen
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES images/le.ico
    QML_FILES Home.qml
    QML_FILES Profile.qml
    QML_FILES About.qml
    QML_FILES EditProfile.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appsidebyside-screen PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appsidebyside-screen
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appsidebyside-screen
    PRIVATE Qt6::Quick
)
target_link_libraries(appsidebyside-screen PRIVATE Qt6::QuickControls2)
include(GNUInstallDirs)
install(TARGETS appsidebyside-screen
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
