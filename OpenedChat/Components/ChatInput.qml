import QtQuick 2.15
import QtQuick.Controls 2.5

Rectangle {
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 15
    anchors.horizontalCenter: parent.horizontalCenter

    height: 55
    width: parent.width * 0.87
    radius: 100

    gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: -0.2; color: "#f5f5f5"; }
        GradientStop { position: 1.0; color: "#f0f8ff"; }
    }

    TextArea{
        id: messageField
        anchors.left: parent.left
        anchors.right: sendButton.left
        anchors.margins: 10
        height: parent.height
        verticalAlignment: Qt.AlignVCenter
        clip: true
        wrapMode: TextArea.Wrap
        placeholderText: qsTr("Type your message here...")
        color: "#000"
        font.pixelSize: 16
        opacity: 0.8
        // font.family: Poppins.bold
        selectByMouse: true
    }

    RoundButton {
        id: sendButton
        width: height
        height: parent.height * 0.8
        radius: 40
        anchors.right: parent.right; anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 8
        icon.color: "#132236"
        icon.source: "../../Media/Images/send.svg"
        anchors.leftMargin: 10
        display: AbstractButton.IconOnly
        onClicked: sendMessage();
    }

    Shortcut{
        sequence: visible ? "Ctrl+Return" : ""
        onActivated: sendMessage();
    }

    function sendMessage(){
        if(messageField.text === "")
            return;

        console.log("Click")
        Chat.sendMessage(messageField.text);

        messageField.text = "";
    }
}
