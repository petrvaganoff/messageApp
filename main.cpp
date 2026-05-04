#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ApplicationManager.h"

int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("123"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGTH", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
#endif
    }

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ApplicationManager* appManager = new ApplicationManager(&engine);

    engine.rootContext()->setContextProperty("QmlEngine", &engine);
    engine.rootContext()->setContextProperty("Chat", appManager->chat());
    engine.rootContext()->setContextProperty("Users", appManager->chat()->userList());

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("messageApp", "Main");

    return app.exec();
}
