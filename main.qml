import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Dialogs
import QtCore

ApplicationWindow {
    id: mainwindow
    width: 640; height: 480
    visible: true
    title: " "
    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = Screen.height / 2 - height / 2
        var config = ConfigIO.loadConfig()
        chosenfolder = config[0]
        isselected = config[1]
    }

    property url chosenfolder
    property bool isselected

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: homepage
    }

    Dialog {
        id: dialog
        modal: false
        standardButtons: Dialog.Ok
    }

    Page {
        id: homepage
        Column {
            spacing: 5
            anchors.centerIn: parent
            Button {
                width: 300; height: 50
                text: "Start"
                onClicked: {
                    if (isselected !== false) {
                        console.log(".",chosenfolder,".",isselected)
                        var component = Qt.createComponent("appwindow.qml")
                        var window = component.createObject(mainwindow)
                        window.folderpath = chosenfolder
                        window.showFullScreen()
                    }
                    else dialog.open()
                }
            }
            Button {
                width: 300; height: 50
                text: "Settings"
                onClicked: {
                    stack.push(setpage)
                }
            }
        }
    }

    Page {
        id: setpage
        visible: false
        Column {
            spacing: 5
            anchors.centerIn: parent
            Button {
                width: 300; height: 50
                text: "Choose pictures folder"
                onClicked: {
                    stack.push(dialpage)
                    folderdial.visible = true
                }
            }
            Button {
                width: 300; height: 50
                text: "Return"
                onClicked: {
                    stack.pop()
                }
            }
        }
    }
    Page {
        id: dialpage
        visible: false
        FolderDialog{
            id: folderdial
            acceptLabel:  "Confirm"
            currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            options: FolderDialog.ReadOnly
            rejectLabel: "Cancel"
            onAccepted: {
                mainwindow.chosenfolder = currentFolder
                mainwindow.isselected = true
                ConfigIO.saveConfig(folderdial.currentFolder)
                stack.pop()
            }
            onRejected: {
                stack.pop()
            }
        }
    }
}
