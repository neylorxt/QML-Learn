cmake_minimum_required(VERSION 3.16)

project(CustomLauncherAPI VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appCustomLauncherAPI
    main.cpp
)

find_package(Qt6 REQUIRED COMPONENTS Network)
target_link_libraries(appCustomLauncherAPI PRIVATE Qt6::Network)

qt_add_resources(appCustomLauncherAPI "icons"
    PREFIX "/icons"
    BASE "Assets/Icons"
    FILES
        Assets/Icons/icon_loop.png
        Assets/Icons/icon_settings.png
        Assets/Icons/activity_sidebar_category.png
        Assets/Icons/friend_sidebar_category.png
        Assets/Icons/installed_sidebar_category.png
        Assets/Icons/more_offers_sidebar_category.png
        Assets/Icons/orders_history_sidebar_category.png
        Assets/Icons/recent_sidebar_category.png
        Assets/Icons/store_sidebar_category.png
        Assets/Icons/owned_sidebar_category.png
)

qt_add_qml_module(appCustomLauncherAPI
    URI CustomLauncherAPI
    QML_FILES
        Main.qml
        QML_FILES Components/SidebarCategoryItem.qml
        QML_FILES Components/Sidebar.qml
        RESOURCES
            Assets/Icons/activity_sidebar_category.png
            Assets/Icons/friend_sidebar_category.png
            Assets/Icons/icon_loop.png
            Assets/Icons/icon_settings.png
            Assets/Icons/installed_sidebar_category.png
            Assets/Icons/more_offers_sidebar_category.png
            Assets/Icons/orders_history_sidebar_category.png
            Assets/Icons/recent_sidebar_category.png
            Assets/Icons/store_sidebar_category.png
            Assets/Icons/owned_sidebar_category.png
            QML_FILES Components/GameContent.qml
            SOURCES data.h data.cpp
)


# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appCustomLauncherAPI PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appCustomLauncher
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

add_subdirectory(module/QApi)

target_link_libraries(appCustomLauncherAPI
    PRIVATE
        Qt6::Quick
        QApi
)

include(GNUInstallDirs)
install(TARGETS appCustomLauncherAPI
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
