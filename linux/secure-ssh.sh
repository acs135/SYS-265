#secure-ssh.sh
#author aidan stewart
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
if [ "$EUID -ne 0 ]
	then echo "Please run as root"
	exit
fi

