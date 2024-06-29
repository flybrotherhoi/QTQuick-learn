import QtQuick
import QtQuick.Window

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("UFO")
    property int duration: 3000

    Image{
        source:"../../images/background.jpg"
        anchors.fill: parent
    }

    ClickableImageV3{
        id:ufo
        x:20; y:root.height-height
        source: "../../images/UFO.png"
        text:'UFO'
        onClicked: anim.start()
    }

    /*SequentialAnimation*/ // 顺序动画
    ParallelAnimation{
        id: anim

        NumberAnimation {
            target: ufo
            property: "y"
            from: root.height - ufo.height
            to:20
            duration: root.duration
            easing.type: Easing.InOutQuad
        }

        NumberAnimation {
            target: ufo
            property: "x"
            from: 20
            to:500
            duration: root.duration
            easing.type: Easing.InOutElastic
        }
    }
}
