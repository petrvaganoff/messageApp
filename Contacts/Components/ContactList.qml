import QtQuick
import QtQuick.Layouts

Item {
    height: parent.height*0.85
    width: parent.width
    anchors.bottom: parent.bottom

    Rectangle{
        anchors.fill: parent
        color: "#141414"
        opacity: 0.5
        radius: 40
    }

    Rectangle{
        id: notch
        width: parent.width*0.15
        height: 5
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#56E777"
        radius: 100
        anchors.top: parent.top
        anchors.topMargin: 6
    }

    Item{
        anchors.top: notch.bottom
        anchors.topMargin: 24
        anchors.bottom: parent.bottom
        anchors.left: parent.left; anchors.right: parent.right
        anchors.margins: 22

        RowLayout{
            id: titleLayout
            width: parent.width
            Text{
                text: qsTr("Все чаты")
                color: "#FFF"
                font.pixelSize: 16
                // font.family:
                font.bold: true
                opacity: 0.75
            }
        }

        ListView{
            id: contactListView
            anchors.top: titleLayout.bottom; anchors.topMargin: 22
            anchors.bottom: parent.bottom
            width: parent.width
            spacing: 18
            clip: true
            model: Users.users
            delegate: ContactDeligate{
                height: 65
                width: contactListView.width
            }
        }
    }
}
