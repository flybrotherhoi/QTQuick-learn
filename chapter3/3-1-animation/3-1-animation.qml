import QtQuick
import QtQuick.Window

Image{
    id: root
    source:"../../images/background.jpg"
    width: 500; height: 500
    property int padding: 40
    property bool running: false

    Image{
        id: qq
        source: "../../images/pinwheel.png"
        width:100; height: 100
        x: root.padding; y:(root.height-height)/2

        NumberAnimation on x{
            to: root.width - qq.width - root.padding
            duration: 3000
            running: root.running
        }
        OpacityAnimator on opacity/*PropertyAnimation on opacity*/{
            to: 0
            duration: 3000
            running: root.running
        }
    }

    RotationAnimation on rotation{  // 也可以放到image外，加上target属性就可以
        target: qq
        to: 360
        duration: 3000
        running: root.running
    }

    MouseArea{
        anchors.fill: parent
        onClicked: root.running = true
    }
}
