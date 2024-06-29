import QtQuick
import QtQuick.Window
import QtQuick.Layouts

Rectangle{
    id:root
    width:800;height:600

//    Rectangle{
//        width:800;height:600
//        gradient: Gradient{
//            GradientStop{position:0.0; color:'blue'}
//            GradientStop{position:1.0; color:'white'}
//        }
//    }
//    Rectangle{
//        color:'green'
//    }
    ColumnLayout{
        anchors.fill:parent
        Rectangle{
            id: sky
            width:parent.width
            height:parent.height*0.5
            gradient: Gradient{
                GradientStop{position:0.0; color:'blue'}
                GradientStop{position:1.0; color:'white'}
            }
        }
        Rectangle{
            id: ground
            width:parent.width
            height:parent.height*0.5
            anchors.top: sky.bottom
            anchors.bottom: root.bottom
            gradient: Gradient{
                GradientStop{position:0.0; color:'#11ff00'}
                GradientStop{position:1.0; color:'#112200'}
            }
        }
    }

    Image{
        id: football
        source:'../../images/football.png'
        width:80; height:80
        x:10; y: root.height-height

        MouseArea{
            anchors.fill: parent
            onClicked: anim.start()
        }
    }

    ParallelAnimation{
        id: anim
        property int duration: 1000
        SequentialAnimation{
            NumberAnimation {
                target: football
                property: "y"
                from: root.height-football.height
                to: football.height+50
                duration: anim.duration*0.4
                easing.type: Easing.OutCirc
            }
            NumberAnimation {
                target: football
                property: "y"
                from: football.height+50
                to: root.height-football.height
                duration: anim.duration*0.6
                easing.type: Easing.OutBounce
            }
        }

        NumberAnimation {
            target: football
            property: "x"
            from: 10
            to: root.width - football.width - 10
            duration: anim.duration
            easing.type: Easing.Linear
        }

        RotationAnimation{
            target: football
            duration: anim.duration
            from: 0
            to: 720
        }
    }

}
