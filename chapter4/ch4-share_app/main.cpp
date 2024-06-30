#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QFileSelector>
#include <QFile>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("Fusion");

    QQmlApplicationEngine engine;

    QFileSelector selector;
    QFile defaultsFile(selector.select("ch4-share/Main.qml"));
    qDebug()<<defaultsFile.fileName();

    if(defaultsFile.fileName().contains("+android")){
        QQuickStyle::setStyle("Material");
    }

    const QUrl url(defaultsFile.fileName());
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
