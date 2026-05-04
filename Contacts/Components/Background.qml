import QtQuick
import QtQuick.Effects

Rectangle {
    color: "transparent"
    anchors.fill: parent
    radius: mainWindow.radius

    Rectangle{
        id: mask
        anchors.centerIn: parent
        color: "#b3b3b3"
        width: parent.width
        height: parent.height
        radius: 40
        visible: false
    }
    Image{
        id: background
        source: "../../Assets/Images/Background.png"
        anchors.fill: parent
        asynchronous: true
        fillMode: Image.Stretch
        visible: false
    }
    MultiEffect{
        id: maskedBackground
        source: background
        anchors.fill: background
        maskEnabled: true
        maskSource: ShaderEffectSource {
            sourceItem: mask
        }
    }
}
