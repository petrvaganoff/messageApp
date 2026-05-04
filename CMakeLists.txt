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
        QML_FILES MainWindow.qml
        QML_FILES Contacts/ContactsView.qml
        QML_FILES Contacts/Components/Background.qml
        QML_FILES Contacts/Components/Header.qml
        QML_FILES Contacts/Components/ContactList.qml
        QML_FILES Contacts/Components/ContactDeligate.qml
        QML_FILES OpenedChat/OpenedChatView.qml
        QML_FILES OpenedChat/Components/ChatInput.qml
        QML_FILES OpenedChat/Components/ChatThread.qml
        QML_FILES OpenedChat/Components/ChatBubble.qml
        QML_FILES OpenedChat/Components/ChatHeader.qml
        RESOURCES Media/Images/henry.jpg
        RESOURCES Media/Images/cwd_bg.jpg
        RESOURCES Media/Images/citizen.svg Media/Images/client.svg Media/Images/expert.svg Media/Images/infinity.svg Media/Images/start.svg
        RESOURCES Media/Images/avatar.jpg Media/Images/benzema.jpg Media/Images/buffon.jpg Media/Images/gomez.jpg Media/Images/ibra.jpg Media/Images/messi.jpg Media/Images/nestelroy.jpg Media/Images/ronaldo.jpg Media/Images/rooney.jpg Media/Images/totti.jpg
        RESOURCES Media/Images/options.svg Media/Images/background.png Media/Images/search.svg
        RESOURCES Media/Images/send.svg
        RESOURCES Media/Images/arrowLeft.svg
        SOURCES ApplicationManager.h ApplicationManager.cpp
        SOURCES User/Message.cpp User/Message.h User/User.cpp User/User.h
        SOURCES User/UserList.h User/UserList.cpp
        SOURCES User/Chat.h User/Chat.cpp
        SOURCES core/ComponentCreatorEngine.cpp core/ComponentCreatorEngine.h core/FileWatcher.cpp core/FileWatcher.h
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
