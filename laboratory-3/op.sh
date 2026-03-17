# operatii matematice
add() {
    echo $(($1 + $2))
}

subtract() {
    echo $(($1 - $2))
}

multiply() {
    echo $(($1 * $2))
}

divide() {
    if [ $2 -eq 0 ]; then
        echo "Error: division by zero"
    else
        echo $(($1 / $2))
    fi
}

modulo() {
    echo $(($1 % $2))
}

menu() {
    echo "1. Addition (+)"
    echo "2. Subtraction (-)"
    echo "3. Multiplication (*)"
    echo "4. Division (/)"
    echo "5. Modulo (%)"
    echo "Any other option - Exit"
}

# functii conversie folosind bc
dec_to_hex() {
    echo "obase=16; $1" | bc
}

hex_to_dec() {
    echo "ibase=16; $1" | bc
}

menu_conv() {
    echo "1. Decimal -> Hexadecimal"
    echo "2. Hexadecimal -> Decimal"
    echo "Any other option - Exit"
}