#!/bin/bash

# functions for problem 1

get_base_name() {
    local basename="$1"
    basename="${basename%.*}"
    echo "$basename"
}

show_error_file() {
    local error_message="$1"

    if [ -f "$error_message" ] && [ -s "$error_message" ]; then
        echo "Error: $(<"$error_message")"
    else
        echo "No error message found."
    fi

    echo "Press Enter to continue..."
    read -r
}

edit_source_file() {
    if [ ! -f "$1" ]; then
        echo "Source file $1 does not exist."
        echo "Will create a new file named $1."
        touch "$1"
        return 1
    fi

    echo "Opening $1 for editing..."
    vim "$1"
}

compile_and_run() {
    local source_file="$1"
    local executable="$2"
    local error_file="${executable}.error"

    if [[ "$source_file" == *.cpp ]]; then
        g++ "$source_file" -o "$executable" 2>"$error_file"
    elif [[ "$source_file" == *.c ]]; then
        clang "$source_file" -o "$executable" 2>"$error_file"
    else
        echo "Unsupported file type"
        return 1
    fi

    if [ $? -ne 0 ]; then
        show_error_file "$error_file"
        return 1
    fi

    ./"$executable"
}

run_program() {
    base_name=$(get_base_name "$1")
    executable="$base_name.out"

    if [ -x "$executable" ]; then
        ./"$executable"
    else
        echo "Executable $executable not found. Compiling..."
        compile_and_run "$1" "$executable"
    fi

    echo "Press Enter to continue..."
    read -r
}

show_menu() {
    echo "1. Edit source file"
    echo "2. Compile and run"
    echo "3. Show compilation errors"
    echo "4. Exit"
    echo -n "Choose an option: "
}

main() {
    read -rp "Introdu numele fisierului sursa: " source_file

    while true; do
        echo
        show_menu
        read -r choice
        echo

        case "$choice" in
            1)
                edit_source_file "$source_file"
                ;;
            2)
                run_program "$source_file"
                ;;
            3)
                base_name=$(get_base_name "$source_file")
                error_file="${base_name}.out.error"
                show_error_file "$error_file"
                ;;
            4)
                echo "Exiting..."
                break
                ;;
            *)
                echo "Optiune invalida. Incearca din nou."
                ;;
        esac
    done
}

# end of functions for problem 1
# functions for problem 2