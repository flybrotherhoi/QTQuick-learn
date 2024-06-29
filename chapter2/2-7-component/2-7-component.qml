import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Component")

    Button{
        text: "开始"
        // color: "yellow"
        onClicked: {
            text1.text="按钮被点击"
        }
    }

    Text{
        id:text1
        x:12; y: 76
        text:"waiting......"
    }
}
