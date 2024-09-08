# todo:
# 1. Создать бота в телеграме
# 2. Добавить переменные окружения
# 3. Добавить обработку ошибок (если город не найден)
# 4. Добавить логирование (c помощью logging)
# 5.* Добавить возможность отправки стикера по стране
# 6.** Добавить возможность вытягивать иконку погоды из апи погоды ("description":"overcast clouds","icon":"04n"})
# 7.** Добавить возможность отправки геолокации
# 8.** Добоавить кнопоки с городами  
# -------------
#. Добавить requirements.txt
#. Добавить Dockerfile

import os
import telebot
import requests
import json
import logging
from telebot import types
from dotenv import load_dotenv

load_dotenv()
# Настройка логирования
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

bot_token = os.getenv("bot_token")
weather_token = os.getenv("wapi_token")
bot = telebot.TeleBot(bot_token)



#обработка команды "/start"
@bot.message_handler(commands=['start'])
def start(message):
    logging.info(f"Команда /start от пользователя {message.chat.id}")
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    btn1 = types.KeyboardButton('Москва')
    btn2 = types.KeyboardButton('Минск')
    btn3 = types.KeyboardButton('Варшава')
    btn4 = types.KeyboardButton('Тель-Авив-Яффа')
    markup.add(btn1, btn2, btn3, btn4)
    bot.send_message(message.chat.id, "Привет! Я бот, который показывает погоду. Напиши мне название города и я покажу тебе погоду в нем.", reply_markup=markup)

@bot.message_handler(content_types=['text'])
def get_city_weather(message):
    city = message.text.strip().lower()
    logging.info(f"Получен запрос на погоду для города: {city}")

    # URL для получения данных о погоде
    res = requests.get(
        f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={weather_token}&units=metric&lang=ru')
    
    if res.status_code == 200:
        data = json.loads(res.text)
        logging.info(f"Успешно получены данные о погоде для города: {city}")
        bot.send_message(message.chat.id, f'Город: {data["name"]} \n'
                         f'Сейчас температура: {data["main"]["temp"]}°C\n'
                         f'Ощущается как: {data["main"]["feels_like"]}°C\n'
                         f'Давление: {data["main"]["pressure"]} hPa\n')
        icon_weather = data["weather"][0]["icon"]
        logging.info(f"Иконка погоды: {icon_weather}")
        bot.send_photo(message.chat.id, 
                       f'https://openweathermap.org/img/wn/{icon_weather}@2x.png')
    else:
        logging.error(
            f"Ошибка при получении данных о погоде для города: {city}, статус код: {res.status_code}")
        bot.reply_to(message, f'Город указан не верно')


@bot.message_handler(content_types=['location'])
def get_weather_by_location(message):
    latitude = message.location.latitude
    longitude = message.location.longitude
    logging.info(f"Получена геолокация: широта {latitude}, долгота {longitude}")
    
    # URL для получения данных о погоде по геолокации
    res = requests.get(
        f'http://api.openweathermap.org/data/2.5/weather?lat={latitude}&lon={longitude}&appid={weather_token}&units=metric&lang=ru')
    
    if res.status_code == 200:
        data = json.loads(res.text)
        logging.info(f"Успешно получены данные о погоде для координат: широта {latitude}, долгота {longitude}")
        bot.send_message(message.chat.id, f'Город: {data["name"]} \n'
                         f'Сейчас температура: {data["main"]["temp"]}°C\n'
                         f'Ощущается как: {data["main"]["feels_like"]}°C\n'
                         f'Давление: {data["main"]["pressure"]} hPa\n')
        
        icon_weather = data["weather"][0]["icon"]
        logging.info(f"Иконка погоды: {icon_weather}")
        bot.send_photo(message.chat.id, 
                       f'https://openweathermap.org/img/wn/{icon_weather}@2x.png')
    else:
        logging.error(f"Ошибка при получении данных о погоде для координат: широта {latitude}, долгота {longitude}, статус код: {res.status_code}")
        bot.reply_to(message, f'Не удалось получить данные о погоде для вашей геолокации')

bot.infinity_polling()