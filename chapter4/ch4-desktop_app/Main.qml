import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Viewer")

    background: Rectangle{
        color: 'darkGray'
    }

    Image{
        id: image
        // source: "pinwheel.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    header:ToolBar{
        Flow{
            anchors.fill: parent
            ToolButton{
                text: "打开"
                icon.source: "pole.png"
                onClicked: fileOpenDialog.open()
            }
        }
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

    menuBar: MenuBar{
        Menu{
            title: "&File"
            MenuItem{
                text:"&Open.."
                icon.source: "pole.png"
                onTriggered: fileOpenDialog.open()
            }
        }
        Menu{
            title: "&Help"
            MenuItem{
                text:"&About.."
                // icon.source: "pole.png"
                onTriggered: aboutDialog.open()
            }
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
