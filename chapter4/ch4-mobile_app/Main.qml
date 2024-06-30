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
        // source: "pinwheel.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    // header:ToolBar{  // desktop风格
    //     Flow{
    //         anchors.fill: parent
    //         ToolButton{
    //             text: "打开"
    //             icon.source: "pole.png"
    //             onClicked: fileOpenDialog.open()
    //         }
    //     }
    // }
    header:ToolBar{
        Material.background: Material.Orange
        ToolButton{
            icon.source: 'menu.png'
            onClicked: drawer.open()
        }
        Label{
            anchors.centerIn: parent
            text:"Image Viewer"
            font.pixelSize: 20
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
