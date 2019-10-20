import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    allowedOrientations: Orientation.All

    SilicaFlickable {
        anchors.fill: parent
        PullDownMenu {
            MenuItem {
                text: qsTr("Task 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
            MenuItem {
                text: qsTr("Task 3")
                onClicked: pageStack.push(Qt.resolvedUrl("Task_3.qml"))
            }
            MenuItem {
                text: qsTr("Task 4")
                onClicked: pageStack.push(Qt.resolvedUrl("Task_4.qml"))
            }
            MenuItem {
                text: qsTr("Task 5")
                onClicked: pageStack.push(Qt.resolvedUrl("Task_5.qml"))
            }
        }

        contentHeight: column.height

         ListModel {
             id: datamodel
             ListElement {color: "orange"; text: "orange"; }
             ListElement {color: "blue"; text: "blue"; }
             ListElement {color: "red"; text: "red"}
         }
         SilicaListView {
             anchors.fill:  parent
             header: PageHeader {title: "Task 1"}
             model: datamodel
             delegate: Rectangle {
                 width: parent.width
                 height: 100
                 color: model.color
                 Text {
                     anchors.centerIn: parent
                     text: model.text
                 }
             }
         }
    }
}
