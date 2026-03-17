if [ "$1" = "2" ]; then
	./problema2.sh $2 $3
elif [ "$1" = "3" ]; then
	./problema3.sh
else 
	echo "Nu exista scriptul cu numarul $1"
fi
