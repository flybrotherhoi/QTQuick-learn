import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Mouse Area")

    Rectangle{
        id: rect1
        x: 12; y:12
        width: 76; height: 96
        color: "lightsteelblue"

        MouseArea{
            anchors.fill: parent

            onClicked: rect2.visible = !rect2.visible
        }
    }

    Rectangle{
        id: rect2
        x: 112; y:12
        width: 76; height: 96
        border.color: "lightsteelblue"
        border.width: 4
        radius: 8
    }
}
