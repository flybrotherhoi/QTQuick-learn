import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

ApplicationWindow {
    width: 320
    height: 480
    visible: true
    title: qsTr("Image Viewer")

    background: Rectangle{
        color: 'darkGray'
    }

    Image{
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    Platform.FileDialog{
        // folder:
        id: fileOpenDialog
        title:"选择图片"
        nameFilters:[
            "Image files(*.png *.jpg)", "all files(*.*)"
        ]
        onAccepted: {
            image.source = fileOpenDialog.file
        }
    }

    Dialog{
        id: aboutDialog
        width: 300; height: 150
        anchors.centerIn: parent
        title: "About"
        Label{
            anchors.fill: parent
            text: "一个图片查看应用"
            horizontalAlignment: Text.AlignHCenter
        }

        standardButtons: Platform.StandardButton.Ok
    }
}
