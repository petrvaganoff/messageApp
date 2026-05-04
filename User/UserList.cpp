#include "UserList.h"

UserList::UserList(QObject *parent)
    : QObject(parent)
{
    // Добавить загрузку инфы по каждому контакту
    m_users.append(new User(1, "Karim", "Benzema", "qrc:/qt/qml/messageApp/Assets/Images/KarimBenzema.jpg", this));
    m_users.append(new User(2, "Gianluigi", "Buffon", "qrc:/qt/qml/messageApp/Assets/Images/GianluigiBuffon.jpg", this));
    m_users.append(new User(3, "Sergio", "Gomez", "qrc:/qt/qml/messageApp/Assets/Images/SergioGomez.jpg", this));
    m_users.append(new User(4, "Zlatan", "Ibrahimovic", "qrc:/qt/qml/messageApp/Assets/Images/ZlatanIbrahimovic.jpg", this));
    m_users.append(new User(5, "Lionel", "Messi", "qrc:/qt/qml/messageApp/Assets/Images/LionelMessi.jpg", this));
    m_users.append(new User(6, "Roy", "Makaay", "qrc:/qt/qml/messageApp/Assets/Images/RoyMakaay.jpg", this));
    m_users.append(new User(7, "Cristiano", "Ronaldo", "qrc:/qt/qml/messageApp/Assets/Images/CristianoRonaldo.jpg", this));
    m_users.append(new User(8, "Wayne", "Rooney", "qrc:/qt/qml/messageApp/Assets/Images/WayneRooney.jpg", this));
    m_users.append(new User(9, "Francesco", "Totti", "qrc:/qt/qml/messageApp/Assets/Images/FrancescoTotti.jpg", this));
    m_users.append(new User(10, "Thierry", "Henry", "qrc:/qt/qml/messageApp/Assets/Images/ThierryHenry.jpg", this));
    m_users.append(new User(11, "Andrey", "Arshavin", "qrc:/qt/qml/messageApp/Assets/Images/AndreyArshavin.jpeg", this));
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
