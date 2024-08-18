import os

def ping_ip_addresses(ip_addresses, output_file):
    with open(output_file, 'w') as f:
        for ip in ip_addresses:
            response = os.system(f"ping -c 1 {ip}")
            if response == 0:
                f.write(f"{ip} is up\n")
            else:
                f.write(f"{ip} is down\n")

# Пример использования:
ip_list = ['10.40.161.2', '10.40.161.3', '10.40.161.4', '10.40.161.5']
output_filename = 'ping_results.txt'
ping_ip_addresses(ip_list, output_filename)
print(f"Результаты пинга сохранены в файле {output_filename}")
