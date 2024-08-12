# Привет, мир!
print ('Привет, мир!')

# результат вычесления 2+2
print (2+2)

a = input('Ваше имя: ')
print(f'Привет, {a}!')

# в столбик вывод чисел до 10
for i in range(1, 11):
    print(i)

# в строку вывод чисел до 10   
print(*range(1, 11), sep=' ')

# Мой возраст
b = input('Ваш возраст: ')
print(f'Ваш возраст, {b} лет')


# произведение двух чисел
print('произведение двух чисел: ')
q = input()
w = input()
q_int = int(q)
w_int = int(w)
prod = (q_int * w_int)
print (prod)

# Первая буква слова
word = input("Введите слово: ")
first_letter = word[0]
print("Первая буква слова:", first_letter)

# квадрат числа
r = int(input("Узнаем число из квадрата: "))
t = r ** 2
print(f'Квадрат числа {r} это {t}')

# корень числа
y = int(input("Узнаем корень числа: "))
u = y ** 0.5
print(f'Корень числа {y} это {u}')

# Таблица умножения на 5
for o in range(5, 6):
    for p in range(1, 11):
        result = o * p
        print(f"{o} * {p} = {result}")

# Среднее арифметическое из двух чисел
print ('Среднее арифметическое из двух чисел')
g = int(input ('введите первое: '))
h = int(input ('введите второе: '))
result = ((g + h) / 2)
print (result)