import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: page

    function loadInfo() {
        var params = 'q=' + encodeURIComponent(input) + '&target=' + encodeURIComponent(target)
        var xhr = new XMLHttpRequest();
        xhr.open('GET', "http://www.cbr.ru/scripts/XML_daily.asp"+params, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == XMLHttpRequest.DONE) {
                xmlmodel.xml = xhr.responseText;
            }
        }
        xhr.send();
    }

    XmlListModel {
        id: xmlmodel
        source: "http://www.cbr.ru/scripts/XML_daily.asp"
        query: "/ValCurs/Valute"
        XmlRole { name: "Name"; query: "Name/string()"; }
        XmlRole { name: "Value"; query: "Value/string()" }
    }

    SilicaListView {
        anchors.fill: parent
        header: PageHeader {title: "Сurrency rate"}
        model: xmlmodel
        delegate: Column {
            x: 10
            width: parent.width - 2 * x
            Label { width: parent.width; wrapMode: Text.WordWrap; text: Name }
            Label { width: parent.width; wrapMode: Text.WordWrap; text: Value }
        }
    }
    Component.onCompleted: loadInfo()
}
