def count_characters(input_string):
    uppercase_count = 0
    lowercase_count = 0
    digit_count = 0
    punctuation_count = 0

    for char in input_string:
        if char.isupper():
            uppercase_count += 1
        elif char.islower():
            lowercase_count += 1
        elif char.isdigit():
            digit_count += 1
        elif char in '.,!?;:':
            punctuation_count += 1

    print(f"Количество букв в верхнем регистре: {uppercase_count}")
    print(f"Количество букв в нижнем регистре: {lowercase_count}")
    print(f"Количество цифр: {digit_count}")
    print(f"Количество символов пунктуации: {punctuation_count}")

# Пример использования:
user_input = input("Введите строку: ")
count_characters(user_input)
