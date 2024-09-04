# 7156087184:AAEFTag_octMunTyPPFXPoKZTPqPJUqA2SM мой API

import json
import urllib.request
import os
from dotenv import load_dotenv

load_dotenv()
weather_token = os.getenv("wapi_token")

def get_weather(city, token):
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={token}&units=metric"
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read())
        print(data)
        city_name = data['name']
        temperature = data['main']['temp']
        pressure = data['main']['pressure']
        # print(f"Город: {city_name}")
        # print(f"Температура: {temperature}°C")
        # print(f"Давление: {pressure} hPa")
        return {
            "temp": temperature,
            "pressure": pressure,
            "city": city_name
        }
        
# {"temp": <>, "pressure": <>, city: <>}

if __name__ == "__main__":
    city = "Minsk"
    # weather_token = "5fc2ed7f68e9666415be2eda46a79a12"
    # os.getenv("wapi_token") #5fc2ed7f68e9666415be2eda46a79a12
    print(get_weather(city, weather_token))