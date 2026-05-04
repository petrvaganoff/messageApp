import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    anchors.top: parent.top
    anchors.bottom: chatBody.top
    anchors.topMargin: 16; anchors.bottomMargin: 16;
    anchors.leftMargin: 22; anchors.rightMargin: 22
    anchors.left: parent.left; anchors.right: parent.right;

    RowLayout{
        anchors.fill: parent
        spacing: 8
        RoundButton {
            id: backButton
            Layout.preferredHeight: parent.height * 0.7
            Layout.preferredWidth: height
            icon.color: "#132236"
            icon.source: "../../Assets/Icons/arrowLeft.svg"
            onClicked: mainStack.pop();
        }
        Item{ Layout.fillWidth: true; }
        Image{
            id: backgroundImage
            source: openedChatViewRoot.openedChatUser === null ? "" : openedChatViewRoot.openedChatUser.imageURL
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            // asynchronous: true
            fillMode: Image.PreserveAspectCrop
        }
        ColumnLayout{
            Layout.preferredWidth: parent.width*0.4
            Layout.preferredHeight: parent.height * 0.8
            Layout.alignment: Qt.AlignVCenter
            spacing: -2
            Text{
                text: openedChatViewRoot.openedChatUser === null ? "" : openedChatViewRoot.openedChatUser.name + " " + openedChatViewRoot.openedChatUser.lastName
                color: "#FFF"
                font.pixelSize: 14
                // font.family: Poppins.medium
                Layout.fillHeight: true;
                Layout.preferredWidth: parent.width
                elide: Text.ElideRight
            }
            Text{
                text: openedChatViewRoot.openedChatUser === null ? qsTr("Offline") : (openedChatViewRoot.openedChatUser.isOnline ? qsTr("Online") : qsTr("Offline"))
                color: "#FFF"
                font.pixelSize: 12
                opacity: 0.5
                // font.family: Poppins.medium
                Layout.fillHeight: true;
                Layout.preferredWidth: parent.width
                elide: Text.ElideRight
            }
        }
        Item{ Layout.fillWidth: true; }
        RoundButton {
            id: optionsButton
            Layout.preferredHeight: parent.height * 0.7
            Layout.preferredWidth: height
            icon.color: "#132236"
            icon.source: "../../Assets/Icons/options.svg"
            onClicked: {
                console.log("option_button clicked!");
            }
        }
    }
}
