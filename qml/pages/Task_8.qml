import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page
    ConfigurationGroup {
        id: settings;
        path: "/apps/app_name/setting";
        property bool set: false;
    }
    TextField {
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        id: txtfield
        placeholderText: "Enter setting value"
    }
    Label {
        id: lb
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: txtfield.bottom
        text: ""
    }
    Button {
        id: setButton
        width: parent.width
        text: "Set"
        anchors.top: lb.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            settings.set = true
            lb.text = txtfield.text + " ready to save"
        }
    }
    Button {
        width: parent.width
        anchors.top: setButton.bottom
        anchors.margins: 10
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Save"
        onClicked: {
            settings.setValue(settings.set, txtfield.text)
            lb.text = "Setting " + txtfield.text + " is saved"
        }
    }

}
