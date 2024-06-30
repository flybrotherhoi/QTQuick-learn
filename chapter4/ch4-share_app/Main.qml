import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform

ImageViewerWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Image Viewer Desktop")

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

}
