#!/bin/bash

# ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
# CREATE USER 'admin'@'localhost' IDENTIFIED WITH caching_sha2_password BY 'senha';
# GRANT ALL PRIVILEGES ON * . * TO 'admin'@'localhost' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# mysql_config_editor set --login-path=client --host=localhost --user=admin --password

__wcs_configure_percona() {
	yay -S --needed  percona-server percona-server-clients mycli
	local plugin_dir="/usr/lib/perconaserver/plugin/"
	local conf_file="/etc/mysql/my.cnf"
	local log_file=$(sudo rg log-error --no-line-number "$conf_file" | awk '{print $3}')
	echo -e "\nplugin-load-add=auth_socket.so" | sudo tee -a "$conf_file" > /dev/null
	sudo touch "$log_file"
	sudo chmod 750 "$log_file"
	sudo chown mysql:mysql "$log_file"
	sudo mysqld --initialize --user=mysql
	sudo systemctl reset-failed
	sudo systemctl start mysqld
	sudo rg password "$log_file" | awk '{print $NF}' | clipcopy
	sudo mysql_secure_installation
}

__wcs_configure_percona
unset -f __wcs_configure_percona

