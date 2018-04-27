import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.3

ApplicationWindow {
    id: toggleWindow
    visible: true
    width: 500
    height: 300
    minimumWidth: 500
    minimumHeight: 300
    title: 'Toggle Button Window'

    Rectangle {
        id: customBar
        visible: false
        x: 0
        y: 0
        width: parent.width
        height: 30
        color: 'black'
        Text {
            x: 0
            y: 0
            text: 'X'
            color: 'white'
            width: 10
            height: parent.width
            font.pointSize: 20

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    toggleWindow.close()
                }
            }
        }
    }

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2)
        setY(Screen.height / 2 - height / 2)
    }

    ToggleSwitch  {
        anchors.centerIn: parent
        width: (parent.width / 5) * 3
        height: parent.height / 2

        onStateChanged: {
            if (state == 'on') {
                toggleWindow.flags = Qt.Window
                customBar.visible = false
            } else {
                toggleWindow.flags = Qt.Window | Qt.FramelessWindowHint
                customBar.visible = true
            }
        }
    }
}
