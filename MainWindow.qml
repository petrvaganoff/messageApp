import QtQuick
import QtQuick.Controls

import "./Contacts"
import "./OpenedChat"

Rectangle {
    id: mainWindow
    color: "transparent"
    radius: 50

    StackView{
        id: mainStack
        anchors.fill: parent
        initialItem: contactsView
    }

    ContactsView{ id: contactsView; }
    OpenedChatView{ id: openedChatView; }
}
