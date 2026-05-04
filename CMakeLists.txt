cmake_minimum_required(VERSION 3.16)

project(messageApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appmessageApp
    main.cpp
)

qt_add_qml_module(appmessageApp
    URI messageApp
    VERSION 1.0
    QML_FILES
        Main.qml
        MainWindow.qml
        Contacts/ContactsView.qml
        Contacts/Components/Background.qml
        Contacts/Components/Header.qml
        Contacts/Components/ContactList.qml
        Contacts/Components/ContactDeligate.qml
        OpenedChat/OpenedChatView.qml
        OpenedChat/Components/ChatInput.qml
        OpenedChat/Components/ChatThread.qml
        OpenedChat/Components/ChatBubble.qml
        OpenedChat/Components/ChatHeader.qml
        RESOURCES Assets/Images/ThierryHenry.jpg
        RESOURCES Assets/Images/AndreyArshavin.jpeg
        RESOURCES Assets/Images/KarimBenzema.jpg Assets/Images/GianluigiBuffon.jpg Assets/Images/SergioGomez.jpg Assets/Images/ZlatanIbrahimovic.jpg Assets/Images/LionelMessi.jpg Assets/Images/RoyMakaay.jpg Assets/Images/CristianoRonaldo.jpg Assets/Images/WayneRooney.jpg Assets/Images/FrancescoTotti.jpg
        RESOURCES Assets/Images/Background.png
        RESOURCES Assets/Icons/options.svg Assets/Icons/search.svg Assets/Icons/send.svg Assets/Icons/arrowLeft.svg
        SOURCES ApplicationManager.h ApplicationManager.cpp
        SOURCES User/Message.cpp User/Message.h User/User.cpp User/User.h
        SOURCES User/UserList.h User/UserList.cpp
        SOURCES User/Chat.h User/Chat.cpp
        SOURCES User/ChatList.cpp User/ChatList.h
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appmessageApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appmessageApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appmessageApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)

install(TARGETS appmessageApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
