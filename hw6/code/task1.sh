#!/bin/bash

RAND=$((RANDOM%100+1))
ATTEMPTS=5

for (( i=$ATTEMPTS ; i > 0 ; i-- )); do

        read -p "Please enter a number from 1 to 100: " X

        # Check if user number is number and don not count invalid attempt
        if ! [[ $X =~ ^[0-9]+$ ]]; then
            echo "Будь ласка, введіть ціле число"
            (( i++ ))
            continue
        fi

        # Check if user nunber is valid number (1 - 100) and do not count invalid attempt
        if (( X < 1 || X > 100 )); then
           echo "Будь ласка, введіть число від 1 до 100"
           (( i++ ))
           continue
        fi

        # Gameplay ))
        if [[ $X -lt $RAND ]]; then
                echo "Занадто низько"
        elif [[ $X -gt $RAND ]]; then
                echo "Занадто високо"
        else
                echo "Вітаємо! Ви вгадали правильне число"
                exit 0
        fi
done

echo "Вибачте, у вас закінчилися спроби. Правильним числом було $RAND"
