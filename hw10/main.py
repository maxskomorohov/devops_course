import random

def run_game():
    attempts = 5
    numbers_min = 1
    numbers_max = 100

    # Генеруємо випадкове число
    secret_number = random.randint(numbers_min, numbers_max)

    while attempts > 0:
        user_input = input(f"Введіть число від {numbers_min} до {numbers_max}: ")

        # Валідація вводу користувача
        try:
            user_input = int(user_input)
            # Перевірка чи число користувача знаходиться в межах нашого інтервалу або помилка
            if user_input < numbers_min or user_input > numbers_max:
                raise ValueError
        except ValueError:
            print(f"Число має бути від {numbers_min} до {numbers_max}")
            continue

        # Умови гри
        if user_input < secret_number:
            print("Занадто низько")
        elif user_input > secret_number:
            print("Занадто високо")
        else:
            print("Вітаємо! Ви вгадали правильне число")
            return

        attempts -= 1
    else:
        # Якщо спроби закінчилися, виводимо фінальне повідомлення
        print(f"Вибачте, у вас закінчилися спроби. Правильний номер був {secret_number}")

run_game()
