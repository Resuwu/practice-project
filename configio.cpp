#include "configio.h"

ConfigIO::ConfigIO() {}

QUrl ConfigIO::loadConfig()
{
    std::string str {};
    std::ifstream in("config");
    if (in.is_open()){
        getline(in, str);
    }
    in.close();
    QUrl url = QUrl::fromPercentEncoding(QByteArray::fromStdString(str));
    return url;
}

void ConfigIO::saveConfig(QUrl url)
{
    std::ofstream out("config");
    if (out.is_open()){
        out << url.toString().toStdString();
    }
    out.close();
}
