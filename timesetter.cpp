#include "timesetter.h"

TimeSetter::TimeSetter() {}

QVariantList TimeSetter::getAngles()
{
    QVariantList list;
    time_t now = std::time(0);
    tm *time = std::localtime(&now);
    int sec = (time->tm_sec)*6;
    int minute = ((time->tm_min)*60+sec)/10;
    int hour = (((time->tm_hour)*3600+(minute*10))%43200)/120;
    list.append(sec);
    list.append(minute);
    list.append(hour);
    return list;
}
