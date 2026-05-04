import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: headerRoot
    anchors.top: parent.top
    anchors.bottom: contactList.top
    anchors.left: parent.left; anchors.right: parent.right
    anchors.margins: 14

    RowLayout{
        anchors.left: parent.left; anchors.right: parent.right
        anchors.top: parent.top; anchors.bottom: parent.bottom;
        anchors.margins: 8;
        anchors.topMargin: 10
        anchors.bottomMargin: 24
        spacing: 10

        ColumnLayout{
            id: welcomingLayout
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 0

            Text{
                text: qsTr("Доброе утро") + ","
                color: "#FFF"
                font.pixelSize: 14
                Layout.fillWidth: true
                opacity: 0.5
                // font.family: Poppins.bold
                Layout.topMargin: 4
            }
            Text{
                text: Chat.mainUser.name + " " + Chat.mainUser.lastName
                color: "#FFF"
                font.pixelSize: 16
                Layout.fillWidth: true
                opacity: 0.8
                // font.family: Poppins.bold
                lineHeight: 0.5
                font.bold: true
            }
        }

        RoundButton {
            id: optionsButton
            height: 40
            width: 40
            text: "…"
            radius: 40
            Layout.alignment: Qt.AlignRight
            anchors.rightMargin: 10
            display: AbstractButton.IconOnly
            icon.source: "../../Media/Images/search.svg"
            icon.color: "black"
            onClicked: {
                console.log("optionsButton clicked!")
            }
        }

        RoundButton {
            id: searchButton
            height: 40
            width: 40
            radius: 40
            Layout.alignment: Qt.AlignRight
            display: AbstractButton.IconOnly
            icon.source: "../../Media/Images/options.svg"
            icon.color: "black"
            onClicked: {
                console.log("searchButton clicked!")
            }
        }
    }
}
