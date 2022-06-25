# How to Use

To build the pando-mock-sftp use the below command in the directory of Dockerfile

```
docker build -t pando-sftp .
```

Once the build is successful, execute the below command to run the container. This will serve the SFTP server through port 22 and http server through port 8000

```
docker run -p 22:22 -p 8000:8000 -d pando-sftp testuser:test
```

SFTP server can be accessed through command-line utility 'sftp'. The below is the command to connect to the sftp server from command-line. After that enter the password from the docker run command to connect to the sftp server

```
sftp -P 22 testuser@127.0.0.1
```

Below are the commands to interact with the sftp server content and local machine content

```
ls, pwd, cd - remote (SFTP)
lls, lpwd, lcd - local
```

Below is the command for retrieving the file from sftp server

```
get <filename>
```

Below is the command to upload data to the sftp server

```
put <filename>
```

Uploaded files are server by python http server which can be accessed through the browser using the below URL

```
http://localhost:8000
```

This repository is forked from https://github.com/atmoz/sftp
