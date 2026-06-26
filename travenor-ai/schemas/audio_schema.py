from pydantic import BaseModel

class AudioResponse(BaseModel):
    transcript: str
    locations: list[str]

class AudioRequest(BaseModel):
    audio_path: str