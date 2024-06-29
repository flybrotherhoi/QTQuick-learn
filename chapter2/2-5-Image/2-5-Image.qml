import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 640
    visible: true
    title: qsTr("Image")

    Image{
        id: image1
        source: "../../images/pinwheel.png"
        width: 300; height:300
    }

    Image{
        x: image1.x+image1.width+12
        width: image1.width/2; height:image1.height
        source: "../../images/pinwheel.png"
        fillMode: Image.Stretch
    }

    Image{
        y: image1.y+image1.height+12
        width: image1.width/2; height:image1.height
        source: "../../images/pinwheel.png"
        // fillMode: Image.PreserveAspectCrop
        fillMode: Image.PreserveAspectFit
        clip: false
    }
}
