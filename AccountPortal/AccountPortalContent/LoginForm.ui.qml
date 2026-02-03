import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Frame {
    id: frame2

    property StackLayout leftStackLayout

    ColumnLayout {
        id: columnLayout
        width: 474
        height: 545
        anchors.centerIn: parent
        Text {
            id: text2
            color: "#eaeaea"
            text: qsTr("Login")
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            Layout.preferredWidth: 192
            Layout.preferredHeight: 33
            Layout.fillWidth: true
        }

        Rectangle {
            id: rectangle
            color: "#909090"
            Layout.preferredWidth: 470
            Layout.preferredHeight: 2
        }

        Text {
            id: text3
            color: "#909090"
            text: qsTr("Enter your credentials to login to your account")
            font.pixelSize: 20
        }

        Column {
            id: column
            spacing: 10
            Text {
                id: textEmail
                color: "#eaeaea"
                text: qsTr("Email")
                font.pixelSize: 20
                font.bold: true
            }

            TextField {
                id: textFieldEmail
                width: 470
                height: 56
                cursorVisible: true
                readOnly: false
                maximumLength: 100
                placeholderText: qsTr("your@email.com")

                Connections {
                    target: textFieldEmail
                    function onTextEdited() {
                        console.log("textFieldEmail")
                    }
                }
            }
        }

        Column {
            id: column1
            spacing: 10
            Text {
                id: textPassword
                color: "#eaeaea"
                text: qsTr("Password")
                font.pixelSize: 20
                font.bold: true
            }

            TextField {
                id: textFieldPassword
                width: 470
                height: 56
                maximumLength: 20
                echoMode: TextInput.Password
                placeholderText: qsTr("*****")
            }
        }

        Button {
            id: buttonLogin
            text: qsTr("Login")
            wheelEnabled: false
            display: AbstractButton.TextOnly
            flat: false
            font.bold: true
            Layout.preferredWidth: 470
            Layout.preferredHeight: 52

            HoverHandler {
                cursorShape: Qt.PointingHandCursor
            }
        }

        RowLayout {
            id: rowLayoutOR
            Rectangle {
                id: rectangle1
                width: 126
                height: 1
                color: "#909090"
                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            Text {
                id: text6
                color: "#eaeaea"
                text: "OR"
                Layout.alignment: Qt.AlignVCenter
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                Layout.fillWidth: true
            }

            Rectangle {
                id: rectangle2
                width: 125
                height: 2
                color: "#909090"
                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            Layout.preferredWidth: 470
            Layout.preferredHeight: 25
            Layout.fillWidth: true
        }

        Row {
            id: row1
            y: 380
            spacing: 5
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: false
            Text {
                id: text4
                color: "#eaeaea"
                text: "Don't have an account?"
                font.pixelSize: 20
            }

            Text {
                id: text5
                color: "#eaeaea"
                text: "Register"
                font.pixelSize: 20
                font.bold: true
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent

                    HoverHandler {
                        cursorShape: Qt.PointingHandCursor
                    }

                    Connections {
                        target: mouseArea
                        function onClicked() {
                            leftStackLayout.currentIndex = 1
                        }
                    }
                }
            }
        }

        RowLayout {
            id: rowLayout1
            Button {
                id: buttonGoogle
                text: qsTr("GOOGLE")
                Layout.preferredWidth: 221
                Layout.preferredHeight: 52

                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }

            Button {
                id: buttonDiscord
                text: qsTr("DISCORD")
                Layout.preferredWidth: 227
                Layout.preferredHeight: 52

                HoverHandler {
                    cursorShape: Qt.PointingHandCursor
                }
            }
            Layout.preferredWidth: 470
            Layout.preferredHeight: 52
        }
    }
}
