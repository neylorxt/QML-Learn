#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "customcpp.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // rendre accessible ma class --> QML
    qmlRegisterType<CustomCpp>("CustomCpp", 1,0, "CustomCpp");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QML_Cpp", "Main");

    return app.exec();
}
