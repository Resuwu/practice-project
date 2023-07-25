import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.folderlistmodel 2.12
import QtQuick.Controls 2.12
import QtQml 2.12

Window {

    id: appwindow
    color: "dimgrey"
    visible: true

    Shortcut {
        sequence: "Esc"
        onActivated: {
            timer.stop()
            appwindow.close()
        }
    }

    property int current: 0

    DelegateModel {
        id: delegatemodel
        model: FolderListModel {
            nameFilters: [ "*.jpg", "*.png", "*.jpeg" ]
            folder: "file:///home/resu/Downloads"
            showDirs: false
        }
        delegate: Component {
            Image {
                source: fileUrl
                Component.onCompleted: console.log(fileUrl, fileName)
            }
        }
    }

    ListView {
        id: listview
        anchors.fill: parent
        currentIndex: current
        clip: true
        orientation: Qt.Horizontal
        interactive: false
        model: delegatemodel
    }

    Timer {
        interval: 7000; running: true; repeat: true
        id: timer
        onTriggered: {
            current++
            if (current > listview.count-1) current = 0
            console.log("timer trig")
        }
    }

}
