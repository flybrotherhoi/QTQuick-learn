import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Transformations")

    MouseArea{
        anchors.fill: parent
        onClicked: {
            qq1.x = 50;
            qq2.rotation = 0;
            qq3.rotation = 0;
            qq3.scale = 1;
        }
    }

    ClickableImage{
        id: qq1
        width: 80; height: 80
        x:50; y:68
        source: "../../images/pinwheel.png"
        onClicked:{
            x+=10;
        }
    }


    ClickableImage{
        id: qq2
        width: 80; height: 80
        x:150; y:68
        source: "../../images/pinwheel.png"
        onClicked: {
            rotation+=10;
        }
    }

    ClickableImage{
        id: qq3
        width: 80; height: 80
        x:250; y:68
        source: "../../images/pinwheel.png"
        onClicked: {
            rotation+=10;
            scale+=0.1;
        }
    }


}
