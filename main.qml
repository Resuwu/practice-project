import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Window {
    id: homepage
    width: 640; height: 480
    visible: true
    title: "Home"
    Component.onCompleted: {
            x = Screen.width / 2 - width / 2
            y = Screen.height / 2 - height / 2
        }
    Column {
        spacing: 5
        anchors.centerIn: parent
        Button {
            width: 300; height: 50
            text: "Start"
            onClicked: {
                var component = Qt.createComponent("appwindow.qml")
                var window = component.createObject(homepage)
                window.showFullScreen()
            }
        }
        Button {
            width: 300; height: 50
            text: "Settings"
            onClicked: {

            }
        }
    }
}
