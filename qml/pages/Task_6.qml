import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: page
    TextField {
        id: txtfield
        width: parent.width * 2 / 3
        anchors.horizontalCenter: parent.horizontalCenter
        placeholderText: "Enter the text.."
    }
    Button {
        id: createButton
        text: "Create the note"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: txtfield.bottom
        onClicked: {
            dao.insertBook("Admin", txtfield.text)
            selectBooks();
        }
    }

    Dao { id: dao }
    SilicaListView {
        //anchors.fill: parent
        anchors.top: createButton.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        header: PageHeader {title: "OneNote"}
        model: ListModel { id: booksListModel }
        delegate: ListItem {
            onClicked: {
                deleteNote(index);
            }
            Label {
                text: title
            }
        }
    }
    function selectBooks() {
        booksListModel.clear();
        dao.retrieveBooks(function(books) {
            for(var i=0; i<books.length;i++) {
                var book = books.item(i);
                booksListModel.append({id:book.id,author: book.author, title: book.title});
            }
        dao.get_length();
        });
    }
    function deleteNote(index) {
        booksListModel.clear();
        dao.retrieveBooks(function(books) {
            var book = books.item(index);
            dao.deleteBook(book.id);
            selectBooks();
        });
    }
    Component.onCompleted: selectBooks()
}
