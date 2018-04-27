import QtQuick 2.9

// toggle button

Item {
    id: toggleSwitch
    state: 'off'
    property bool on: (state == 'on')

    function releaseToggle() {
        var midPoint = (background.width / 4)
        toggleSwitch.state = (button.x <= midPoint) ? 'off' : 'on'
    }

    Rectangle {
        id: background
        color: '#00ff69'
        width: parent.width
        height: parent.height
        radius: height * 0.5

        MouseArea {
            anchors.fill: parent
            onClicked: {
                toggleSwitch.state = (toggleSwitch.state == 'on') ? 'off' : 'on'
            }
        }

        Rectangle {
            id: button
            color: 'white'
            x: (parent.width / 2) * 0.05
            y: parent.height * 0.05
            height: parent.height * 0.9
            width: parent.width / 2
            radius: height / 2

            MouseArea {
                anchors.fill: button
                drag.target: button
                drag.axis: Drag.XAxis
                drag.minimumX: (background.width / 2) * 0.05
                drag.maximumX: (background.width / 2) - ((background.width / 2) * 0.05)
                onReleased: releaseToggle()
            }
        }
    }

    states: [
        State {
            name: 'on'
            PropertyChanges {
                target: button
                x: (background.width / 2) - ((background.width / 2) * 0.05)
            }
            PropertyChanges { target: background; color: '#00ff69' }
        },
        State {
            name: 'off'
            PropertyChanges {
                target: button
                x: (background.width / 2) * 0.05
            }
            PropertyChanges { target: background; color: 'black' }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: 'x'
            easing.type: Easing.InOutQuad
            duration: 200
        }

        ColorAnimation {
            duration: 200
        }
    }
}
