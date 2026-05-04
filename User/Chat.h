#ifndef CHAT_H
#define CHAT_H

#include <QObject>
#include "UserList.h"

class Chat : public QObject
{
    Q_OBJECT
    Q_PROPERTY(User *openedChatUser READ openedChatUser WRITE setOpenedChatUser NOTIFY openedChatUserChanged)
    Q_PROPERTY(User *mainUser READ mainUser CONSTANT)
public:
    Chat(QObject* parent);

    UserList *userList() const;

    User *openedChatUser() const;
    void setOpenedChatUser(User *newOpenedChatUser);

    User *mainUser() const;
    Q_INVOKABLE void sendMessage(const QString& message);

signals:
    void openedChatUserChanged();

private:
    UserList* m_userList;
    User* m_mainUser;
    User* m_openedChatUser;
};

#endif // CHAT_H
