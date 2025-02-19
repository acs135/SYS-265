#secure-ssh.sh
#author aidan stewart
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

if [ "$#" -ne 1 ]
	then echo "Usage: $0 <username>"
	exit
fi

useradd -ms /bin/bash $1
mkdir /home/$1/.ssh
curl -o /home/$1/.ssh/authorized_keys https://raw.githubusercontent.com/acs135/SYS-265/refs/heads/main/linux/public-keys/id_rsa.pub
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
