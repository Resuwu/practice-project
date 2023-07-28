#ifndef CONFIGIO_H
#define CONFIGIO_H

#include <QObject>
#include <QQuickItem>
#include <fstream>
#include <string>

class ConfigIO : public QObject
{
    Q_OBJECT
public:
    explicit ConfigIO();
    Q_INVOKABLE QVariantList loadConfig();
    Q_INVOKABLE void saveConfig(QUrl url);
};

#endif // CONFIGIO_H
