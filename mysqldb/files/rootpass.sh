#script to grep the root user password after the mysql is started and updtaing the root user password
#!/bin/bash

new_password="Hadoop123!"

# retrieve the random password set by mysql during startup
mysql_password=$(cat /var/log/mysqld.log | grep "A temporary password is generated for" | tail -1 | sed -n 's/.*root@localhost: //p')

# change the root password
#mysqladmin --user="root" --password=">Zte;6F+2=8t" password 'Hadoop123!'
mysqladmin -uroot -p$mysql_password password $new_password
