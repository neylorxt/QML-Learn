import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: '#09122C'
    opacity: 0.8

    property var limitedModel: []
    property bool isLoading: true

    Connections {
        target: DataClass
        function onGamesChanged() {
            limitedModel = DataClass.limitGames(50)
            isLoading = false
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.6
        visible: isLoading
        z: 999

        Column {
            anchors.centerIn: parent
            spacing: 16

            BusyIndicator {
                running: true
                width: 48
                height: 48
            }

            Text {
                text: "Loading..."
                color: "white"
                font.pixelSize: 16
            }
        }
    }

    Item {
        anchors.fill: parent
        visible: !isLoading

        GridView {
            id: gridView
            anchors.fill: parent

            model: limitedModel

            // cellWidth: 200
            // cellHeight: 250
            cellWidth: 250
            cellHeight: 300

            clip: true

            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AsNeeded

                background: Rectangle {
                    color: "transparent" // fond du rail
                    radius: 6
                }

                contentItem: Rectangle {
                    implicitWidth: 10
                    radius: 6
                    color: "#09122C" // couleur du curseur
                }
            }
            ScrollBar.horizontal: ScrollBar {
                policy: ScrollBar.AlwaysOff
            }

            delegate: Item {
                width: gridView.cellWidth
                height: gridView.cellHeight

                Rectangle {
                    color: "transparent"
                    width: gridView.cellWidth - 25
                    height: gridView.cellHeight - 20
                    radius: 10
                    anchors.centerIn: parent

                    Image {
                        source: modelData.thumbnail
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectCrop
                        clip: true
                        asynchronous: true
                    }
                }
            }
        }
    }
}
