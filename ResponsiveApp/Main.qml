import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    width: 1020
    height: 720
    visible: true
    title: qsTr("Responsive App")

    property bool isMobileScreen: width < 400
    property bool isTabletteScreen: !isMobileScreen && width <= 750
    property bool isDesktopScreen: !isMobileScreen && !isTabletteScreen
    property int drawerWith: (width * (80 / 100)) // 80% de l ecran

    // Layout for the Desktop
    RowLayout {
        anchors.fill: parent
        spacing: 1
        visible: isDesktopScreen

        LayoutItemProxy {
            target: sidemenu
            width: 200
            Layout.fillHeight: true
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true
            spacing: 2

            LayoutItemProxy {
                target: topbar
                height: 60
                Layout.fillWidth: true
            }

            LayoutItemProxy {
                target: maincontent
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    // Layout fot the tablette
    RowLayout {
        anchors.fill: parent
        spacing: 1
        visible: isTabletteScreen

        LayoutItemProxy {
            target: sidemenu
            width: 70
            Layout.fillHeight: true
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true

            LayoutItemProxy {
                target: topbar
                height: 60
                Layout.fillWidth: true
            }

            LayoutItemProxy {
                target: maincontent
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    // Layout for the Mobile
    ColumnLayout {
        anchors.fill: parent
        visible: isMobileScreen

        ColumnLayout {
            Layout.fillHeight: true
            Layout.fillWidth: true

            LayoutItemProxy {
                target: topbar
                height: 60
                Layout.fillWidth: true
            }

            LayoutItemProxy {
                target: maincontent
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    // Drawer
    Drawer {
        id: drawer
        width: drawerWith
        height: parent.height
        interactive: isMobileScreen
        edge: Qt.LeftEdge

        background: Rectangle {
            color: '#eee'
        }

        contentItem: LayoutItemProxy {
            target: sidemenu
            width: drawer.width
            height: drawer.height
        }
    }

    // SIDE MENU
    Rectangle {
        id: sidemenu
        color: 'red'

        Column {
            anchors.fill: parent
            spacing: 8

            Repeater {
                width: parent.width
                model: 5
                delegate: Item {
                    width: sidemenu.width
                    height: 50

                    Row {
                        Item {
                            width: 70
                            height: 50

                            Rectangle {
                                width: 40
                                height: 40
                                radius: 8
                                anchors.centerIn: parent
                            }
                        }
                        Text {
                            font.pixelSize: 16
                            text: qsTr("Menu ") + (index + 1).toString()
                            leftPadding: 8
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }

    // TOP BAR
    Rectangle {
        id: topbar
        color: 'green'
    }

    // Main Content
    Rectangle {
        id: maincontent
        color: 'orange'
    }
}
