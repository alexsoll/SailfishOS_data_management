import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

Page {
    id: page

    Dao { id: dao }
    SilicaListView {
        model: ListModel { id: booksListModel}
        delegate: ListItem {
            Label {
                text: title + "by" + author
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
        });
    }

    Component.onCompleted: selectBooks()
}
