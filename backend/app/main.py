from fastapi import FastAPI
from faker import Faker

app = FastAPI()
fake = Faker()

@app.get("/weather")
def get_weather():
    return {
        "temperature": "30°C"
    }
