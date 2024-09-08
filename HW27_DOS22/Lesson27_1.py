# -*- coding: utf-8 -*-

import os
# import sys
# sys.stdout.reconfigure(encoding='utf-8')

# iplist = input('Ввидите IP-адреса через пробел: ').split()
# print (iplist)
# int_list = [int(ip) for ip in iplist]
# for i in range(len(iplist)):
#     iplist[i] = int(iplist[i])
# int_iplist = ''.join(map(str,iplist))
# int2_iplist = int(int_iplist)
# print (iplist)
# print (int_list)
# print (int2_iplist)


# попытка 2
# iplist = input('Введите IP-адреса через пробел: ').split()
# int_list = [int(ip) for ip in iplist]
# print(int_list)


# попытка 3 
# result = subprocess.run([iplist])

# Запрашиваем IP-адреса через пробел
ip_list = input('Ввидите IP-адреса через пробел: ').split()
# response = os.system("ping " + hostname[2])

# Пингуем каждый IP-адрес
for ip in ip_list:
    response = os.popen(f"ping -c 4 {ip}").read() # 4 пакета только, чтобы время экономить

    # Сохраняем результаты в файл
    with open("ip_output.txt", "a") as file:
        if "Request timed out." in response or "unreachable" in response:
            print(f"{ip} - соединение отсутствует")
            file.write(f"{ip} - соединение отсутствует\n")
        else:
            print(f"{ip} - доступен")
            file.write(f"{ip} - доступен\n")

# Выводим результаты на экран
with open("ip_output.txt") as file:
    output = file.read()
    print("\nРезультаты пинга:\n" + output)

# for ip, result in results.items():
#     print(f'{ip}: {result}')
# if response == 0:
#     print (hostname ,("is up"))

# else:
#     print (hostname, ("is down"))
# В итоге эта срань работает ;), но оказалось труднее чем думал))
