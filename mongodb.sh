echo -e "\e[33m Copying the mongodb repo file\e[0m"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>/tmp/roboshop.log
echo -e "\e[33m Installing mongodb server\e[0m"
yum install mongodb-org -y &>>/tmp/roboshop.log
# Need to modify the config file
echo -e "\e[33m Updating the listen address of the Conf file\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
echo -e "\e[33m start the mongodb server\e[0m"
systemctl enable mongod &>>/tmp/roboshop.log
systemctl restart mongod &>>/tmp/roboshop.log