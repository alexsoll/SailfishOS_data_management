import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent
        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: qsTr("Task 2")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
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
