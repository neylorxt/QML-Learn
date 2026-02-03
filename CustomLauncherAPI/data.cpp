#include "data.h"

Data::Data(QObject *parent)
    : QObject{parent}
{}

void Data::getGamesViaAPI(QString api)
{
    // Appel


    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    QNetworkRequest request((QUrl(api)));
    QNetworkReply *reply = manager->get(request);

    connect(reply, &QNetworkReply::finished, [=]() {
        if (reply->error() == QNetworkReply::NoError) {
            _gameList = parseGames(reply->readAll());
            emit gamesChanged();
        } else {
            qDebug() << "API error: " << reply->errorString()
            << " URL: " << request.url();
        }
        reply->deleteLater();
    });

    // END
}

QList<S_Game> Data::parseGames(const QByteArray &jsonData)
{
    QList<S_Game> games;
    QJsonDocument doc = QJsonDocument::fromJson(jsonData);

    if(!doc.isArray()) return games;

    QJsonArray myArray = doc.array();

    for( const QJsonValue& value : std::as_const(myArray)){
        QJsonObject obj = value.toObject();
        S_Game game;


        game.id = obj["id"].toInt();
        game.title = obj["title"].toString();
        game.thumbnail = obj["thumbnail"].toString();
        game.url = obj["url"].toString();
        game.short_description = obj["short_description"].toString();
        game.game_url = obj["game_url"].toString();
        game.genre = obj["genre"].toString();
        game.platform = obj["platform"].toString();
        game.publisher = obj["publisher"].toString();
        game.developer = obj["developer"].toString();
        game.release_date = obj["release_date"].toString();
        game.freetogame_profile_url = obj["freetogame_profile_url"].toString();

        games.append(game);
    }

    return games;

}

QVariantList Data::games() const
{
    QVariantList list;
    list.reserve(_gameList.size());

    for (const auto &g : _gameList) {
        QVariantMap m;
        m["id"] = g.id;
        m["title"] = g.title;
        m["thumbnail"] = g.thumbnail;
        m["url"] = g.url;
        m["short_description"] = g.short_description;
        m["game_url"] = g.game_url;
        m["genre"] = g.genre;
        m["platform"] = g.platform;
        m["publisher"] = g.publisher;
        m["developer"] = g.developer;
        m["release_date"] = g.release_date;
        m["freetogame_profile_url"] = g.freetogame_profile_url;
        list.append(m);
    }
    return list;
}

QVariantList Data::limitGames(int limit)
{
    QVariantList list;
    list.reserve(std::min(limit, static_cast<int>(_gameList.size())));

    const int maxCount = std::min(limit, static_cast<int>(_gameList.size()));
    for (int i = 0; i < maxCount; ++i) {
        const auto &g = _gameList[i];

        QVariantMap m;
        m["id"] = g.id;
        m["title"] = g.title;
        m["thumbnail"] = g.thumbnail;
        m["url"] = g.url;
        m["short_description"] = g.short_description;
        m["game_url"] = g.game_url;
        m["genre"] = g.genre;
        m["platform"] = g.platform;
        m["publisher"] = g.publisher;
        m["developer"] = g.developer;
        m["release_date"] = g.release_date;
        m["freetogame_profile_url"] = g.freetogame_profile_url;
        list.append(m);
    }
    return list;
}

