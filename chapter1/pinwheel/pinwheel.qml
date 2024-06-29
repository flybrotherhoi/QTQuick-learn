import QtQuick
import QtQuick.Window

Window {
    width: 500/*background.width*/     //:绑定，不是赋值（=），会随
    height: 300/*background.height*/
    visible: true
    title: qsTr("转转转")

    Image {                     // topmost的先绘制
        anchors.fill: parent;   // 用当前元素填充parent
        id: background          // 就像是C++的引用，不能修改
        source: "./images/background.jpg"   // url

        Image{
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            id: pole
            source: "./images/pole.png"
        }

        Image{
            anchors.centerIn: parent        // 放到parent的中间去
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.horizontalCenter: parent.horizontalCenter
            id: wheel
            source: "./images/pinwheel.jpg"
            width: parent.width*0.3
            height: parent.width*0.3
            Behavior on rotation{   // 为特定的属性修改行为：提供动画
                NumberAnimation{
                    duration:500
                }
            }
        }

        MouseArea{
            anchors.fill: wheel
            onClicked: wheel.rotation+=90
        }
    }

}
