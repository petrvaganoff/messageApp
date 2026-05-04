#include "UserList.h"

UserList::UserList(QObject *parent)
{
    // Добавить загрузку инфы по каждому контакту
    m_users.append(new User(1, "Marco", "Stanoevich", "", this));
    m_users.append(new User(2, "Vanga", "Murato", "", this));
    m_users.append(new User(3, "Alexandro", "Levin", "", this));
    m_users.append(new User(4, "Ubabo", "Doni", "", this));
    m_users.append(new User(5, "Murad", "Vernardoo", "", this));
    m_users.append(new User(6, "Olla", "Puichetti", "", this));
    m_users.append(new User(7, "Mario", "Checcigory", "", this));
    m_users.append(new User(8, "Don", "Pablo", "https://s1.coincarp.com/logo/1/don-pablo.png?style=200", this));
}

const QList<User *> &UserList::users() const
{
    return m_users;
}

void UserList::setUsers(const QList<User *> &newUsers)
{
    if (m_users == newUsers)
        return;
    m_users = newUsers;
    emit usersChanged();
}
