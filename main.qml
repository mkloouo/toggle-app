import QtQuick 2.9
import QtQuick.Controls 2.2

ApplicationWindow {
    id: window
    visible: true
    title: qsTr("Hello World")
    width: 900
    height: 540
    color: qsTr("#ffffff");
    Rectangle {
        id: button_bar
        x: window.width / 2 - width / 2
        y: window.height / 2 - height / 2
        height: window.width / 3
        width: height * 3;
        color: "#4cd964"
        radius: width * 0.5
        Rectangle {
            id: button_switch
            height: parent.height * 0.9
            anchors {
                top: button_bar.top
                topMargin: width / 20
                bottom: button_bar.bottom
                bottomMargin: width / 20
                left: button_bar.left
                leftMargin: width / 20
            }
            width: height
            radius: width
        }
    }
}
