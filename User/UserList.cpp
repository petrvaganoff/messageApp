#include "UserList.h"

UserList::UserList(QObject *parent)
{
    // Добавить загрузку инфы по каждому контакту
    m_users.append(new User(1, "Karim", "Benzema", "qrc:/qt/qml/messageApp/Media/Images/benzema.jpg", this));
    m_users.append(new User(2, "Gianluigi", "Buffon", "qrc:/qt/qml/messageApp/Media/Images/buffon.jpg", this));
    m_users.append(new User(3, "Sergio", "Gomez", "qrc:/qt/qml/messageApp/Media/Images/gomez.jpg", this));
    m_users.append(new User(4, "Zlatan", "Ibrahimovic", "qrc:/qt/qml/messageApp/Media/Images/ibra.jpg", this));
    m_users.append(new User(5, "Lionel", "Messi", "qrc:/qt/qml/messageApp/Media/Images/messi.jpg", this));
    m_users.append(new User(6, "Roy", "Makaay", "qrc:/qt/qml/messageApp/Media/Images/nestelroy.jpg", this));
    m_users.append(new User(7, "Cristiano", "Ronaldo", "qrc:/qt/qml/messageApp/Media/Images/ronaldo.jpg", this));
    m_users.append(new User(8, "Wayne", "Rooney", "qrc:/qt/qml/messageApp/Media/Images/rooney.jpg", this));
    m_users.append(new User(9, "Francesco", "Totti", "qrc:/qt/qml/messageApp/Media/Images/totti.jpg", this));
    m_users.append(new User(10, "Thierry", "Henry", "qrc:/qt/qml/messageApp/Media/Images/henry.jpg", this));
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
