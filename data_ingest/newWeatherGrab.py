#!/usr/bin/python

import requests
import json
import csv
import datetime

darksky_secret = ""


def less_than_ten(num):
    if num < 10:
        num = "0" + str(num)
    return str(num)


def get_us_lat_long():
    today = datetime.date.today()
    month = less_than_ten(today.month)
    day = less_than_ten(today.day)
    year = less_than_ten(today.year)
    file_name = month + "-" + day + "-" + year + ".csv"
    full_path = "/home/ubuntu/data/jhu/%s" % file_name
    out_data = []
    with open(full_path, "r") as covid:
        lines = covid.readlines()
        for line in lines:
            line = line.split(",")
            if line[3] == "US":
                state = line[2]
                entity = line[1]
                latitude = line[5]
                longitude = line[6]
                this_record = {"state": state, "entity": entity,
                               "latitude": latitude, "longitude": longitude}
                out_data.append(this_record)
    return out_data


def weather_write_out(weather_basics):
    date_out = str(datetime.date.today())
    weather_file_name = "weather-" + date_out + ".csv"
    full_path = "/home/ubuntu/data/weather/%s" % weather_file_name
    with open(full_path, mode="w") as weather_csv:
        weather_writer = csv.writer(
            weather_csv, delimiter=",", quotechar='"', quoting=csv.QUOTE_MINIMAL)
        weather_writer.writerow(["Date", "State", "Entity", "Latitude", "Longitude",
                                 "Precipitation Type", "Temperature Low", "Temperature High", "Temperature Min",
                                 "Temperature Max", "Dew Point", "Wind Speed", "Wind Bearing", "Wind Gust",
                                 "Pressure", "Cloud Cover", "Humidity", "Ozone", "Visibility", "UV Index"])
        count = 1
        for record in weather_basics:
            print(count)
            date = datetime.date.today()
            state = record['state']
            entity = record['entity']
            latitude = record['latitude']
            longitude = record['longitude']
            raw = requests.get("https://api.darksky.net/forecast/%s/%s,%s?exclude=currently,minutely,hourly,alerts,flags" %
                               (darksky_secret, latitude, longitude))
            try:
                data = json.loads(raw.text)
                data = data['daily']['data'][0]
            except:
                continue
            try:
                precipType = data["precipType"]
            except:
                precipType = ""
            try:
                temperatureLow = data["temperatureLow"]
            except:
                temperatureLow = ""
            try:
                temperatureHigh = data["temperatureHigh"]
            except:
                temperatureHigh = ""
            try:
                temperatureMin = data["temperatureMin"]
            except:
                temperatureMin = ""
            try:
                temperatureMax = data["temperatureMax"]
            except:
                temperatureMax = ""
            try:
                dewPoint = data["dewPoint"]
            except:
                dewPoint = ""
            try:
                windSpeed = data["windSpeed"]
            except:
                windSpeed = ""
            try:
                windBearing = data["windBearing"]
            except:
                windBearing = ""
            try:
                windGust = data["windGust"]
            except:
                windGust = ""
            try:
                pressure = data["pressure"]
            except:
                pressure = ""
            try:
                cloudCover = data["cloudCover"]
            except:
                cloudCover = ""
            try:
                humidity = data["humidity"]
            except:
                humidity = ""
            try:
                ozone = data["ozone"]
            except:
                ozone = ""
            try:
                visibility = data["visibility"]
            except:
                visibility = ""
            try:
                uvindex = data["uvIndex"]
            except:
                uvIndex = ""
            try:
                weather_writer.writerow([date, state, entity, latitude,
                                         longitude, precipType, temperatureLow, temperatureHigh, temperatureMin,
                                         temperatureMax, dewPoint, windSpeed, windBearing, windGust, pressure,
                                         cloudCover, humidity, ozone, visibility, uvindex])
            except Exception as e:
                print("Exception - not recorded - error in weather API\n\n", e)
            count += 1


if __name__ == "__main__":
    weather_basics = get_us_lat_long()
    weather_write_out(weather_basics)

