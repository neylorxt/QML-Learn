#ifndef DATA_H
#define DATA_H

#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>
#include <QUrl>


#include <QObject>

struct S_Game {
    Q_GADGET

    Q_PROPERTY(int id READ getId CONSTANT)
    Q_PROPERTY(QString title READ getTitle CONSTANT)
    Q_PROPERTY(QString thumbnail READ getThumbnail CONSTANT)
    Q_PROPERTY(QString url READ getUrl CONSTANT)
    Q_PROPERTY(QString short_description READ getShortDescription CONSTANT)
    Q_PROPERTY(QString game_url READ getGameUrl CONSTANT)
    Q_PROPERTY(QString genre READ getGenre CONSTANT)
    Q_PROPERTY(QString platform READ getPlatform CONSTANT)
    Q_PROPERTY(QString publisher READ getPublisher CONSTANT)
    Q_PROPERTY(QString developer READ getDeveloper CONSTANT)
    Q_PROPERTY(QString release_date READ getReleaseDate CONSTANT)
    Q_PROPERTY(QString freetogame_profile_url READ getFreetogameProfileUrl CONSTANT)

public:
    int id;
    QString title;
    QString thumbnail;
    QString url;
    QString short_description;
    QString game_url;
    QString genre;
    QString platform;
    QString publisher;
    QString developer;
    QString release_date;
    QString freetogame_profile_url;

    int getId() const { return id; }
    QString getTitle() const { return title; }
    QString getThumbnail() const { return thumbnail; }
    QString getUrl() const { return url; }
    QString getShortDescription() const { return short_description; }
    QString getGameUrl() const { return game_url; }
    QString getGenre() const { return genre; }
    QString getPlatform() const { return platform; }
    QString getPublisher() const { return publisher; }
    QString getDeveloper() const { return developer; }
    QString getReleaseDate() const { return release_date; }
    QString getFreetogameProfileUrl() const { return freetogame_profile_url; }
};

class Data : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList games READ games NOTIFY gamesChanged)
public:
    explicit Data(QObject *parent = nullptr);

public:
    Q_INVOKABLE void getGamesViaAPI(QString api = "https://www.freetogame.com/api/games");
    QList<S_Game> parseGames( const QByteArray& jsonData);

    QVariantList games() const;

    Q_INVOKABLE QVariantList limitGames(int limit);




signals:
    void gamesChanged();

private:
    QList<S_Game> _gameList;
    QString _baseApi = "https://www.freetogame.com/api/games";
};

#endif // DATA_H
