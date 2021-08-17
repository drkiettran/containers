# Containers
This project contains bash scripts for running some common tools using containers.

## mysql

### step 1: run mysql container:
From the command prompt of your VM:
```
./mysql.sh
```

### step 2: find out the 'ipaddress' of your container:
From the command prompt of your VM:
```shellscripts
docker inspect mysql | grep -i ipaddress
```

### step 3. need to login to your mysql container to create user and grant access.
From the command of your VM:

```
docker exec -it mysql bash
```

When you are inside the container, run this command:

```
[bash-4.2#] mysql -u root -ppassword
```

When you are inside 'mysql' client, run these commands:

```
[mysql>] create user 'student'@'%' identified by 'password';
[mysql>] grant all privileges on *.* to 'student'@'%';
[mysql>] flush privileges;
[mysql>] quit
```

### step 4: install mysql client
From the command prompt of your VM:
```
sudo apt install mysql-client-core-5.7
```

### step 5: connect to the mysql container:
From the command prompt of your VM, run this command where 172.17.0.2 is 
the IP address of your mysql container in `step 2` above:

```
mysql --host=172.17.0.2 -u student -ppassword
```

## ELFK (elastic, logstash, fluentd, and kibana)

Run them together in a network `cisc525-network`.

```bash
cd ~/cisc525/containers
./elasticsearch.sh
./logstash.sh
./fluentd.sh
./kibana.sh
```

Access to kibana via port 5061.
Optionally, add hostnames into /etc/hosts file. You can find out all the 
associated ip addresses using `docket network inspect cisc525-network`. 
A list of all service names and ip address are displayed.

## mongodb

1. Starts `mongodb` as `./mongodb.sh`.
2. Install Mongodb client as `sudo apt install -y mongodb-clients`
3. Run client `mongo`
