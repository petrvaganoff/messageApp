import QtQuick 2.15

Item {
    anchors.left: parent.left; anchors.right: parent.right;
    anchors.bottom: chatInput.top; anchors.top: parent.top;

    ListView{
        id: openedChatList
        anchors.fill: parent
        anchors.margins: 16
        model: Chat.openedChatUser ? Chat.openedChatUser.messages : []

        spacing: 8
        clip: true
        highlightFollowsCurrentItem: true

        onCountChanged: {
            if (count > 0)
                openedChatList.currentIndex = count - 1;
            openedChatList.positionViewAtEnd();
        }

        delegate: ChatBubble{}

        add: Transition{
            NumberAnimation{ properties: "x"; from: openedChatList.width/2; duration: 1500; easing.type: Easing.OutBounce; }
        }

    }
}
