def sort_descending(numbers):
    sorted_numbers = sorted(numbers, reverse=True, key=float)
    return sorted_numbers



# почему это не сработало ?? 
    # numbers.sort(reverse=True)
    # return numbers



input_numbers = input('Ввидите числа которые следует сортировать: ')

# тут GPT подсказал как с не целыми числами
# sorted_numbers = sort_descending(input_numbers)

numbers_list = list(map(float, input_numbers.split()))

sorted_numbers = sort_descending(numbers_list)
print("Отсортированный массив (по убыванию):", sorted_numbers)
