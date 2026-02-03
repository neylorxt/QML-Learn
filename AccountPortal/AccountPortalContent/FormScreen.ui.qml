

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import AccountPortal

Item {
    id: root
    width: Constants.width
    height: Constants.height

    Rectangle {
        id: rectangle3
        anchors.fill: parent
        color: "#000000"

        RowLayout {
            id: rowLayout
            anchors.fill: parent

            Frame {
                id: frameLogin
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200

                background: Rectangle {
                    color: "transparent"
                    border.width: 0
                }

                StackLayout {
                    id: leftStackLayout
                    anchors.fill: parent
                    currentIndex: 0

                    LoginForm {
                        id: loginForm
                        height: 609
                        width: 558
                        x: 28
                        y: 44
                        leftStackLayout: leftStackLayout
                    }

                    RegisterForm {
                        id: registerForm
                        height: 609
                        width: 558
                        x: 28
                        y: 44

                        leftStackLayout: leftStackLayout
                    }
                }
            }

            Frame {
                id: frameLauncherName
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200

                background: Rectangle {
                    color: "transparent"
                    border.width: 0
                }

                Text {
                    id: text1
                    color: "#ffffff"
                    text: qsTr("Account Portal")
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    font.pixelSize: 100
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    wrapMode: Text.WordWrap
                    font.styleName: "Bold"
                    font.family: "Arial"
                }
            }
        }
    }
}
