import random
import datetime
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from faker import Faker

app = FastAPI()
fake = Faker()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
@app.get("/weather")
def get_weather():
    today = datetime.date.today()
    day_name = today.strftime("%A") 
    temperature = round(random.uniform(25, 37), 1) 
    humidity = f"{random.randint(40, 90)} %"
    wind_speed = f"{random.randint(5, 20)} km/h"
    raining = random.choice([True, False])
    cloudy = random.choice([True, False])


    weekly = {}
    days_of_week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    for day in days_of_week:
        if day == day_name:

            weekly[day] = f"{temperature} °C"
        else:

            weekly[day] = f"{round(random.uniform(25, 37), 1)} °C"

 
    hourly = {}
    for hour in range(24):
        hourly[f"{hour}:00"] = round(random.uniform(20, 35), 1)

    return {
        "date": str(today),
        "day": day_name,
        "temperature": f"{temperature} °C",
        "humidity": humidity,
        "wind_speed": wind_speed,
        "raining": raining,
        "cloudy": cloudy,
        "weekly": weekly,
        "hourly": hourly
    }
