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

b = input('Ваш возраст: ')
print(f'Ваш возраст, {b} лет')



print('произведение двух чисел: ')
q = input()
w = input()
q_int = int(q)
w_int = int(w)
prod = (q_int * w_int)
print (prod)


word = input("Введите слово: ")
first_letter = word[0]
print("Первая буква слова:", first_letter)
