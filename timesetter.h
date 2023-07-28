#ifndef TIMESETTER_H
#define TIMESETTER_H

#include <QObject>
#include <QVariant>
#include <ctime>

class TimeSetter : public QObject
{
    Q_OBJECT
public:
    explicit TimeSetter();
    Q_INVOKABLE QVariantList getAngles();
};

#endif // TIMESETTER_H
