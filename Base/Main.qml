import QtQuick
import QtQuick.VirtualKeyboard
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: window
    width: 1024
    height: 720
    visible: true
    title: qsTr("Base")

    // flags: Qt.Window
    StackView {
        id: mainStackView
        anchors.fill: parent
        initialItem: indexComponent
    }

    Component {
        id: indexComponent
        Page {
            id: indexPage
            anchors.fill: parent // Remplit le parent (StackView)
            title: qsTr('INDEX')
            header: Rectangle {
                color: "red"
                height: 100
            }

            footer: Rectangle {
                color: "yellow"
                height: 50
            }
        }
    }

    Component {
        id: shopComponent
        Page {
            id: shopPage
            anchors.fill: parent
            title: qsTr('Shop')

            Rectangle {
                anchors.fill: parent
                color: 'red'

                Button {
                    anchors.centerIn: parent
                    text: "Go to Main"
                    onClicked: mainStackView.pop()
                }
            }
        }
    }
}
