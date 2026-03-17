if [ "$1" = "1" ]; then
	./problem-1.sh
elif [ "$1" = "2" ]; then
	./problem-2.sh
else 
	echo "Nu exista scriptul cu numarul $1"
fi
