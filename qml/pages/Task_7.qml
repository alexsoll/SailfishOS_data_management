import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import Nemo.Configuration 1.0

Page {
    id: page
    ConfigurationValue {
        id: setting
        key: "/apps/app_name/setting_name";
        defaultValue: "Setting"
    }
    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 30
        PageHeader { title: "Settings" }
        TextField {
            width: parent.width
            id: txtfield
            placeholderText: "Enter setting value"
        }
        Label {
            text: setting.value + " is saved"
        }
        Button {
            width: parent.width
            text: "Save setting"
            onClicked: setting.value = txtfield.text
        }
    }
}
