import QtQuick
import QtQuick.Window

Rectangle {
    width:300; height:300
    Rectangle{
        id: square
        width: 100; height: 100
        scale: 1
        color: 'green'
        border.color: Qt.lighter(color)
    }

    focus: true
    Keys.onLeftPressed: square.x-=8
    Keys.onRightPressed: square.x+=8
    Keys.onUpPressed: square.y-=8
    Keys.onDownPressed: square.y+=8

    Keys.onPressed: function key_func (event){
        console.log('Key pressed:', event.key);
        switch(event.key){
        case Qt.Key_Plus: {
                console.log('key plus pressed')
                square.scale += 0.2;
                break;
            }
        case Qt.Key_Minus: {    // 由于笔记本上没有减号键，所以需要用95来代替
                square.scale -= 0.2;
                console.log('key minus pressed');
                break;
           }
        }
    }
}
