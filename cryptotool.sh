#!/bin/bash

# Function to handle ROT13 (Symmetrical)
process_rot13() {
    echo "$1" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

# Function to handle Base64
process_base64() {
    if [ "$1" == "enc" ]; then
        echo -n "$2" | base64
    else
        echo -n "$2" | base64 -d 2>/dev/null || echo "Error: Invalid Base64 string."
    fi
}

# Function to handle Hex
process_hex() {
    if [ "$1" == "enc" ]; then
        echo -n "$2" | xxd -p
    else
        echo -n "$2" | xxd -r -p 2>/dev/null || echo "Error: Invalid Hex string."
    fi
}

# Function to handle Binary
process_binary() {
    if [ "$1" == "enc" ]; then
        echo -n "$2" | perl -lape '$_=unpack"B*" '
    else
        echo -n "$2" | perl -lape '$_=pack"B*",$_' 2>/dev/null || echo "Error: Invalid Binary string."
    fi
}

while true; do
    clear
    echo "====================================="
    echo "       Kali Crypto & Encoding Tool   "
    echo "====================================="
    echo " 1) Encrypt / Encode"
    echo " 2) Decrypt / Decode"
    echo " 3) Exit"
    echo "====================================="
    read -p "Choose an option [1-3]: " mode_choice

    if [ "$mode_choice" -eq 3 ]; then
        echo "Goodbye!"
        exit 0
    elif [ "$mode_choice" -eq 1 ]; then
        mode="enc"
        mode_text="Encryption/Encoding"
    elif [ "$mode_choice" -eq 2 ]; then
        mode="dec"
        mode_text="Decryption/Decoding"
    else
        echo "Invalid option. Press Enter to try again."
        read -r
        continue
    fi

    clear
    echo "====================================="
    echo "       Mode: $mode_text"
    echo "====================================="
    echo " 1) ROT13"
    echo " 2) Base64"
    echo " 3) Hexadecimal"
    echo " 4) Binary (0101...)"
    echo " 5) Go Back"
    echo "====================================="
    read -p "Select Algorithm [1-5]: " algo_choice

    if [ "$algo_choice" -eq 5 ]; then continue; fi

    echo ""
    read -r -p "Paste your text here > " user_input
    if [ -z "$user_input" ]; then
        echo "Input cannot be empty. Press Enter to return."
        read -r
        continue
    fi

    echo "-------------------------------------"
    echo -ne "Result > \e[1;32m" # Switch to bold green

    case $algo_choice in
        1) process_rot13 "$user_input" ;;
        2) process_base64 "$mode" "$user_input" ;;
        3) process_hex "$mode" "$user_input" ;;
        4) process_binary "$mode" "$user_input" ;;
        *) echo -e "\e[1;31mInvalid algorithm selection.\e[0m" ;;
    esac

    echo -e "\e[0m" # Reset terminal color
    echo "-------------------------------------"
    read -p "Press [Enter] to return to the main menu..." -r
done
