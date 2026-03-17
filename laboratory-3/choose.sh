if [ "$1" = "2" ]; then
	./problem-2.sh $2 $3
elif [ "$1" = "3" ]; then
	./problem-3.sh
else 
	echo "Invalid option"
fi
