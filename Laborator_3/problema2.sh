if [ ! -f "op.sh" ]; then
    echo "Error: op.sh nu exista!"
    exit 1
fi

source op.sh

# verificare numar argumente
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: $0 operand1 [operand2]"
    exit 1
fi

a=$1
b=$2

if [ $# -eq 1 ]; then
    echo "Converise:"
    echo "1) Decimal -> Hexa"
    echo "2) Hexa -> Decimal"

    read -p "Selecteaza operatia(1-2): " choice

    case $choice in
        1)
            result=$(dec_to_hex $a)
            echo "Resultat: $result"
            ;;
        2)
            result=$(hex_to_dec $a)
            echo "Resultat: $result"
            ;;
        *)
            echo "Program terminated."
            ;;
    esac

else
    menu
    read -p "Selecteaza operatia(1-5): " choice

    case $choice in
        1)
            result=$(add $a $b)
            echo "Resultat: $result"
            ;;
        2)
            result=$(subtract $a $b)
            echo "Resultat: $result"
            ;;
        3)
            result=$(multiply $a $b)
            echo "Resultat: $result"
            ;;
        4)
            result=$(divide $a $b)
            echo "Resultat: $result"
            ;;
        5)
            result=$(modulo $a $b)
            echo "Resultat: $result"
            ;;
        *)
            echo "Program terminated."
            ;;
    esac
fi
