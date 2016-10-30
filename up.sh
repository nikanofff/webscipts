#!/bin/bash
# Автор rygBuH для Дяде Кости и Дяде Серёжки

clear
echo "Даныый скрипт установит всё необходимое \nдля RUST сервера. Только \nнужно запастись терпением ну и кофе или чипсами ...гы..."
sleep 15
apt-get update && upgrade -y
apt-get install htop -y
apt-get install sudo -y
sudo dpkg --add-architecture i386; sudo apt-get update; sudo apt-get install tmux mailutils postfix ca-certificates curl file lib32gcc1 libstdc++6 libstdc++6:i386 -y
sudo apt-get install tmux mailutils postfix ca-certificates curl file libstdc++6 -y
echo "deb http://ftp.debian.org/debian sid main" >> /etc/apt/sources.list.d/sid.list
apt-get update -y
apt-get -t sid install libc6 libc6-dev libc6-dbg -y
rm /etc/apt/sources.list.d/sid.list && apt-get update -y

clear
echo "При создании пользователя нужно ввести пароль "rustserver" без кавычек!!!"
sleep 15
adduser rustserver
echo "Пользователь создан. Приступаем к установке сервера"
sleep 10
cd /home/rustserver
echo 'Пользователь rustserver создан. Приступаем к установке сервера'
su -c 'wget http://up.bs-public.ru/dll/scripts/rustserver' rustserver 
su -c 'chmod +x rustserver' rustserver 
echo 'Оасталось нажать 1 раз Enter после начала установки и можно пойти кофе попить, или занятся какой нить фигнёй)'
sleep 10
su -c './rustserver install' rustserver 
echo 'Осталось чуток поправить конфиг. \nНеобходимо заменить updateonstart="off на on" \nи ip="0.0.0.0 изменить на 212.109.192.39". После изменения нажать сочетания \nклавишь ctrl+O -> Enter -> CTRL+X'
sleep 45
su -c 'nano rustserver' rustserver 
su -c './rustserver start' rustserver