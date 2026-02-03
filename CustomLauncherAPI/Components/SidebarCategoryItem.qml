import QtQuick 2.15
import QtQuick.Layouts

Item {
    height: 150
    width: parent.width

    property string categoryTitle: "XXX"
    property ListModel dataCategoryItemModel

    Rectangle {
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 10
        color: 'transparent'

        Column {
            height: parent.height
            width: parent.width
            spacing: 10

            Text {
                text: qsTr(categoryTitle)
                font.pointSize: 12
                color: "#C4C4C4"
                font.bold: true
            }

            Repeater {
                model: dataCategoryItemModel

                Item {
                    height: 30
                    width: parent.width

                    required property string categoryName
                    required property string categoryType
                    required property string categoryIcon
                    required property int categoryItemsNumber
                    required property bool showCategoryItemsNumber

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        color: 'transparent'

                        RowLayout {
                            anchors.fill: parent

                            Rectangle {
                                width: 40
                                Layout.fillHeight: true
                                color: 'transparent'

                                Image {
                                    id: icon_loop
                                    source: categoryIcon
                                    width: 25
                                    height: parent.height
                                    fillMode: Image.PreserveAspectFit
                                    opacity: 0.7
                                }
                            }
                            Text {
                                text: qsTr(categoryName)
                                font.pointSize: 12
                                Layout.fillWidth: true
                                color: "white"
                            }

                            Rectangle {
                                width: 50
                                height: parent.height
                                Layout.rightMargin: 10
                                radius: 40
                                color: '#7D7D7D'
                                visible: (showCategoryItemsNumber) ? true : false

                                Text {
                                    text: categoryItemsNumber.toString()
                                    font.pointSize: 10
                                    anchors.centerIn: parent
                                    color: "white"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
