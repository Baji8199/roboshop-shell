echo -e "\e[33m Installing Nginx Server\e[0m"
yum install nginx -y

echo -e "\e[33m Removing old app content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[33m Downloading Frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[33m Extracting Frontend Content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[33m Starting Nginx Service\e[0m"
# Need to add the config file
systemctl enable nginx
systemctl restart nginx