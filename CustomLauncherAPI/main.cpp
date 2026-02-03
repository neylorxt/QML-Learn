#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "data.h"
#include "QApi.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));
    qputenv("QT_QUICK_CONTROLS_STYLE", QByteArray("Basic"));


    QGuiApplication app(argc, argv);

    QApi api;

    // XXXXXXXXXXXXXXX
    Data data;
    // XXXXXXXXXXXXXXX

    //qmlRegisterType<Data>("Data", 1,0, "Data");

    QQmlApplicationEngine engine;

    // XXXXXXXXXXXXXXX
    QQmlContext* rootContext = engine.rootContext();
    rootContext->setContextProperty("DataClass", &data);
    // XXXXXXXXXXXXXXX


    // QObject::connect(
    //     &engine,
    //     &QQmlApplicationEngine::objectCreationFailed,
    //     &app,
    //     []() { QCoreApplication::exit(-1); },
    //     Qt::QueuedConnection);
    // engine.loadFromModule("CustomLauncherAPI", "Main");

    // QObject::connect(&api, &QApi::QApiReady, [](const QJsonDocument& doc, int status){
    //     qDebug() << "OK status:" << status;
    //     qDebug() << doc.toJson(QJsonDocument::Indented);
    // });

    // QObject::connect(&api, &QApi::QApiReadyErrorOccurred, [](const QString& err, int status){
    //     qWarning() << "ERR status:" << status << err;
    // });

    // api.Get(QUrl("https://www.freetogame.com/api/games"));


    data.getGamesViaAPI();


    return app.exec();
}
