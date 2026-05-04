import QtQuick
import QtQuick.Window

Window {
    width: 336
    height: 725
    visible: true
    title: qsTr("Message App")
    color: "transparent"
    flags: Qt.WindowStaysOnTopHint
    Loader{
        id: mainLoader
        anchors.fill: parent
        anchors.margins: 0
        source: "./MainWindow.qml"
    }
}
