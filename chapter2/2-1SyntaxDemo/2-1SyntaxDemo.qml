import QtQuick
import QtQuick.Window

Rectangle {
    id: root
    width: 220; height: 260
    // visible: true

    color: "#4A4A4A"

    Image{
        id: image
        width: 50; height: 50
        x:(root.width-width)/2; y:40;
        source: "../../images/pinwheel.png"
    }

    Text{
        // un-named
        y:image.y+image.height+20
        horizontalAlignment:  Text.AlignHCenter
        width: root.width
        text:"大风车。。。转转转"
    }

}
