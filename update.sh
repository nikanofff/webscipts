#!/bin/bash
# Author rygBuH
###################
echo "Поехали!"
sleep 5
apt-get update && apt-get upgrade -y
apt-get update && apt-get dist-upgrade -y
apt-get install screen -y
apt-get install htop -y
apt-get install sudo -y
sudo tasksel install lamp-server
apt-get install phpmyadmin -y
chown -R www-data:www-data /var/www/

clear

echo "Веб сервер поставлен...... Поехали дальше!"
sleep 10
echo "Теперь настроим виртуальные хосты!"
sleep 10
##################

#cp /root/update/hosts /etc/hosts
#nano /etc/hosts
mkdir /var/www/bs-public.ru
mkdir /var/www/test.bs-public.ru
mkdir /var/www/mail.bs-public.ru
mkdir /var/www/stats.bs-public.ru
mkdir /var/www/up.bs-public.ru
mkdir /var/www/up.bs-public.ru/dll
mkdir /var/www/up.bs-public.ru/dll/server
mkdir /var/www/up.bs-public.ru/dll/scripts
mkdir /var/www/sbans.bs-public.ru

clear
sleep 5

cp /root/update/cfg/bs-public.ru.conf /etc/apache2/sites-available/bs-public.ru.conf
cp /root/update/cfg/test.bs-public.ru.conf /etc/apache2/sites-available/test.bs-public.ru.conf
cp /root/update/cfg/mail.bs-public.ru.conf /etc/apache2/sites-available/mail.bs-public.ru.conf
cp /root/update/cfg/sbans.bs-public.ru.conf /etc/apache2/sites-available/sbans.bs-public.ru.conf
cp /root/update/cfg/stats.bs-public.ru.conf /etc/apache2/sites-available/stats.bs-public.ru.conf
cp /root/update/cfg/up.bs-public.ru.conf /etc/apache2/sites-available/up.bs-public.ru.conf
a2ensite bs-public.ru.conf
service apache2 reload
a2ensite test.bs-public.ru.conf
service apache2 reload
a2ensite mail.bs-public.ru.conf
service apache2 reload
a2ensite sbans.bs-public.ru.conf
service apache2 reload
a2ensite stats.bs-public.ru.conf
service apache2 reload
a2ensite up.bs-public.ru.conf
service apache2 reload
a2enmod rewrite
service apache2 reload
a2dissite 000-default.conf
service apache2 reload

clear

echo "Веб сервер поставлен!"
sleep 10




