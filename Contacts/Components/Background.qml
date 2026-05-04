import QtQuick
import QtQuick.Effects

Rectangle {
    color: "transparent"
    anchors.fill: parent
    radius: mainWindow.radius

    // Хак для отображения маски
    Rectangle{ // невидимый приямоугольник как маска
        id: mask
        anchors.centerIn: parent
        color: "#b3b3b3"
        width: parent.width
        height: parent.height
        radius: 40
        visible: false
    }
    Image{ // невидимая картинка
        id: background
        source: "../../Media/Images/background.png"
        anchors.fill: parent
        asynchronous: true
        fillMode: Image.Stretch
        visible: false
    }
    MultiEffect{ // применение маски к картинке
        id: maskedBackground
        source: background
        anchors.fill: background
        maskEnabled: true
        maskSource: ShaderEffectSource {
            sourceItem: mask
        }
    }
}
