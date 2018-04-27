import QtQuick 2.9

// toggle button

Item {
    id: toggleSwitch
    state: 'on'
    property int minX: (background.width / 2) * 0.05
    property int maxX: (background.width / 2) - ((background.width / 2) * 0.05)

    function releaseToggle() {
        var midPoint = (background.width / 4)
        if (button.x <= midPoint) {
            if (button.x != minX) {
                toggleSwitch.state = 'mid-air'
            }
            toggleSwitch.state = 'off'
        } else {
            if (button.x != maxX) {
                toggleSwitch.state = 'mid-air'
            }
            toggleSwitch.state = 'on'
        }
    }
    Rectangle {
        id: background
        color: '#00ff69'
        width: parent.width
        height: parent.height
        radius: height * 0.5

        MouseArea {
            anchors.fill: parent
            onClicked: { toggleSwitch.state = (toggleSwitch.state == 'on') ? 'off' : 'on' }
        }

        Rectangle {
            id: button
            color: 'white'
            x: minX
            y: parent.height * 0.05
            height: parent.height * 0.9
            width: parent.width / 2
            radius: height / 2

            MouseArea {
                anchors.fill: button
                drag.target: button
                drag.axis: Drag.XAxis
                drag.minimumX: minX
                drag.maximumX: maxX
                onReleased: releaseToggle()
                onClicked: { toggleSwitch.state = (toggleSwitch.state == 'on') ? 'off' : 'on' }
            }
        }
    }

    states: [
        State {
            name: 'on'
            PropertyChanges {
                target: button
                x: maxX
            }
            PropertyChanges { target: background; color: '#00ff69' }
        },
        State {
            name: 'off'
            PropertyChanges {
                target: button
                x: minX
            }
            PropertyChanges { target: background; color: 'black' }
        },
        State {
            name: 'mid-air'
        }

    ]

    transitions: Transition {
        NumberAnimation {
            properties: 'x'
            easing.type: Easing.InOutQuad
            duration: 200
        }
        ColorAnimation { duration: 200 }
    }
}
