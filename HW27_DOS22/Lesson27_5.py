def are_elements_unique(tup):
    return len(tup) == len(set(tup))

# Ввод кортежа с клавиатуры
user_input = input("Введите элементы кортежа через пробел: ")
# my_tuple = tuple(map(int, user_input.split(' ')))

# Проверка на пустую строку
if not user_input.strip():
    print("Вы ввели пустую строку. Пожалуйста, введите хотя бы один элемент.")
else:
    my_tuple = tuple(map(int, user_input.split()))
    result = are_elements_unique(my_tuple)
    print(f"Все элементы уникальны: {result}")

# result = are_elements_unique(my_tuple)
# print(f"Все элементы уникальны: {result}")
