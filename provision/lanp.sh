#Lamp Provision Shell Script for Ubuntu


# Add PHP 5.4 Repository
sudo add-apt-repository ppa:ondrej/php5
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update -y
sudo apt-get upgrade -y

# Install PHP 5.4 and PHP-FPM and supported modules
sudo apt-get install -y php5
sudo apt-get install -y php5-fpm
sudo apt-get install -y libapache2-mod-fastcgi
sudo apt-get install -y php5-mysql php5-curl php5-gd php5-intl php5-imap php5-mcrypt php5-memcached php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc
#sudo apt-get install -y php5-ming 
#sudo apt-get install -y php5-xcache

sudo add-apt-repository ppa:brianmercer/nginx


#Install NGINX for serving static files
sudo apt-get install -y nginx
sudo apt-get update -y
sudo apt-get install -y nginx-custom

#Install Apache
sudo apt-get install -y apache2
sudo apt-get install -y apache2-utils
sudo apt-get install -y build-essential

# Install APC OPCODE CACHE
sudo apt-get install -y php-apc

# Restart Services and enable modules for Apache
sudo service php5-fpm restart
#sudo a2enmod actions fastcgi alias
sudo a2enmod rewrite


sudo curl -s http://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer.phar
alias composer='/usr/local/bin/composer.phar'

#Install Git
sudo apt-get install -y git

#install node

#sudo apt-get install -y python-software-properties python g++ make
#sudo apt-get -y update
#sudo apt-get -y install nodejs


# Move Configuration files

sudo cp /vagrant/config/nginx/default /etc/nginx/sites-available/default
sudo cp /vagrant/config/nginx/nginx.conf /etc/nginx/nginx.conf
sudo cp /vagrant/config/apache/ports.conf /etc/apache2/ports.conf
sudo cp /vagrant/config/cron/trapeze /var/spool/cron/crontabs/root
sudo chmod 755 /var/spool/cron/crontabs/root
sudo chmod +x /var/spool/cron/crontabs/root
sudo chown root /var/spool/cron/crontabs/root
#sudo cp /vagrant/defaults/mysql/my.cnf /etc/mysql/my.cnf
sudo service apache2 restart
sudo service nginx start

sudo mkdir /var/scripts
sudo mkdir /var/scripts/trapeze


sudo git clone https://github.com/shawnhilgart/trapeze.git /var/scripts/trapeze
sudo chmod 7777 /var/scripts/trapeze/storage
sudo mkdir /var/scripts/trapeze/storage
cd /var/scripts/trapeze
sudo php /usr/local/bin/composer.phar update
sudo php /usr/local/bin/composer.phar install

sudo php /var/scripts/trapeze/trapeze sites:scan
#sudo echo "Done"
#exit