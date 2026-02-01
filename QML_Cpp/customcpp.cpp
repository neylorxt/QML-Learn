#include "customcpp.h"

CustomCpp::CustomCpp(QObject *parent)
    : QObject{parent}
{}

QString CustomCpp::getName() const
{
    return QString("C++");
}
