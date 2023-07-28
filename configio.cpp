#include "configio.h"

ConfigIO::ConfigIO() {}

QVariantList ConfigIO::loadConfig()
{
    QVariantList list;
    std::string str {};
    std::ifstream in("config");
    if (in.is_open()){
        getline(in, str);
    }
    in.close();
    QUrl url = QUrl::fromPercentEncoding(QByteArray::fromStdString(str));
    list.append(url);
    list.append(!url.isEmpty());
    return list;
}

void ConfigIO::saveConfig(QUrl url)
{
    std::ofstream out("config");
    if (out.is_open()){
        out << url.toString().toStdString();
    }
    out.close();
}
