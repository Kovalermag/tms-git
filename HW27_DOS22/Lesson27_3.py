def common_elements(list1, list2):
    # Возвращает список элементов, которые присутствуют в обоих списках.
    common = set(list1) & set(list2)
    return list(common)

list1 = input('Введите список №1: ')
list2 = input('Введите список №2: ')

result = common_elements(list1, list2)
print("Общие элементы:", result)
