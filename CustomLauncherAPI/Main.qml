import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "Components"

Window {
    id: window
    width: 1250
    height: 800
    minimumWidth: 1250
    maximumWidth: 1250
    minimumHeight: 800
    maximumHeight: 800
    visible: true
    title: qsTr("Custom Launcher API")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // SIDEBAR COMPONENT
        Sidebar {}

        // BODY
        GameContent {}
    }
}
