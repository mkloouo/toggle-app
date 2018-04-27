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
    //    flags: Qt.Window | Qt.FramelessWindowHint

    Component.onCompleted: {
        setX(Screen.width / 2 - width / 2)
        setY(Screen.height / 2 - height / 2)
    }

    ToggleSwitch  {
        anchors.centerIn: parent
        width: (parent.width / 5) * 3
        height: parent.height / 2

        onStateChanged: {
            console.log('state: ' + state)
            console.log('bool on: ' + on)
        }
    }
}
