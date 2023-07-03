import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: appwindow
    width: 1920;    height: 1080
    visible: true
    Shortcut {
        sequence: "Esc"
        onActivated: {
            appwindow.close()
        }
    }
}
