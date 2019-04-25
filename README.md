# DBS-Project

## Dependencies
### Git LFS (to clone repository)
https://git-lfs.github.com/

### MySQL
#### Configuration
- Install mysql-server : **Do not** choose `strong password encryption`
- Run mysql-server as root with `sudo mysql -u root` (MacOS : `mysql -u root -p` with password from configuration)
- Create a new user with `GRANT ALL PRIVILEGES ON *.* TO 'Group32'@'localhost' IDENTIFIED BY '1234';` in mysql-server shell
- (On MacOS first create user `CREATE USER 'Group32'@'localhost' IDENTIFIED BY '1234';` then grand it `GRANT ALL PRIVILEGES ON *.* TO 'Group32'@'localhost';`)

#### Commands
##### Linux
- Start : `sudo service mysql start`
- Stop : `sudo service mysql stop`
- Status : `sudo service mysql status`

##### MacOS
- Start : `sudo launchctl load -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist`
- Stop : `sudo launchctl unload -F /Library/LaunchDaemons/com.oracle.oss.mysql.mysqld.plist`
- Status : `sudo launchctl list | grep mysql`

### Python MySQL (with Python 3.7)
#### Installation
`python -m pip install mysql-connector`

#### Tutorial
https://www.w3schools.com/python/python_mysql_getstarted.asp

## Interface
### How to run it
- Start server (see `Commands`)
- Make sure user `Group32` with password `1234` has all privileges
- Launch app with `python3 main.py` in `Interface/`

### Warning
- Once working, the connection is assumed to be stable.
- Database Airbnb should be created automatically
- Tables should be created automatically
- Tables should be populated automatically : Takes about 20min (blocking)
- Have a look at the top of the window to know about connection status
- Have a look at the terminal to see the last activities
