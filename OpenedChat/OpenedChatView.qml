import QtQuick 2.15

import "./Components"

Rectangle{
    id: openedChatViewRoot
    readonly property var openedChatUser: Chat.openedChatUser

    color: "#203758"
    radius: mainWindow.radius

    ChatHeader{ id: chatHeader; }

    Rectangle{
        id: chatBody
        width: parent.width
        height: 0.89*parent.height
        anchors.bottom: parent.bottom
        color: "#132236"
        radius: 40

        ChatInput{ id: chatInput; }
        ChatThread{ id: chatThread; }
    }
}

