from fastapi import FastAPI
from models.request_models import ( ItineraryRequest )
from schemas.audio_schema import ( AudioRequest )
from routes.audio_route import router
from services.itenary_services import ( generate_itinerary )
from services.audio_processing_service import ( process_audio )

app = FastAPI()


@app.get("/")
def health_check():
    return {
        "message": "Itinerary Service Running"
    }


@app.post("/itinerary/generate")
def create_itinerary(
    request: ItineraryRequest
):
    return generate_itinerary(
        request
    )


@app.post("/audio/extract-locations")
def extract_locations(
    request: AudioRequest
):
    return process_audio(request)