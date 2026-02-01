import QtQuick

// Import de mon module ( class )
import CustomCpp 1.0

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr(cppHelper.getName())

    // Instance de ma classe C++
    CustomCpp {
        id: cppHelper
    }
}
