#include "Chat.h"
#include "Message.h"

Chat::Chat(QObject *parent) :
    QObject(parent),
    m_userList(new UserList(this)),
    m_mainUser(new User(0, "Petr", "Vaganov", "qrc:/qt/qml/messageApp/Assets/Images/ThierryHenry.jpg", this)),
    m_openedChatUser(nullptr)
{
}

UserList *Chat::userList() const
{
    return m_userList;
}

User *Chat::openedChatUser() const
{
    return m_openedChatUser;
}

void Chat::setOpenedChatUser(User *newOpenedChatUser)
{
    if (m_openedChatUser == newOpenedChatUser)
        return;
    m_openedChatUser = newOpenedChatUser;
    emit openedChatUserChanged();
}

User *Chat::mainUser() const
{
    return m_mainUser;
}

void Chat::sendMessage(const QString &message)
{
    if (m_openedChatUser == nullptr)
        return;
    m_openedChatUser->addMessage(new Message(message, m_mainUser->ID(), m_openedChatUser));
}
