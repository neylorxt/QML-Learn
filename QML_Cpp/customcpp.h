#ifndef CUSTOMCPP_H
#define CUSTOMCPP_H

#include <QObject>

class CustomCpp : public QObject
{
    Q_OBJECT
public:
    explicit CustomCpp(QObject *parent = nullptr);

    Q_INVOKABLE QString getName() const;

signals:
};

#endif // CUSTOMCPP_H
