def replace_vowels_with_dash(input_string):
    vowels = "aeiouAEIOUаеёиоуыэюяАЕЁИОУЫЭЮЯ"
    result = ""
    for char in input_string:
        if char in vowels:
            result += "-"
        else:
            result += char
    return result

user_input = input("Введите текст: ")
output_string = replace_vowels_with_dash(user_input)
print("Результат замены гласных на '-':", output_string)
