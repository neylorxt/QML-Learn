import QtQuick 2.15
import QtQuick.Layouts

Item {
    id: sidebarItem
    width: 250
    Layout.fillHeight: true
    property ListModel dataCategoryItemModel: ListModel {
        ListElement {
            categoryType: 'GAMES'
            categoryIcon: "qrc:/icons/recent_sidebar_category.png"
            categoryName: "Recent"
            categoryItemsNumber: 0
            showCategoryItemsNumber: false
        }

        ListElement {
            categoryType: 'GAMES'
            categoryIcon: "qrc:/icons/owned_sidebar_category.png"
            categoryName: "Owned games"
            categoryItemsNumber: 497
            showCategoryItemsNumber: true
        }

        ListElement {
            categoryType: 'GAMES'
            categoryIcon: "qrc:/icons/installed_sidebar_category.png"
            categoryName: "Installed"
            categoryItemsNumber: 0
            showCategoryItemsNumber: true
        }
        ListElement {
            categoryType: 'FRIENDS'
            categoryIcon: "qrc:/icons/activity_sidebar_category.png"
            categoryName: "Activity"
            categoryItemsNumber: 0
            showCategoryItemsNumber: false
        }

        ListElement {
            categoryType: 'FRIENDS'
            categoryIcon: "qrc:/icons/friend_sidebar_category.png"
            categoryName: "Friends Online"
            categoryItemsNumber: 0
            showCategoryItemsNumber: true
        }

        ListElement {
            categoryType: 'DEALS'
            categoryIcon: "qrc:/icons/store_sidebar_category.png"
            categoryName: "Store"
            categoryItemsNumber: 0
            showCategoryItemsNumber: false
        }
        ListElement {
            categoryType: 'DEALS'
            categoryIcon: "qrc:/icons/more_offers_sidebar_category.png"
            categoryName: "More Offers"
            categoryItemsNumber: 0
            showCategoryItemsNumber: false
        }
        ListElement {
            categoryType: 'DEALS'
            categoryIcon: "qrc:/icons/orders_history_sidebar_category.png"
            categoryName: "Orders history"
            categoryItemsNumber: 0
            showCategoryItemsNumber: false
        }
    }

    // SIDEBAR
    Rectangle {
        id: sidebarDesktop
        width: parent.width
        height: parent.height
        color: '#09122C'

        // Header
        ColumnLayout {
            anchors.fill: parent

            // Header
            Rectangle {
                height: 50
                width: parent.width
                color: 'transparent'

                RowLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    spacing: 0

                    Rectangle {
                        width: 25
                        height: 25
                        Layout.leftMargin: 15
                        color: "transparent"

                        Image {
                            id: icon_settings
                            source: "qrc:/icons/icon_settings.png"
                            width: parent.width
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                            opacity: 0.5
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }

                    Rectangle {
                        width: 25
                        height: 25
                        Layout.rightMargin: 15
                        color: "transparent"

                        Image {
                            id: icon_loop
                            source: "qrc:/icons/icon_loop.png"
                            width: parent.width
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                            opacity: 0.5
                        }
                    }
                }
            }

            // Body
            Rectangle {
                Layout.fillHeight: true
                width: parent.width
                color: 'transparent'

                Column {
                    height: parent.height
                    width: parent.width
                    spacing: 0

                    SidebarCategoryItem {
                        categoryTitle: "GAMES"
                        dataCategoryItemModel: getCategoryDataByCategoryType(
                                                   'GAMES')
                    }

                    SidebarCategoryItem {
                        categoryTitle: "FRIENDS"
                        dataCategoryItemModel: getCategoryDataByCategoryType(
                                                   'FRIENDS')
                    }

                    SidebarCategoryItem {
                        categoryTitle: "DEALS"
                        dataCategoryItemModel: getCategoryDataByCategoryType(
                                                   'DEALS')
                    }
                }
            }
        }
    }
    function getCategoryDataByCategoryType(category) {
        var arrayReturn = Qt.createQmlObject('import QtQml 2.15; ListModel {}',
                                             parent)

        for (var i = 0; i < sidebarItem.dataCategoryItemModel.count; ++i) {
            var data = sidebarItem.dataCategoryItemModel.get(i)

            if (data.categoryType === category) {
                arrayReturn.append(data)
            }
        }

        return arrayReturn
    }
}
