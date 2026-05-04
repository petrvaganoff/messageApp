import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Rectangle {
    color: "transparent"
    radius: 10

    property var contactData: contactListView.model[index]

    Rectangle{
        id: hoverBackground
        height: parent.height
        width: mouseArea.containsMouse ? parent.width : 0
        anchors.left: parent.left; // anchors.leftMargin: profileImage.width/2
        opacity: 0.1
        // Behavior on width {
        //     SmoothedAnimation{
        //         duration: 100
        //     }
        // }
        // gradient: Gradient{
        //     GradientStop{ position: 0.0; color: "transparent" }
        //     GradientStop{ position: 0.1; color: "#aaa"; }
        //     GradientStop{ position: 0.9; color: "#aaa"; }
        //     GradientStop{ position: 1.0; color: "transparent" }
        // }
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
            // visible: false
        }

        // // Хак для отображения маски
        // Rectangle{ // невидимый приямоугольник как маска
        //     id: mask
        //     anchors.left: parent.left
        //     width: height
        //     height: parent.height
        //     radius: 10
        //     visible: false
        //     smooth: true
        // }
        // MultiEffect{ // применение маски к картинке
        //     id: maskedBackground
        //     source: profileImage
        //     anchors.fill: profileImage
        //     maskEnabled: true
        //     maskSource: ShaderEffectSource {
        //         sourceItem: mask
        //     }
        // }

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
                // font.family: Poppins.bold
                Layout.fillHeight: true
                verticalAlignment: Qt.AlignBottom
            }
            Text{
                text: contactData.message.length === 0 ? "" : contactData.message[contactData.message.length - 1].contents
                color: "#FFF"
                font.pixelSize: 12
                Layout.fillWidth: true
                opacity: 0.4
                // font.family: Poppins.bold
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
