import QtQuick
import QtQuick.Window

//DarkSquare{
//    id:root

//    width:120; height:240

//    Column{
//        anchors.centerIn: parent
//        spacing: 10

//        RedSquare{}
//        GreenSquare{width: 96}
//        BlueSquare{}
//    }
//}

//BrightSquare{
//    id:root

//    width:240; height:240

//    Row{
//        anchors.centerIn: parent
//        spacing: 10

//        RedSquare{}
//        GreenSquare{width: 96}
//        BlueSquare{}
//    }
//}

//BrightSquare{
//    id:root

//    width:240; height:240

//    Grid{
//        anchors.centerIn: parent
//        spacing: 10

//        rows: 2
//        columns: 3

//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//    }
//}

//BrightSquare{
//    id:root

//    width:240; height:240

//    Flow{
//        anchors.fill: parent
//        anchors.margins: 20
//        spacing: 10


//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//        RedSquare{}
//        GreenSquare{}
//        BlueSquare{}
//    }
//}

DarkSquare{
    id:root

    width:512; height:512
    property variant colorArray:["#00bde3", "#67c111", "#ea7025"]    // variant也可以简写为var

    Grid{   // columns默认为4
        anchors.centerIn: parent
        anchors.margins: 8
        spacing: 4

        columns: 5

        Repeater{
            model:25
            Rectangle{
                id: rect
                property int colorIndex: Math.floor(Math.random()*3)
                color:root.colorArray[colorIndex]
                width:56; height:56
                Text{
                    anchors.centerIn: parent
                    text:"Cell "+ rect.Positioner.index
                    color:"white"
                }
            }

        }

    }
}



