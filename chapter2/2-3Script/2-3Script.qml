import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text{
        id: thisLabel

        x:24; y:16

        height: 2*width

        Rectangle{
            anchors.fill: parent;
            color: 'yellow';
            z:parent.z-1
        }

        property int times: 24
        property alias anotherTimes: thisLabel.times

        text: "thisLabel " + anotherTimes   // 用值来设置文本

        font.family: "Ubuntu"
        font.pixelSize: 24

        KeyNavigation.tab: thatLabel    // 按下tab键focus到thatLabel

        onHeightChanged: console.log('height:', height) // 高度改变时在控制台打印

        focus: true // focus is need to key events

        color: focus?"red":"black"
    }

    Text{
        id: thatLabel

        text: "thatLabel " + thisLabel.times
        focus: !thisLabel.focus
        KeyNavigation.tab: thisLabel
        color: focus?"red":"black"

        // onTextChanged: function(text){console.log("text changed to:", text)}
        onTextChanged: (text)=>{console.log("text changed to:", text)}

        Keys.onSpacePressed: {increment()}
        Keys.onEscapePressed: {text = ''}

        //JS函数
        function increment(){
            thisLabel.times+=1
        }
    }
}
