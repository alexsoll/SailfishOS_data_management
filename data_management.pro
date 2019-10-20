# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = data_management

CONFIG += sailfishapp

SOURCES += src/data_management.cpp

DISTFILES += qml/data_management.qml \
    qml/cover/CoverPage.qml \
    qml/pages/Dao.qml \
    qml/pages/FirstPage.qml \
    qml/pages/SecondPage.qml \
    qml/pages/Task_3.qml \
    qml/pages/Task_4.qml \
    qml/pages/Task_5.qml \
    qml/pages/Task_6.qml \
    qml/pages/Task_7.qml \
    qml/pages/Task_8.qml \
    rpm/data_management.changes.in \
    rpm/data_management.changes.run.in \
    rpm/data_management.spec \
    rpm/data_management.yaml \
    translations/*.ts \
    data_management.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/data_management-de.ts
