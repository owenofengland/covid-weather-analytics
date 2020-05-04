import requests
import json
import csv
import datetime

darksky_secret = ""

def jhu_data():
    raw = requests.get("https://corona.lmao.ninja/jhucsse")
    data = json.loads(raw.text)
    usrecords = []
    for record in data:
        if record['country'] == "US":
            usrecords.append(record)
    return usrecords


def jhu_write_out(data_pointer):
    for_weather = []
    jhu_file_name = "jhu-%s.csv" % datetime.date.today()
    with open("/home/ubuntu/data/jhu/%s" % jhu_file_name, mode="w") as jhu_csv:
        jhu_writer = csv.writer(jhu_csv, delimiter=",",
                                quotechar='"', quoting=csv.QUOTE_MINIMAL)

        jhu_writer.writerow(["Time", "State", "Entity", "Confirmed",
                             "Deaths", "Recovered", "Latitude", "Longitude"])
        for record in data_pointer:
            time = record['updatedAt']
            state = record['province']
            entity = record['city']
            confirmed = record['stats']['confirmed']
            deaths = record['stats']['deaths']
            recovered = record['stats']['recovered']
            latitude = record['coordinates']['latitude']
            longitude = record['coordinates']['longitude']
            for_this_weather = {"state": state, "entity": entity,
                                "latitude": latitude, "longitude": longitude}
            for_weather.append(for_this_weather)
            try:
                jhu_writer.writerow([time, state, entity, confirmed, deaths,
                                     recovered, latitude, longitude])
            except Exception as e:
                print("Exception - not recorded\t", e)
    return for_weather


def weather_write_out(weather_basics):
    weather_file_name = "weather-%s.csv" % datetime.date.today()
    with open("/home/ubuntu/data/weather/%s" % weather_file_name, mode="w") as weather_csv:
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
    weather_basics = jhu_write_out(jhu_data())
    weather_write_out(weather_basics)
