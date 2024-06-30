cmake_minimum_required(VERSION 3.16)

project(ch4-mobile VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS QuickControls2)


qt_standard_project_setup()

qt_add_executable(appch4-mobile
    main.cpp
    icon.rc
)

file(GLOB QML_IMG_FILES
    "images/*"
)

function(set_qt_resource_alias)
    foreach(_file IN ITEMS ${ARGN})
        get_filename_component(_name "${_file}" NAME)
        set_source_files_properties(${_file} PROPERTIES QT_RESOURCE_ALIAS "${_name}")
    endforeach()
endfunction()
set_qt_resource_alias(${QML_IMG_FILES})
message("#######" ${QML_IMG_FILES})

qt_add_qml_module(appch4-mobile
    URI ch4-mobile
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES ${QML_IMG_FILES}
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appch4-mobile PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appch4-mobile
    PRIVATE Qt6::Quick
)

target_link_libraries(appch4-mobile PRIVATE Qt6::QuickControls2)

include(GNUInstallDirs)
install(TARGETS appch4-mobile
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
