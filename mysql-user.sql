CREATE USER 'osas'@'%' IDENTIFIED WITH mysql_native_password BY 'admin123';
GRANT ALL PRIVILEGES ON * . * TO 'osas'@'%';
FLUSH PRIVILEGES;
