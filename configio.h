#ifndef CONFIGIO_H
#define CONFIGIO_H

#include <QObject>
#include <QQuickItem>
#include <iostream>

class ConfigIO : public QObject
{
    Q_OBJECT
public:
    explicit ConfigIO(QObject *parent = nullptr);
    int loadConfig();
    int saveConfig();
};

#endif // CONFIGIO_H
