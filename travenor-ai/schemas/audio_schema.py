from pydantic import BaseModel

class AudioResponse(BaseModel):
    transcript: str
    locations: list[str]

class AudioRequest(BaseModel):
    meeting_id: str
    audio_path: str