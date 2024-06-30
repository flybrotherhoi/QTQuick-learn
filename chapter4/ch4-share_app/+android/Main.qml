import QtQuick
import QtQuick.Controls
import Qt.labs.platform as Platform
import "../"

ImageViewerWindow {
    width: 320
    height: 480
    visible: true
    title: qsTr("Image Viewer Mobile")

    header:ToolBar{
        Material.background: Material.Orange
        ToolButton{
            icon.source: '../images/menu.png'
            onClicked: drawer.open()
        }
        Label{
            anchors.centerIn: parent
            text:"Image Viewer"
            font.pixelSize: 20
        }
    }


    Drawer{ // 替换原来的MenuBar
        id: drawer

        width: parent.width/3*2
        height:parent.height

        ListView{
            anchors.fill: parent
            model: ListModel{
                ListElement{
                    text: 'open...'
                    triggered: function(){
                        fileOpenDialog.open()
                    }
                }
                ListElement{
                    text: 'about...'
                    triggered: function(){
                        aboutDialog.open()
                    }
                }
            }

            delegate: ItemDelegate{
                text: model.text
                highlighted: ListView.isCurrentItem
                onClicked: {
                    drawer.close()
                    model.triggered()
                }
            }
        }
    }

}
