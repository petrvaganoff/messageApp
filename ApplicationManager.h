#ifndef APPLICATIONMANAGER_H
#define APPLICATIONMANAGER_H

#include "User/Chat.h"
#include <QObject>

class ApplicationManager : public QObject
{
    Q_OBJECT
public:
    ApplicationManager(QObject *parent);
    ~ApplicationManager();
    Chat* chat() const;

private:
    Chat* m_chat;
};

#endif // APPLICATIONMANAGER_H
