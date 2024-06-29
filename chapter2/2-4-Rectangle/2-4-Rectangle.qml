import QtQuick
import QtQuick.Window

Window {
    width: 300
    height: 480
    visible: true
    title: qsTr("Rectangle")

    Rectangle{
        id: rect1
        x:12;y:12
        width:76;height:96
        color:'lightsteelblue'
    }

    Rectangle{
        id: rect2
        x:112;y:12
        width:76;height:96
        border.color:Qt.rgba(Math.random(), Math.random(), Math.random(), 1)    // 随机颜色
        border.width: 4
        color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1)
        radius: 20
    }

    Rectangle{
        id: rect3
        x:212;y:12
        width:76;height:96
        gradient: Gradient{
            GradientStop{position:0.0;color:'green'}    // 0表示顶部
            GradientStop{position:1.0;color:'slategray'}    // 1表示底部
        }

        border.color:'lightsteelblue'
        border.width: 4
        radius: 20
    }
    Text {
        id: text1
        y:100
        text: "The quick brown fox"
        color:"#303030"
        font.family: "Ubuntu"
        font.pixelSize:28
    }

    Text {
        id: text2
        width:100
        // elide: Text.ElideMiddle // 省略，为了使宽度与定义的宽度一致
        y:text1.y+text1.height+20

        text: "一个很长很长的句子 ！！！！！"
        style: Text.Sunken
        styleColor: '#FF4444'   // Style风格的颜色
        font.pixelSize: 20
        font.family: '宋体'

        color:"#FFFF33"

//        wrapMode: Text.WordWrap // 换行效果，但对符号不起作用
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere // 对符号也起作用
    }
}
