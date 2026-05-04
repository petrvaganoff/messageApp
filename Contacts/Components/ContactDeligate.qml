import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Rectangle {
    color: "transparent"
    radius: 10

    required property var modelData
    property var contactData: modelData
    readonly property var lastMessage: contactData.messages.count > 0 ? contactData.messages.at(contactData.messages.count - 1) : null

    Rectangle{
        id: hoverBackground
        height: parent.height
        width: mouseArea.containsMouse ? parent.width : 0
        anchors.left: parent.left;
        opacity: 0.1
    }

    RowLayout{
        width: parent.width*0.9
        height: parent.height
        spacing: 8

        Image {
            id: profileImage
            source: contactData.imageURL
            Layout.preferredHeight: parent.height*0.7
            Layout.preferredWidth: height
            asynchronous: true
            fillMode: Image.PreserveAspectCrop
        }

        ColumnLayout{
            Layout.fillWidth: true;
            Layout.preferredHeight: parent.height
            Layout.leftMargin: 8
            spacing: -2
            Layout.topMargin: -4

            Text{
                text: contactData.name + " " + contactData.lastName
                color: "#FFF"
                font.pixelSize: 14
                Layout.fillWidth: true
                opacity: 0.8
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignBottom
            }
            Text{
                text: lastMessage === null ? "" : lastMessage.contents
                color: "#FFF"
                font.pixelSize: 12
                Layout.fillWidth: true
                opacity: 0.4
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignTop
                elide: Text.ElideRight
            }
        }
    }

    MouseArea{
        id: mouseArea
        hoverEnabled: true
        anchors.fill: parent
        onClicked: {
            Chat.openedChatUser = contactData;
            mainStack.push(openedChatView);
        }
    }
}
