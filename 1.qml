import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.2

//property containing the names of the buttons
Item {
    id: sidemenu
    anchors.fill:parent
    property var settingsModel: [
        {
            "title": "Item1",
            "settings": [
                'R',
                'O',
                'I',
                'S',
                'E',
                'W'
            ]
        },
        {
            "title": "Item2",

        },
        {
            "title": "Item3",

        },
        {
            "title": "Item4",

        },
        {
            "title": "Item5",

        }
    ]

    // Custom Graph Properties

     Flickable{
                id: flickable
                anchors.fill: parent
                contentHeight: root.implicitHeight
                boundsBehavior: Flickable.OvershootBounds

                Pane {
                    id: root
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -226
                    anchors.topMargin: 226
                    anchors.rightMargin: 9
                    anchors.leftMargin: 11

                    Column {
                        id: column
                        anchors.right: parent.right
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter



                        Repeater {
                            model: settingsModel
                            delegate: Column {
                                id: settingsColumn
                                property bool showList: false
                                anchors.left: parent.left
                                anchors.right: parent.right
                                Button {
                                    id: prueba
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    Text{
                                        id: textmodel
                                        text: modelData.title
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter

                                        color:'#ffffff'

                                    }
                                    background: Rectangle {
                                        id: settingsButtonBg
                                        opacity: enabled ? 1 : 0.3
                                        color:  "#0a1b2d"
                                        radius: 20 ;
                                    }
                                    contentItem: Text {
                                        color: "#ffffff"
                                    }
                                }
                                Pane {
                                    id: paneSettingsList

                                    // ## relevant part ##
                                    property bool shown: true
                                    visible: height > 0
                                    height: shown ? implicitHeight : 0
                                    Behavior on height {
                                        NumberAnimation {
                                            easing.type: Easing.InOutQuad
                                        }
                                    }
                                    clip: true
                                    // ## relevant part ##

                                    Material.background: "lightblue"
                                    padding: 0
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    Column {
                                        anchors.right: parent.right
                                        anchors.left: parent.left

                                        Repeater {
                                            id: listSettings1
                                            model: modelData.settings

                                            delegate: RadioDelegate {
                                                id: radioMaps
                                                Text{
                                                    anchors.verticalCenter: parent.verticalCenter
                                                    anchors.horizontalCenter: parent.horizontalCenter

                                                    id: radioMapsText
                                                    text: modelData
                                                }
                                                background: Rectangle {
                                                    color:  checked ? "#ffff00" : "#b3abab"
                                                    radius: 20 ;
                                                }
                                                checked: index == 0
                                                padding: 0
                                                width: parent.width
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
}
