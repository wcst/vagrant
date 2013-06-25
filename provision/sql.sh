echo mysql-server mysql-server/root_password password strangehat | sudo debconf-set-selections
echo mysql-server mysql-server/root_password_again password strangehat | sudo debconf-set-selections

sudo apt-get update -y
sudo apt-get install -y mysql-server

sudo /etc/init.d/mysql stop
sudo cp /vagrant/config/mysql/my.cnf /etc/mysql/my.cnf
sudo /etc/init.d/mysql start

mysql -u root "-pstrangehat" "mysql" < /vagrant/config/mysql/user.sql