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
    property bool reverse: false
    property url folderpath

    DelegateModel {
        id: delegatemodel
        model: FolderListModel {
            nameFilters: [ "*.jpg", "*.png", "*.jpeg" ]
            folder: folderpath
            showDirs: false
        }
        delegate: Component {
            Image {
                height: Screen.height; width: Screen.width
                fillMode: Image.Stretch
                source: fileUrl
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
            if (!reverse) current++
            else current--
            if (current == listview.count-1) reverse = true
            if (current == 0) reverse = false
        }
    }

    Item {
        id: clock
        property int clocksize: Math.min(Screen.height, Screen.width)/2
        x: 10; y: 10;
        width: clocksize; height: clocksize
        scale: Math.min (width/clockback.sourceSize.width, height/clockback.sourceSize.height)
        transformOrigin: Item.TopLeft

        property int starthour: 0
        property int startmin: 0
        property int startsec: 0

        function calibrateClock() {
        var currenttime = TimeSetter.getAngles();
        startsec = currenttime[0]
        startmin = currenttime[1]
        starthour = currenttime[2]
        animation1.restart()
        animation2.restart()
        animation3.restart()
    }

        Component.onCompleted: {
            calibrateClock()
        }

        Image {
            id: clockback
            source: "qrc:///Clock parts/clockback.png"
        }
        Image {
            id: clockhour
            source: "qrc:///Clock parts/clockhour.png"
            transform: Rotation {
                origin.x: clockhour.width/2
                origin.y: clockhour.height/2
                RotationAnimation on angle {
                    id: animation1
                    from: clock.starthour
                    to: 360*2+clock.starthour
                    duration: 60000*1440
                    loops: Animation.Infinite
                }
            }
        }
        Image {
            id: clockmin
            source: "qrc:///Clock parts/clockmin.png"
            transform: Rotation {
                origin.x: clockmin.width/2
                origin.y: clockmin.height/2
                RotationAnimation on angle {
                    id: animation2
                    from: clock.startmin
                    to: 360*24+clock.startmin
                    duration: 60000*1440
                    loops: Animation.Infinite
                }
            }
        }
        Image {
            id: clocksec
            source: "qrc:///Clock parts/clocksec.png"
            transform: Rotation {
                origin.x: clockmin.width/2
                origin.y: clockmin.height/2
                RotationAnimation on angle {
                    id: animation3
                    from: clock.startsec
                    to: 360*1440+clock.startsec
                    duration: 60000*1440
                    loops: Animation.Infinite
                }
            }
        }
    }
}
