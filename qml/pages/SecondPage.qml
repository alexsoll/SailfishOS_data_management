import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All
    ListModel {
        id: datamodel
    }
    //SilicaFlickable {
    SilicaListView {
        id: lst
        width: parent.width;
        height: parent.height - addButton.height
        property int num_remove_item: 0
        //header: PageHeader {title: "List"}
        model: datamodel
        delegate:
            Rectangle {
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        datamodel.remove(model.index, 1);
                        lst.num_remove_item = lst.num_remove_item + 1;
                    }
                }
                width: parent.width
                height: 70
                border.color: "black"
                border.width: 5
                color: "skyblue"
                Text {
                    anchors.centerIn: parent
                    text: model.text// + model.index
                }
            }
    }
    Button {
        property int tmp: datamodel.count+lst.num_remove_item
        id: addButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "add item"
        onClicked: datamodel.append({text: "Item #"+tmp})
    }
}
