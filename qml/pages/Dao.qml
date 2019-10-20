import QtQuick.LocalStorage 2.0
import QtQuick 2.0

Item {
    property var db;

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("books", "1.0");
        createBooksTable();
    }
    function createBooksTable() {
        db.transaction(function(tx) {
            tx.executeSql("CREATE TABLE IF NOT EXISTS books(
              id INTEGER PRIMARY KEY AUTOINCREMENT,"
              + "author TEXT NOT NULL, title TEXT NOT NULL);");
        });
    }
    function retrieveBooks(callback) {
        db.readTransaction(function(tx) {
           var result = tx.executeSql("SELECT * FROM books;");
            callback(result.rows);
        });
    }
    function insertBook(author, title) {
        db.readTransaction(function(tx) {
           var result = tx.executeSql("INSERT INTO books (author,title) VALUES(?,?);", [author,title]);
        });
    }
}
