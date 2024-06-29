import QtQuick

//Rectangle{
//    width: 200; height: 30
//    color: "lightsteelblue"
//    border.color: "gray"
//    property alias text: input.text
//    property alias input: input

//    TextInput{
//        id: input
//        anchors.fill: parent
//        anchors.margins: 2
//    }
//}

FocusScope{     // 可以获得正确的焦点
    width: 200; height: 30
    Rectangle{
        anchors.fill: parent
        color: "lightsteelblue"
        border.color: "gray"
    }

    property alias text: input.text
    property alias input: input

    TextEdit/*TextInput*/{
        id: input
        anchors.fill: parent
        anchors.margins: 2
        focus: true
        wrapMode: Text.WordWrap
    }
}
