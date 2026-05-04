import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    id: bubbleRoot
    height: shouldShowTime ? bubble.height + 25 : bubble.height
    width: bubble.width
    x: sender ? 0 : openedChatList.width - width

    readonly property bool sender: userID === Chat.mainUser.ID
    readonly property bool shouldShowTime: openedChatList.count - 1 === index ? true : userID !== Chat.mainUser.ID

    Rectangle{
        id: bubble
        width: Math.min(messageText.implicitWidth + 24, (openedChatList.width * 0.8))
        height: messageText.implicitHeight + 24
        radius: 12

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: -0.2; color: sender ? "#252B35" : "#32CEF2"; }
            GradientStop { position: 1.0; color: sender ? "#3f4045" : "#2D6CF7"; }
        }

        Text{
            id: messageText
            text: contents
            anchors.fill: parent
            anchors.margins: 12
            wrapMode: Label.Wrap
            color: "#FFF"
            opacity: 0.75
            font.pixelSize: 12
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: sender ? Qt.AlignLeft : Qt.AlignRight
        }
    }
    Text{
        anchors.top: bubble.bottom; anchors.topMargin: 10
        anchors.right: sender ? undefined : parent.right
        horizontalAlignment: sender ? Qt.AlignLeft : Qt.AlignRight
        text: time
        width: bubble.width
        height: 20
        color: "#FFF"
        font.pixelSize: 10
        visible: shouldShowTime
        opacity: 0.3
    }

    MouseArea{
        id: mouseArea
        anchors.fill: bubble
        hoverEnabled: true
    }
}
